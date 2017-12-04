#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from bottle import Bottle, request
from sqlalchemy.sql import select
from config.models import UnidadMedida
from config.database import engine, session_db

unidad_medida_view = Bottle()

@unidad_medida_view.route('/listar', method='GET')
def extension_listar():
	conn = engine.connect()
	stmt = select([UnidadMedida])
	return json.dumps([dict(r) for r in conn.execute(stmt)])