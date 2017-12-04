#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from bottle import Bottle, request
from sqlalchemy.sql import select
from config.models import Estacion
from config.database import engine, session_db

estacion_view = Bottle()

@estacion_view.route('/listar', method='GET')
def listar():
	conn = engine.connect()
	stmt = select([Estacion])
	return json.dumps([dict(r) for r in conn.execute(stmt)])