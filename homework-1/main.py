"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv

import psycopg2

conn = psycopg2.connect(database="north", user="postgres", password="159763")
try:
    with conn:
        with conn.cursor() as cur:
            with open('north_data/customers_data.csv') as cust_file:
                next(cust_file)
                reader = csv.reader(cust_file)
                for line in reader:
                    cur.execute("INSERT INTO customers VALUES (%s, %s, %s)", (line[0], line[1], line[2]))
            with open('north_data/employees_data.csv') as cust_file:
                next(cust_file)
                reader = csv.reader(cust_file)
                for line in reader:
                    cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)",
                                (line[0], line[1], line[2], line[3], line[4], line[5]))
            with open('north_data/orders_data.csv') as cust_file:
                next(cust_file)
                reader = csv.reader(cust_file)
                for line in reader:
                    cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)",
                                (line[0], line[1], line[2], line[3], line[4]))
finally:
    conn.close()