require File.dirname(__FILE__) + '/bootstrap.rb'

class DanielsProduce < Sinatra::Base
  
  configure do
    set :root,    File.dirname(__FILE__)
    set :views,   File.join(Sinatra::Application.root, 'views')
  end
  
  get '/' do
    redirect '/index'
  end
  
  get '/:section/?' do
    erb "#{params[:section]}.html".to_sym
  end
  
  get '/*' do
    redirect '/'
  end
end