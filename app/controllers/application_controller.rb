require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
  end

#this is where I can put any shared helper methods exp:

#private

#def shared_helper_method

end
