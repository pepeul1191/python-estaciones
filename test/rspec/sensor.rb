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

listar