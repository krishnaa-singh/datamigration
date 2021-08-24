import logging
import sys

import psycopg2

logger = logging.getLogger(__name__)

print('Start Script fetch column according to table name')
logger.info(sys.argv)
# db_host = sys.argv[1]
# db_user = sys.argv[2]
# db_pass = sys.argv[3]
# db_port = sys.argv[4]
# db_name = sys.argv[5]
# current_dir = sys.argv[6]
# destination_db = sys.argv[7]
data_table_list = ['ir_module_module_dependency', 'ir_module_category', 'ir_module_module', 'ir_model',
                   'ir_model_fields', 'ir_model_fields_group_rel', 'ir_model_fields_selection', 'ir_model_constraint',
                   'ir_model', 'ir_model_relation', 'ir_model_access', 'ir_ui_menu', 'wizard_ir_model_menu_create',
                   'ir_ui_menu_group_rel', 'ir_ui_view_custom', 'ir_ui_view_group_rel', 'ir_actions', 'ir_act_window',
                   'ir_act_window_group_rel', 'ir_act_window_view', 'ir_act_url', 'ir_act_server', 'rel_server_actions',
                   'ir_act_server_group_rel', 'ir_server_object_lines', 'ir_actions_todo', 'ir_act_client',
                   'ir_act_report_xml', 'res_groups_report_rel', 'ir_module_module_exclusion', 'ir_model_data'
                   ]


db_host = '127.0.0.1'  # sys.argv[1]
db_user = 'odoo'  # sys.argv[2]
db_pass = 'odoo'  # sys.argv[3]
db_port = '5432'  # sys.argv[4]
db_name = 'stellar_pro_test'  # sys.argv[5]
current_dir = '/home/ksolves/odoo-erp/stellar/base_migration_script_1/base_migration_script'  # sys.argv[6]
destination_db = 'stellar_pro_final'
odoo_table_list = ['sale_order']


def get_source_connection():
    conn = psycopg2.connect(database=db_name, user=db_user, password=db_pass, host=db_host, port=db_port)
    print('Database connected')
    return conn


def get_destination_connection():
    conn2 = psycopg2.connect(database=destination_db, user=db_user, password=db_pass, host=db_host, port=db_port)
    print('Destination Database connected')
    return conn2


def get_source_table_list():
    conn = get_source_connection()
    cur = conn.cursor()
    cur.execute("""SELECT table_name FROM information_schema.tables where table_schema='public'""")
    result = cur.fetchall()
    table_list = []
    for i in result:
        table_name = list(i)[0]
        if not table_name.startswith('pg') and not table_name.startswith('_pg_'):
            table_list.append(table_name)
    conn.close()
    return table_list


def get_source_column_list(table=None):
    s_conn = get_source_connection()
    s_cur = s_conn.cursor()
    query = """SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '%s'""" % table
    s_cur.execute(query)
    s_result = s_cur.fetchall()
    table_list = []
    for i in s_result:
        table_name = list(i)[0]
        table_list.append(table_name)
    return table_list


def get_destination_column_list():
    d_conn = get_destination_connection()
    d_cur = d_conn.cursor()
    d_cur.execute("""SELECT table_name FROM information_schema.tables where table_schema='public'""")
    table_result = d_cur.fetchall()
    table_list = []
    for i in table_result:
        table_name = list(i)[0]
        table_list.append(table_name)
    final_column_data = {}
    filename = current_dir + '/missing-columns.txt'
    source_table_list = get_source_table_list()
    with open(filename, 'w') as file:
        for table in table_list:
            column_list = []
            if table in data_table_list or table not in source_table_list:
                logger.info(table)
                print(table)
                continue
            s_result = get_source_column_list(table)
            query = """SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '%s'""" % table
            d_cur.execute(query)
            d_result = d_cur.fetchall()
            for column in d_result:
                if column[0] in s_result:
                    if column[0] != 'default':
                        column_list.append(column[0])
                else:
                    file.write('%s, ' % column[0])
            file.write('Columns are missing in %s \n\n' % table)
            final_column_data[table] = column_list
            # print(final_column_data)
    file.close()
    return final_column_data


def get_column_list():
    print("call")
    final_columns = get_destination_column_list()
    create_post2_script(final_columns)


def create_post2_script(final_columns):
    filename = current_dir + '/02-sql-script.sql'
    tables = final_columns.keys()
    # print(final_columns)
    with open(filename, 'w') as file:
        for table in tables:
            if len(final_columns[table]) > 1:
                query = get_insert_query(table, final_columns[table])
            else:
                query = False
            if not query:
                continue
            if table == 'res_groups_users_rel':
                file.write(query)
            else:
                file.write('\nALTER TABLE %s DISABLE TRIGGER ALL;' % table)
                file.write(query)
                if 'id' in final_columns[table]:
                    file.write(
                        "\nSELECT pg_catalog.setval('%s_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM %s) x;" % (
                            table, table))
                file.write('\nALTER TABLE %s ENABLE TRIGGER ALL;' % table)
            file.write('\n')
    file.close()


def get_insert_query(table, final_columns):
    logger.info(table, final_columns)
    if table == 'res_groups_users_rel':
        query = """\nINSERT INTO public.res_groups_users_rel(uid, gid) \nSELECT DISTINCT pu.id, pg.id FROM public.res_groups pg \nINNER JOIN migrate.res_groups mg ON pg.name = mg.name and COALESCE(pg.comment, '') = COALESCE(mg.comment, '') \nINNER JOIN public.res_users pu ON TRUE \nINNER JOIN migrate.res_users mu ON pu.login = mu.login \nINNER JOIN migrate.res_groups_users_rel mgu ON mg.id = mgu.gid AND mu.id = mgu.uid \nWHERE NOT EXISTS (SELECT 1 FROM public.res_groups_users_rel e WHERE e.uid = pu.id AND e.gid = pg.id);"""
    elif 'id' not in final_columns:
        query = """\nINSERT INTO %s ( %s ) \nSELECT %s FROM migrate.%s \nWHERE NOT EXISTS (SELECT 1 FROM %s WHERE %s=migrate.%s.%s AND %s=migrate.%s.%s);""" % (
            table, ', '.join(map(str, final_columns)), ', '.join(map(str, final_columns)), table, table, final_columns[0], table, final_columns[0], final_columns[1], table, final_columns[1]
        )
    elif table in ['res_country', 'res_country_state']:
        query = """\nINSERT INTO %s ( %s ) \nSELECT %s FROM migrate.%s \nWHERE NOT EXISTS (SELECT 1 FROM %s WHERE code=migrate.%s.code);""" % (
            table, ', '.join(map(str, final_columns)), ', '.join(map(str, final_columns)), table, table, table
        )
    else:
        query = """\nINSERT INTO %s ( %s ) \nSELECT %s FROM migrate.%s \nWHERE NOT EXISTS (SELECT 1 FROM %s WHERE id=migrate.%s.id);""" % (
            table, ', '.join(map(str, final_columns)), ', '.join(map(str, final_columns)), table, table, table
        )

    return query


get_column_list()
