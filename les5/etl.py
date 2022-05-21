import psycopg2

db_1_connection = "host='localhost' port=54320 dbname='my_database' user='root' password='postgres'"
db_2_connection = "host='localhost' port=5433 dbname='my_database' user='root' password='postgres'"
tables = ['customer','lineitem','nation','orders','part','partsupp','region','supplier']


def dump(conn_string, tables):
    with psycopg2.connect(conn_string) as conn, conn.cursor() as cursor:
        for table in tables:
            q = f"COPY {table} TO STDOUT WITH DELIMITER ',' CSV HEADER;"
            with open(f'{table}.csv', 'w') as csv_file:
                cursor.copy_expert(q, csv_file)


def in_db(conn_string, tables):
    with psycopg2.connect(conn_string) as conn, conn.cursor() as cursor:
        for table in tables:
            q = f"COPY {table} from STDIN WITH DELIMITER ',' CSV HEADER;"
            with open(f'{table}.csv', 'r') as csv_file:
                cursor.copy_expert(q, csv_file)




dump(db_1_connection, tables)
in_db(db_2_connection, tables)