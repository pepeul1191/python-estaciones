# encoding: utf-8

require_relative 'app'
require 'json'

def mandar
    file = File.new("data/imagenes.txt", "r")
    arreglo_imagenes = []
    while (line = file.gets)
        data_json_string = line
        arreglo_imagenes.push(data_json_string)
    end
    RSpec.describe App do
        describe "1. Mandar metadatos de archivo: " do
            arreglo_imagenes.each do |imagen|
                it '1.1 Conexión con backend-archivos' do
                  test =App.new('')
                  test.servicios('backend', 'test/conexion')
                  expect(test.response.code).to eq(200)
                end
                it '1.2 Guardar metadato de la imagen en base de datos' do
                  url = 'imagen/crear?data='+ imagen
                  test = App.new(url)
                  test.post()
                  expect(test.response.code).to eq(200)
                end
            end
        end
    end
end

def obtener_id
    RSpec.describe App do
        describe "1. Obtener un id generado de manera aleatoria: " do
          it '1.1 Conexión con backend-archivos' do
            test =App.new('')
            test.servicios('backend', 'test/conexion')
            expect(test.response.code).to eq(200)
          end
          it '1.2 Obtener aleatorio de longitud 32' do
              url = 'imagen/obtener_id'
              test =App.new(url)
              test.get()
              expect(test.response.code).to eq(200)
              expect(test.response.body.length).to eq(32)
          end
        end
    end
end

mandar
#obtener_id
