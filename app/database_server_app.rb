require 'sinatra/base'

class DatabaseServerApp < Sinatra::Base
  set :port, 4000

  post '/set' do
    @data = {}
    params.each { |key, value|
      @data[key.to_sym] = value
    }
    "#{@data}"
  end

  run! if app_file == $0
end
