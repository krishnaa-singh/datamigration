import sys

import psycopg2

print('Start Script fetch column according to table name')
print(sys.argv)
db_host = sys.argv[1]
db_user = sys.argv[2]
db_pass = sys.argv[3]
db_port = sys.argv[4]
db_name = sys.argv[5]
current_dir = sys.argv[6]
destination_db = sys.argv[7]
data_table_list = ['ir_module_module_dependency', 'ir_module_category', 'ir_module_module', 'ir_model',
                   'ir_model_fields', 'ir_model_fields_group_rel', 'ir_model_fields_selection', 'ir_model_constraint',
                   'ir_model', 'ir_model_relation', 'ir_model_access', 'ir_ui_menu', 'wizard_ir_model_menu_create',
                   'ir_ui_menu_group_rel', 'ir_ui_view_custom', 'ir_ui_view_group_rel', 'ir_actions', 'ir_act_window',
                   'ir_act_window_group_rel', 'ir_act_window_view', 'ir_act_url', 'ir_act_server', 'rel_server_actions',
                   'ir_act_server_group_rel', 'ir_server_object_lines', 'ir_actions_todo', 'ir_act_client',
                   'ir_act_report_xml', 'res_groups_report_rel', 'ir_module_module_exclusion', 'ir_model_data'
                   ]
# db_host = '127.0.0.1'  # sys.argv[1]
# db_user = 'tushar'  # sys.argv[2]
# db_pass = 'tushar'  # sys.argv[3]
# db_port = '5432'  # sys.argv[4]
# db_name = 'odoo_v13'  # sys.argv[5]
# current_dir = '/home/ksolves/Documents/migration-script-13to14/migration-script/base_migration_script'  # sys.argv[6]
# destination_db = 'odoo_v14'
# odoo_table_list = ['sale_order']

print("db_user::::final:::::::::::", db_user)
print("db_name::::final:::::::::::", db_name)
print("db_pass::::final:::::::::::", db_pass)


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
    final_columns = get_destination_column_list()
    create_post2_script(final_columns)


def create_post2_script(final_columns):
    filename = current_dir + '/final-sql-script.sql'
    tables = final_columns.keys()
    print(final_columns)
    with open(filename, 'w') as file:
        for table in tables:
            query = get_update_query(table, final_columns[table])
            file.write(query)
            file.write('\n')
    file.close()


def get_update_query(table, columns):
    column_data = dict()
    for column in columns:
        key = '%s = migrate.%s.%s' % (column, table, column)
        column_data[key] = 0

    query = """UPDATE public.%s
     SET %s FROM migrate.%s \nWHERE public.%s.id=migrate.%s.id;""" % (
        table, ', '.join("%s" % u for u in column_data.keys()), table, table, table)

    return query


def get_sequence_list():
    create_ir_sequence_script()


def create_ir_sequence_script():
    filename = current_dir + '/ir-sequence-sql-script.sql'
    s_conn = get_source_connection()
    s_cur = s_conn.cursor()
    s_cur.execute("""select * from pg_sequences where sequencename ~ '^ir_sequence_0'""")
    result = s_cur.fetchall()
    with open(filename, 'w') as file:
        for seq in result:
            select_query = """\nSELECT setval('public.%s', %s, true);""" % (seq[1], seq[-1])
            alter_query = """\nALTER SEQUENCE public.%s
                                    INCREMENT %s
                                    START %s
                                    MINVALUE %s
                                    MAXVALUE %s
                                    CACHE %s;""" % (seq[1],seq[7],seq[4],seq[5],seq[6],seq[9])
            file.write(select_query)
            file.write(alter_query)
        file.close()


# get_column_list()
get_sequence_list()
