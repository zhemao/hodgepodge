#!/usr/bin/env python

from pymongo import Connection
import json
import sys

def read_file(fname):
	f = open(fname)
	res = json.load(f)
	f.close()
	return res

def connect(settings):
	conn = Connection(settings['host'], settings['port'])
	db = conn[settings['database']]
	if 'username' in settings:
		authorized = db.authenticate(settings['username'], settings['password'])
		if not authorized:
			print("You are not authorized to access this database")
			exit()
	return db[settings['collection']]

def migrate(settings):
	fromcoll = connect(settings['from'])
	tocoll = connect(settings['to'])
	query = settings['from'].get('query', {})
	docs = [doc for doc in fromcoll.find(query)]
	if len(docs)==0:
		print("No documents found")
		exit()
	for doc in docs:
		del doc['_id']
	if tocoll.insert(docs):
		print("Migration successful")
	else: print("Migration failed")

if __name__ == "__main__":
	fname = "migration.json"
	if len(sys.argv) > 1:
		fname = sys.argv[1]
	settings = read_file(fname)
	migrate(settings)
	
