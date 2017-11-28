#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from bottle import Bottle
from config.models import imagenes
from config.database import generator_id

imagen_view = Bottle()

@imagen_view.route('/imagen/crear', method='POST')
def imagen_view_subir():
	_id = generator_id()
	imagenes.insert({'id': _id, 'type': 'apple', 'count': 7})
	return _id

@imagen_view.route('/imagen/listar', method='GET')
def imagen_view_listar():
	return json.dumps(imagenes.all())