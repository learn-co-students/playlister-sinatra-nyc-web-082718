class ArtistsController < ApplicationController

  # CREATE

  get '/artists/new' do
    erb :'artists/new'
  end

  post '/artists' do
    # CREATE ARTIST
    erb :'artists/index'
  end

  # READ

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  # UPDATE

  get '/artists/:slug/edit' do
    # DO STUFF HERE
    erb :'artists/edit'
  end

  patch '/artists/:slug' do
    # DO STUFF HERE
    erb :'artists/show'
  end

  # DELETE

  get '/artists/:slug' do
    # DO STUFF HERE
    erb :'artists/show'
  end

  delete '/artists/:slug' do
    # DELETE STUFF HERE
    erb :'artists/index'
  end

end
