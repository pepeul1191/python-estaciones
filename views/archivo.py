from bottle import Bottle

archivo_view = Bottle()

@archivo_view.route('/archivo/subir')
def archivo_view_subir():
	return 'archivo_view_subir'