class GenresController < ApplicationController

    # CREATE

    get '/genres/new' do
      erb :'genres/new'
    end

    post '/genres' do
      # CREATE genre
      erb :genres
    end

    # READ

    get '/genres' do
      @genres = Genre.all
      erb :'genres/index'
    end

    get '/genres/:slug' do
      @genre = Genre.find_by_slug(params[:slug])
      erb :'genres/show'
    end

    # UPDATE

    get '/genres/:slug/edit' do
      # DO STUFF HERE
      erb :'genres/edit'
    end

    patch '/genres/:slug' do
      # DO STUFF HERE
      erb :'genres/INSERT SLUG HERE'
    end

    # DELETE

    get '/genres/:slug' do
      # DO STUFF HERE
      erb :'genres/show'
    end

    delete '/genres/:slug' do
      # DELETE STUFF HERE
      erb :'genres/index'
    end
end
