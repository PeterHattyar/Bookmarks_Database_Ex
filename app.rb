# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Main Page'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  get '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/bookmark_added' do
    Bookmark.create(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end