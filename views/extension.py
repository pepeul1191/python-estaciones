#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from bottle import Bottle, request
from config.models import extensiones
from tinydb import Query

extension_view = Bottle()

@extension_view.route('/obtener/<extension_id>', method='GET')
def extension_obtener(extension_id):
	Extension = Query()
	tmp = extensiones.search(Extension.id == int(extension_id))
	rpta = None
	if tmp == []:
		rpta = ''
	else:
		rpta = tmp[0] 
	return rpta

@extension_view.route('/listar', method='GET')
def extension_listar():
	return json.dumps(extensiones.all())