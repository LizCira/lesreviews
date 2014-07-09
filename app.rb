require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection({
  database: "les_clubs",
  adapter: "postgresql"
})

require_relative 'models/club'

get '/'  do
  @clubs = Club.all
  erb :index
end
