#!/usr/bin/env python
# -*- coding: utf-8 -*-
from bottle import Bottle, run, HTTPResponse
from views.imagen import imagen_view

app = Bottle()

@app.route('/')
def index():
	the_body = 'Error : URI vacía'
	return HTTPResponse(status=404, body=the_body)

@app.route('/test/conexion')
def test_conexion():
	return 'Ok'

if __name__ == '__main__':
	app.merge(imagen_view)
	app.run(host='localhost', port=3031, debug=True)