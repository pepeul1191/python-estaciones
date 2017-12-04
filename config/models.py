# -*- coding: utf-8 -*-
from sqlalchemy import Table, Column, Integer, String, ForeignKey, Float
from config.database import Base
# http://docs.sqlalchemy.org/en/latest/orm/basic_relationships.html
class UnidadMedida(Base):
	__tablename__ = 'unidad_medidas'
	id = Column(Integer, primary_key=True)
	nombre = Column(String)
	simbolo = Column(String)

class TipoEstacion(Base):
	__tablename__ = 'tipo_estaciones'
	id = Column(Integer, primary_key=True)
	nombre = Column(String)