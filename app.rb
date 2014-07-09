require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection({
  database: "les_clubs",
  adapter: "postgresql"
})

