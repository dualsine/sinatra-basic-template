require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'pry'
require 'haml'
require 'coffee-script'

class MyApp < Sinatra::Base
	set :static, true
  set :public, File.dirname(__FILE__) + '/static'

  get '/' do
    haml :index
  end

  get '/post/:post' do
    # params[:post]
  end

  get "/js/*.js" do
    filename = params[:splat].first
    coffee "../public/coffee/#{filename}".to_sym
  end
end

MyApp.run!