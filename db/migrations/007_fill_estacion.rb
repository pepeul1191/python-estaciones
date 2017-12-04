require 'sequel'

Sequel.migration do
  up do
  	Sequel.connect('sqlite://db/db_estaciones.db')
		DB.transaction do
	  	file = File.new('db/data/estacion.txt', 'r')
			while (line = file.gets)
				line_array = line.split('::').map!(&:strip)
				nombre = line_array[0]
				descripcion = line_array[1]
				latitud = line_array[2]
				longitud = line_array[3]
				altura = line_array[4]
				campo_id = line_array[5]
				puts "1+++++++++++++++++++"
				puts line_array.inspect
				puts "2+++++++++++++++++++"
				tipo_estacion_id = line_array[6]
				DB[:estaciones].insert(nombre: nombre, descripcion: descripcion, latitud: latitud, longitud: longitud, altura: altura, campo_id: campo_id, tipo_estacion_id: tipo_estacion_id)
			end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/db_estaciones.db')
		DB[:estaciones].delete
	end
end