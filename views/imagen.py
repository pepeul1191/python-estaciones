#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from bottle import Bottle, request
from config.models import imagenes
from config.database import generator_id

imagen_view = Bottle()

@imagen_view.route('/imagen/crear', method='POST')
def imagen_subir():
	rpta = None
	try:
		imagen = json.loads(request.query.data)
		imagenes.insert(imagen)
		rpta = {'tipo_mensaje' : 'success', 'mensaje' : ['Se ha registrado una nueva imagen', imagen['id']]}
	except TypeError:
		rpta = {'tipo_mensaje' : 'error', 'mensaje' : ['Se ha producido un error en guardar la imagen', str(e)]}
	
	return json.dumps(rpta)

@imagen_view.route('/imagen/obtener_id', method='GET')
def imagen_obtener_id():
	return generator_id()

@imagen_view.route('/imagen/listar', method='GET')
def imagen_listar():
	return json.dumps(imagenes.all())