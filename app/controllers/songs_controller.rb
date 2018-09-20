# require "pry"
# require 'sinatra/base'
# require 'rack-flash'
#

  # enable :sessions
  # use Rack::Flash
class SongsController < ApplicationController

  # CREATE

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song = Song.create(name: params[:song][:name], artist: @artist)

    if params[:genres]
      @genres = params[:genres].map { |s| Genre.find(s.to_i) }
      @genres.each do |g|
        @song.genres << g
      end
    end

    @songs = Song.all
    redirect to("/songs/#{@song.slug}")
  end

  # READ

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  # UPDATE

  get '/songs/:slug/edit' do
    # DO STUFF HERE
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if params[:artist][:name]
      @artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.update(artist: @artist)
    end

    if params[:genres]
      @song.genres = []
      @genres = params[:genres].map { |s| Genre.find(s.to_i) }
      @genres.each do |g|
        @song.genres << g
      end
    end

    @song.save

    redirect to("/songs/#{@song.slug}")
  end

  # DELETE

  get '/songs/:slug' do
    # DO STUFF HERE
    erb :'songs/show'
  end

  delete '/songs/:slug' do
    # DELETE STUFF HERE
      redirect to("/songs")
  end
end
