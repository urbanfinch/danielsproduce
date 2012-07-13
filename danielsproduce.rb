require File.dirname(__FILE__) + '/bootstrap.rb'

class DanielsProduce < Sinatra::Base
  
  configure do
    set :root,    File.dirname(__FILE__)
    set :views,   File.join(Sinatra::Application.root, 'views')
    set :haml,    { :format => :html5, :layout => :'layouts/danielsproduce' }
  end
  
  get '/' do
    redirect '/welcome'
  end
  
  get '/:section/?' do
    @flash = (params[:section] == 'welcome')
    haml "#{params[:section]}/#{params[:section]}".to_sym
  end
  
  get '/:section/:subsection?' do
    haml "#{params[:section]}/#{params[:section]}/#{params[:subsection]}/#{params[:subsection]}".to_sym
  end
  
  get '/*' do
    redirect '/'
  end
end