require 'sinatra'
require 'sinatra/reloader'

EVENTS = [
  {name:"博多座開場15周年記念「博多座全公演ポスター展」", start_date: Date.new(2014,3,25) , end_date: Date.new(2015,3,31), location:"福岡市役所15階（議会棟側） ショーケース", latlng:"33.5983384,130.4210585", comment:"面白いよ"},
  {name:"レディース釣りマッチ", start_date: Date.new(2014,8,6) , end_date: Date.new(2014,10,29), location:"福岡市海づり公園", latlng:"33.626576,130.229021", comment:"一杯釣れるかな"}  
]

get '/' do
  "hello, world"
end

get '/event/:id' do 
  id = params[:id].to_i
  @event = EVENTS[id]
  p @event
  erb :event
end