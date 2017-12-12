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