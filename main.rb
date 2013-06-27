# We need rubygems for ever application
require 'rubygems'

# We use pry for debugging and inserting breakpoints
require 'pry'

# Sinatra is our framework/DSL for web applications this week
require 'sinatra'

# The reload reloads the application every time we make a change.
require 'sinatra/reloader' if development?

configure do
end

post '/new_color' do
  # because ive posted parameters here i can access them in the param hash
  # in the form of the /colors view, i sathe the name of the parameters is "color"
  $global_colors << params[:color]
  redirect to('/colors')
end



get '/colors' do
  # This is the colors route
  # This would be correspond to the colors 'view'
  # we will create a colors.erb file in the views/ directory

  #this lime tells us to use the colors.erb view
  # any instance variables in this route (get '/colors')
  # will be avaliable in the colors view
  #local variable from this route however
  # are not avaliable in view
  # a variable like foo is not avaliable
  # a varibale like @foo is abvaliable

  $global_colors = ['Red', 'Green', 'Blue', 'Purple']
  erb :colors
end

@colors = $global_colorss