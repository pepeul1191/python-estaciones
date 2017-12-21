#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from bottle import Bottle, request
from sqlalchemy.sql import select
from config.models import Sensor
from config.database import engine, session_db

sensor_view = Bottle()

@sensor_view.route('/listar', method='GET')
def listar():
	conn = engine.connect()
	stmt = select([Sensor])
	return json.dumps([dict(r) for r in conn.execute(stmt)])

@sensor_view.route('/listar/<estacion_id>', method='GET')
def listar_estacion(estacion_id):
	conn = engine.connect()
	stmt = """
		SELECT S.id, S.nombre, S.descripcion, U.simbolo 
		FROM sensores S INNER JOIN unidad_medidas U ON U.id = S.unidad_medida_id
		WHERE S.estacion_id = :estacion_id
		"""
	return json.dumps([dict(r) for r in conn.execute(stmt, {'estacion_id' : estacion_id})])