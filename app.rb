require 'sinatra'
require 'sinatra/reloader'

class Event
  attr_accessor :name, :start_date, :end_date, :location, :comment

  def initialize(name, start_date, end_date, location, latlng = nil, comment = nil)
    @name = name
    @start_date = start_date
    @end_date = end_date
    @location = location
    @comment = comment
  end
end

EVENTS = [
  Event.new("博多座開場15周年記念「博多座全公演ポスター展」", Date.new(2014,3,25) , Date.new(2015,3,31), "福岡市役所15階（議会棟側） ショーケース", "33.5983384,130.4210585", "面白いよ"),
  Event.new("レディース釣りマッチ", Date.new(2014,8,6) , Date.new(2014,10,29), "福岡市海づり公園", "33.626576,130.229021", "一杯釣れるかな") 
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