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
    begin
      @footer_path = params[:section]
      #@flash = (params[:section] == 'welcome')
      haml "#{params[:section]}/#{params[:section]}".to_sym
    rescue
      pass
    end
  end
  
  get '/:section/:subsection?' do
    begin
      @footer_path = "#{params[:section]}/#{params[:subsection]}"
      haml "#{params[:section]}/#{params[:subsection]}/#{params[:subsection]}".to_sym
    rescue
      pass
    end
  end
  
  get '/*' do
    redirect '/'
  end
  
  not_found do
    redirect '/'
  end
end