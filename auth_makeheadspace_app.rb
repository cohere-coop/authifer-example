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
  erb logged_in? ? :home : :guest_home
end
