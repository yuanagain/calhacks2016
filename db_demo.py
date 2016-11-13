## db_demo.py
## CalHacks 2016
## Author: Yuan Wang
import sqlite3
import sys

def initialize():
	"""
	Set shit up
	"""
	conn = sqlite3.connect('data.db')
	c = conn.cursor()
	c.execute('''CREATE TABLE data
	             (
	             id integer primary key, 
	             timestamp text, 
	             prodtime real, 
	             nulltime real
	             )''')

	conn.commit()
	conn.close()


def insert(data):
	conn = sqlite3.connect('data.db')
	c = conn.cursor()
	# Insert a row of data
	c.execute("INSERT INTO data VALUES ('2006-01-05','BUY','RHAT',100,35.14)")

	conn.commit()
	conn.close()

def fetch(keys, values):
	return

def main(argv):
	print("TESTING")

if __name__=="__main__":
	main(sys.argv)