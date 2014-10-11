require 'sinatra'
require 'sinatra/reloader'

EVENTS = [
  {name:"博多座開場15周年記念「博多座全公演ポスター展」", start_date: Date.new(2014,3,25) , end_date: Date.new(2015,3,31), location:"福岡市役所15階（議会棟側） ショーケース", latlng:"33.5983384,130.4210585", comment:"面白いよ"},
  {name:"レディース釣りマッチ", start_date: Date.new(2014,8,6) , end_date: Date.new(2014,10,29), location:"福岡市海づり公園", latlng:"33.626576,130.229021", comment:"一杯釣れるかな"}  
]

get '/event' do
  "hello, world"
end

get '/events' do
  @events = EVENTS
  erb :events
end

get '/event/new' do
  erb :event_new
end

get '/event/:id' do 
  id = params[:id].to_i
  @event = EVENTS[id]
  p @event
  erb :event
end

post '/event' do
   EVENTS << {
      name: params[:name],
      start_date: Date.parse(params[:start_date]),
      end_date: Date.parse(params[:end_date]),
      location: params[:location],
      comment: params[:comment]
   }
   redirect "/events"  
end