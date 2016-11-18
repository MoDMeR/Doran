#!/usr/bin/env ruby
require 'sinatra'
require 'rerun'

enable :sessions


helpers do
  def init
    session['friendly_champs'] ||= []
  end
end

before do
  init
end

get '/' do
  erb :roster, :locals => { :friendly_champs => session['friendly_champs'] }
end

post '/add-friendly-champ' do
  friendly_champs = session['friendly_champs']
  champ = params['friendly-champ-1']
  friendly_champs << champ
  session['friendly_champs'] = friendly_champs
  redirect to('/')
end

get '/reset' do
  session.clear
  redirect to('/')
end