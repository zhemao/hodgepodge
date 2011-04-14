import os, sys

def import_right(name):
	'''__import__ done correctly. For some reason, using __import__ on
	package.module returns the module corresponding to package/__init__.py,
	not package/module.py as expected. The correct module is in sys.modules,
	but isn't placed there until __import__ has been called'''
	__import__(name)
	return sys.modules[name]

def load_object(name):
	'''Load the object given by a dotted python path'''
	ind = name.rfind('.')
	modname = name[:ind]
	objname = name[ind+1:]
	mod = import_right(modname)
	return getattr(mod, objname)
