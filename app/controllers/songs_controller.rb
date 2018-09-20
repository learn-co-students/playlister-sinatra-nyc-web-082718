class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  get '/songs/:slug' do
      if params[:created]
        @created = "Succesfully created song."
      end
      if params[:updated]
        @updated = "Successfully updated song."
      end
      @song = Song.find_by_slug(params[:slug])
      @artist = @song.artist
      @genres = @song.genres
      erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by(id: params[:song][:id])
    @song.update(name: params[:song][:name], artist_id: Artist.all.find_by(name: params[:song][:artist][:name]).id)
    @song.genres = []
    @song.save
    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by(id: genre_id)
    end
    # flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}?updated=#{true}"
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_by(name: params[:song][:artist][:name])
    if @song.artist == nil
      @song.artist = Artist.create(name: params[:song][:artist][:name])
    end
    @song.save
    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by(id: genre_id)
    end
    # flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}?created=#{true}"
  end

end #controller
