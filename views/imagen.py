from bottle import Bottle
from config.database import backend as DB
from config.models import Imagen

imagen_view = Bottle()

@imagen_view.route('/imagen/subir')
def imagen_view_subir():
	nueva_imagen = Imagen({'name': 'The Godfather','year':1972,'pk':1L})
	nueva_imagen.save(DB)
	return 'imagen_view_subir'