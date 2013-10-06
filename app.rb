require 'singleton'
require 'sinatra'
require 'open-uri'
require 'bundler'
Bundler.require

require_relative 'lib/ninjify'
require_relative 'lib/ninja_image'

get '/ninja/:normal_name' do
  cache_control :public, :max_age => 3600

  @normal_name = params[:normal_name]
  @ninja_name = Ninjify.instance.ninjify(@normal_name)
  @ninja_image = NinjaImage.new(@ninja_name)

  @page_title = "The Ninja Name of #@normal_name is #@ninja_name"

  haml :ninja
end

post '/ninja' do
  redirect to("/ninja/#{URI::encode(params[:normal_name])}")
end

get '/' do
  cache_control :public, :max_age => 3600

  haml :ninja
end