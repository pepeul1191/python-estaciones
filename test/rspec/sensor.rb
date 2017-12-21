# encoding: utf-8
require_relative 'app'
require 'json'

def listar
  RSpec.describe App do
    describe "1. Listar sensores: " do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Listar sensores' do
        url = 'sensor/listar'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
    end
  end
end

def crear
  RSpec.describe App do
    describe "2. Crear sensores: " do
      it '2.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear sensores' do
        data = {
          :nuevos => [
            {
              :id => 'tablaAsociacion_482',
              :nombre => 'Corbett',  
              :descripcion => '1 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            },
            {
              :id => 'tablaAsociacion_483',
              :nombre => 'Channa', 
              :descripcion => '2 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            },
            {
              :id => 'tablaAsociacion_484',
              :nombre => 'Maxy',  
              :descripcion => '3 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            },
            {
              :id => 'tablaAsociacion_485',
              :nombre => 'Alphard', 
              :descripcion => '4 - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            }  
          ],
          :editados => [],  
          :eliminados => [],
          :extra => {
            :estacion_id => 2
          }
        }.to_json
        url = 'sensor/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los sensores')
        expect(test.response.body).to include('nuevo_id')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def editar
  RSpec.describe App do
    describe "3. Editar sensores: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Editar sensores' do
        data = {
          :nuevos => [
          ],
          :editados => [
            {
              :id => '21',
              :nombre => 'Corbett',  
              :descripcion => '1x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            },
            {
              :id => '22',
              :nombre => 'Channa', 
              :descripcion => '2x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            },
            {
              :id => '23',
              :nombre => 'Maxy',  
              :descripcion => '3x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            },
            {
              :id => '24',
              :nombre => 'Alphard', 
              :descripcion => '4x - Tincidunt tempus. Donec vitae sapien ut libero', 
              :unidad_medida_id => 1,
              :estacion_id => 2
            }  
          ],  
          :eliminados => [],
          :extra => {
            :estacion_id => 2
          }
        }.to_json
        url = 'sensor/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los sensores')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def eliminar
  RSpec.describe App do
    describe "4. Eliminar sensores: " do
      it '4.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '4.2 Eliminar sensores' do
        data = {
          :nuevos => [
          ],
          :editados => [
          ],  
          :eliminados => [
            21,22,23,24
          ],
          :extra => {
            :estacion_id => 2
          }
        }.to_json
        url = 'sensor/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los sensores')
        expect(test.response.body).to include('success')
      end
    end
  end
end


listar
#crear
#editar
eliminar