require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    p ENV
    @peeps = Peep.all
    erb :'peeps'
  end

  run! if app_file == $0
end
