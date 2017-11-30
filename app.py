#!/usr/bin/env python
# -*- coding: utf-8 -*-
from bottle import Bottle, run, HTTPResponse, static_file
from views.imagen import imagen_view
from views.extension import extension_view

app = Bottle()

@app.route('/')
def index():
	the_body = 'Error : URI vacía'
	return HTTPResponse(status=404, body=the_body)

@app.route('/test/conexion')
def test_conexion():
	return 'Ok'

@app.route('/:filename#.*#')
def send_static(filename):
  return static_file(filename, root='./static/')

if __name__ == '__main__':
	app.mount('/imagen', imagen_view)
	app.mount('/extension', extension_view)
	app.run(host='localhost', port=3031, debug=True, reloader=True)