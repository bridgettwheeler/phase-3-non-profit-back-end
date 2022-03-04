require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
  end

  

end
