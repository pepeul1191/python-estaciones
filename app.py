from bottle import Bottle, run
from views.archivo import archivo_view

root_view = Bottle()

@root_view.route('/hello')
def hello():
	return "Hello Worlxdd!"

if __name__ == '__main__':
	root_view.merge(archivo_view)
	root_view.run(host='localhost', port=8080, debug=True, reloader=True)
