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

post '/clubs' do
  name = params[:name]
  image_url = params[:image_url]
  description = params[:description]
  rating = params[:rating]

  Club.create(
    name: name,
    image_url: image_url,
    description: description,
    rating: rating
  )
  redirect "/"
end

get '/clubs/:id/delete' do
  club_id = params[:id]
  club = Club.find(club_id)
  club.destroy
  redirect "/"
end

get "/clubs/:id/edit" do
  @club = Club.find(params[:id])
  erb :edit
end

put "/clubs/:id" do
  @club = Club.find(params[:id])
  name = params[:name]
  image_url = params[:image_url]
  description = params[:description]
  rating = params[:rating]
  id = params[:id]
  if @club.update_attributes(
    name: name,
    image_url: image_url,
    description: description,
    rating: rating
    )
    redirect "/"
  else
    redirect "/clubs/id/edit"
  end
end
