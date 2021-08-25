import sys

import psycopg2

print('Start Python Script')
print(sys.argv)
db_host = sys.argv[1]
db_user = sys.argv[2]
db_pass = sys.argv[3]
db_port = sys.argv[4]
db_name = sys.argv[5]
current_dir = sys.argv[6]


def get_connection():
    conn = psycopg2.connect(database=db_name, user=db_user, password=db_pass, host=db_host, port=db_port)
    print('Database connected')
    return conn


def get_table_list():
    conn = get_connection()
    cur = conn.cursor()
    cur1 = conn.cursor()
    cur.execute("""SELECT table_name FROM information_schema.tables where table_schema='public'""")
    result = cur.fetchall()
    cur1.execute("""select sequence_name from information_schema.sequences where sequence_schema='public'""")
    result1 = cur1.fetchall()
    table_list = []
    filename = current_dir + '/01-sql-script.sql'
    with open(filename, 'w') as file:
        file.write('CREATE SCHEMA migrate;')
        for i in result:
            table_name = list(i)[0]
            if not table_name.startswith('pg') and not table_name.startswith('_pg_'):
                table_list.append(table_name)
                file.write('\nALTER TABLE IF EXISTS %s SET SCHEMA migrate;' % table_name)
        for i in result1:
            table_name = list(i)[0]
            if not table_name.startswith('pg') and not table_name.startswith('_pg_'):
                file.write('\nALTER SEQUENCE IF EXISTS %s SET SCHEMA migrate;' % table_name)
    file.close()
    filename1 = current_dir + '/table_list.txt'
    with open(filename1, 'w') as file1:
        for table_name in table_list:
            file1.write(table_name + '\n')
    file1.close()
    conn.close()    
    return table_list


get_table_list()
# sys.exit(get_table_list())
