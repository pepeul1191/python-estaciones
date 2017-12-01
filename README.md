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

### Migraciones

Ejecutar migración

  $ sequel -m path/to/migrations postgres://host/database
  $ sequel -m path/to/migrations sqlite://db/db_estaciones.db

Ejecutar el 'down' de las migraciones de la última a la primera:

  $ sequel -m db/migrations -M 0 sqlite://db/db_estaciones.db

Ejecutar el 'up' de las migraciones hasta un versión especifica:

  $ sequel -m db/migrations -M #version sqlite://db/db_estaciones.db

Tipos de Datos de Columnas

  + :string=>String
  + :integer=>Integer
  + :date=>Date
  + :datetime=>[Time, DateTime].freeze, 
  + :time=>Sequel::SQLTime, 
  + :boolean=>[TrueClass, FalseClass].freeze, 
  + :float=>Float
  + :decimal=>BigDecimal
  + :blob=>Sequel::SQL::Blob

### Rutas

	+ GET -> / : app#index
  + GET -> /test/conexion : app#test_conexion
	+ GET -> /extension/obtener?id=<id> : views.extension#extension_obtener
  + GET -> /extension/listar : views.extension#extension_listar
  + GET -> /imagen/obtener_id : views.imagen#imagen_obtener_id
  + GET -> /imagen/listar : views.imagen#imagen_listar
  + GET -> /imagen/obtener_ruta_archivo?imagen_id=<imagen_id> : views.imagen#imagen_obtener_ruta_archivo
  + POST -> /imagen/crear?data=<data> : views.imagen#imagen_subir

### Fuentes:

	+ https://bottlepy.org/docs/dev/
	+ http://tinydb.readthedocs.io/en/latest/index.html
  + https://buxty.com/b/2013/12/jinja2-templates-and-bottle/

Thanks/Credits

    Pepe Valdivia: developer Software Web Perú [http://softweb.pe]
