require 'sinatra'
require 'authifer'
require './initializers/dotenv'

Authifer.connect_to_database(ENV['DATABASE_URL'])

use Authifer::App

helpers do
  include Authifer::AuthenticationHelper
  include Authifer::Paths
end

get '/' do
  if logged_in?
    "<a href='#{ delete_session_path }'>log out</a>"
  else
    "<a href='#{ new_session_path }'>log in</a>" +
    " or " +
    "<a href='#{ new_user_path }'>register</a>"
  end
end
