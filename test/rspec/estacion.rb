# encoding: utf-8
require_relative 'app'
require 'json'

def listar
  RSpec.describe App do
    describe "1. Listar estación: " do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Listar estaciones' do
        url = 'estacion/listar'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
    end
  end
end

def crear
  RSpec.describe App do
    describe "2. Crear estaciones: " do
      it '2.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear estaciones' do
        data = {
          :nuevos => [
            {
              :id => 'tablaEstacion_481',
              :nombre => 'Corbett 1',  
              :descripcion => '1 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -11.34, 
              :longitud => -61.13, 
              :altura => 1001,
              :tipo_estacion_id => 1,
            },
            {
              :id => 'tablaEstacion_482',
              :nombre => 'Corbett 2',  
              :descripcion => '2 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -12.34, 
              :longitud => -62.13, 
              :altura => 1002,
              :tipo_estacion_id => 1,
            },
            {
              :id => 'tablaEstacion_483',
              :nombre => 'Corbett 3',  
              :descripcion => '3 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -13.34, 
              :longitud => -63.13, 
              :altura => 1003,
              :tipo_estacion_id => 1,
            },
            {
              :id => 'tablaEstacion_484',
              :nombre => 'Corbett 4',  
              :descripcion => '4 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -14.34, 
              :longitud => -64.13, 
              :altura => 1001,
              :tipo_estacion_id => 1,
            }  
          ],
          :editados => [],  
          :eliminados => [],
          :extra => {
            :campo_id => 2
          }
        }.to_json
        url = 'estacion/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en las estaciones')
        expect(test.response.body).to include('nuevo_id')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def editar
  RSpec.describe App do
    describe "3. Editar estaciones: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Editar estaciones' do
        data = {
          :nuevos => [
          ],
          :editados => [
            {
              :id => 26,
              :nombre => 'Corbett 1x',  
              :descripcion => '1x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -11.3, 
              :longitud => -61.1, 
              :altura => 1001,
              :tipo_estacion_id => 1,
            },
            {
              :id => 27,
              :nombre => 'Corbett 2x',  
              :descripcion => '2x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -12.3, 
              :longitud => -62.1, 
              :altura => 1002,
              :tipo_estacion_id => 1,
            },
            {
              :id => 28,
              :nombre => 'Corbett 3x',  
              :descripcion => '3x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -13.3, 
              :longitud => -63.1, 
              :altura => 1003,
              :tipo_estacion_id => 1,
            },
            {
              :id => 29,
              :nombre => 'Corbett 4x',  
              :descripcion => '4x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :latitud => -14.3, 
              :longitud => -64.1, 
              :altura => 1001,
              :tipo_estacion_id => 1,
            }  
          ],  
          :eliminados => [],
          :extra => {
            :campo_id => 2
          }
        }.to_json
        url = 'estacion/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en las estaciones')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def eliminar
  RSpec.describe App do
    describe "4. Eliminar estaciones: " do
      it '4.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '4.2 Eliminar estaciones' do
        data = {
          :nuevos => [
          ],
          :editados => [
          ],  
          :eliminados => [
            26,27,28,29
          ],
          :extra => {
            :campo_id => 2
          }
        }.to_json
        url = 'estacion/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en las estaciones')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def listar_campos
  RSpec.describe App do
    describe "5. Listar Campos: " do
      it '5.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '5.2 Listar ninguna estaciones segun campo' do
        url = 'estacion/campo/128'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
        registros = JSON.parse(test.response.body).length
        expect(registros).to eq(0)
      end
      it '5.3 Listar ninguna estaciones segun campo' do
        url = 'estacion/campo/129'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
        registros = JSON.parse(test.response.body).length
        expect(registros).to be > 0
      end
    end
  end
end

#listar
#crear
#editar
#eliminar
listar_campos