## Boilerplate Flask Python

Requisitos de software previamente instalado:

	+ Python 2.7
	+ Python PIP

### Descipción

Instalación de dependencias:

	$ sudo pip install -r requirements.txt

## Pruebas de Comportamiento

Ejecutar
  $ cd test/rspec
  $ rspec spec responsable.rb

### Rutas

	+ GET -> / : IndexController#index
	+ GET -> /error/404 : ErrorController#error_404
	+ GET -> /responsable/listar : views.responbale#listar

### Fuentes:

	+ https://bottlepy.org/docs/dev/
	+ http://tinydb.readthedocs.io/en/latest/index.html
  + https://buxty.com/b/2013/12/jinja2-templates-and-bottle/

Thanks/Credits

    Pepe Valdivia: developer Software Web Perú [http://softweb.pe]
