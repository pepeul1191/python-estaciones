# encoding: utf-8
require_relative 'app'
require 'json'

def listar
  RSpec.describe App do
    describe "1. Listar unidades de medida: " do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Listar los unidades de medida registradas' do
        url = 'unidad_medida/listar'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
    end
  end
end

def crear
  RSpec.describe App do
    describe "2. Crear unidades de medida: " do
      it '2.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear unidades de medida' do
        data = {
          :nuevos => [
            {
              :id => 'tablaAsociacion_482',
              :nombre => 'Corbett', 
              :simbolo => 'Dudmarsh', 
            },
            {
              :id => 'tablaAsociacion_483',
              :nombre => 'Channa', 
              :simbolo => 'Labarre', 
            },
            {
              :id => 'tablaAsociacion_484',
              :nombre => 'Maxy', 
              :simbolo => 'McGlone', 
            },
            {
              :id => 'tablaAsociacion_485',
              :nombre => 'Alphard', 
              :simbolo => 'Biddlecombe', 
            }  
          ],
          :editados => [],  
          :eliminados => []
        }.to_json
        url = 'unidad_medida/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los unidades de medida')
        expect(test.response.body).to include('nuevo_id')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def editar
  RSpec.describe App do
    describe "3. Editar unidades de medida: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Editar unidades de medida' do
        data = {
          :nuevos => [
          ],
          :editados => [
            {
              :id => '3',
              :nombre => 'XD', 
              :simbolo => 'Dudmarsh', 
            },
            {
              :id => '4',
              :nombre => 'XD', 
              :simbolo => 'Labarre', 
            },
            {
              :id => '5',
              :nombre => 'XD', 
              :simbolo => 'McGlone', 
            },
            {
              :id => '6',
              :nombre => 'XD', 
              :simbolo => 'Biddlecombe', 
            }
          ],  
          :eliminados => []
        }.to_json
        url = 'unidad_medida/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los unidades de medida')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def eliminar
  RSpec.describe App do
    describe "4. Eliminar unidades de medida: " do
      it '4.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '4.2 Eliminar unidades de medida' do
        data = {
          :nuevos => [
          ],
          :editados => [
          ],  
          :eliminados => [
            3,4,5,6
          ]
        }.to_json
        url = 'unidad_medida/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los unidades de medida')
        expect(test.response.body).to include('success')
      end
    end
  end
end

listar
#crear
#editar
eliminar