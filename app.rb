# require 'sinatra'
# require 'sinatra/reloader'
# also_reload 'lib/**/*.rb'
# require './lib/tasks'
# require 'pg'
#
# DB = PG.connect({dbname: "to_do"})
#
# get '/' do
#   erb :index
# end
#
# get("/") do
#   erb(:index)
# end
#
# get("/lists/new") do
#   erb(:list_form)
# end
#
# post("/lists") do
#   name = params.fetch("name")
#   list = List.new({:name => name, :id => nil})
#   list.save()
#   erb(:list_success)
#  end
#
#  get('/lists') do
#   @lists = List.all()
#   erb(:lists)
# end