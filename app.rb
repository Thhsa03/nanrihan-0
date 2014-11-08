require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'active_record'
require 'securerandom'

# セッション
use Rack::Session::Cookie,
# :key => 'rack.session',
# :domain => 'takumakei.blogspot.com',
# :path => '/',
:expire_after => 3600,
:secret => 'sD9HiXsapPu2l0'

#require "FileUtils"

Encoding.default_external = 'utf-8'
class Event < ActiveRecord::Base
  #ttr_accessor :name, :start_date, :end_date, :location, :comment
end

class User < ActiveRecord::Base
end

class UsersTag < ActiveRecord::Base
  self.table_name = "users_tags"
end



=begin
EVENTS = [
  Event.new("博多座開場15周年記念「博多座全公演ポスター展」", Date.new(2014,3,25) , Date.new(2015,3,31), "福岡市役所15階（議会棟側） ショーケース", "33.5983384,130.4210585", "面白いよ"),
  Event.new("レディース釣りマッチ", Date.new(2014,8,6) , Date.new(2014,10,29), "福岡市海づり公園", "33.626576,130.229021", "一杯釣れるかな") 
]
=end
get '/' do
  @events = Event.all
  erb :events
end

get '/top' do
  @events = Event.all
  # google maps API のキー
  @key="AIzaSyDuuhtgBe7wLTq3ck4t3xWth-c7eAZuX2M"
  if session[:login]
    @login_flag = true
  else
    @login_flag = false
  end
  erb :top
end

get '/user_new' do
  @page = @params[:page]
  erb :user_new
end

post '/user_new_end' do
  # ユーザーを登録
  user = User.new
  user.user_name = params[:user_name]
  user.mail = params[:mail]
  user.pass = params[:password]
  day = Time.now
  user.registration_date = DateTime.new(day.year,day.month,day.day,day.hour,day.min,day.sec)
  user.save
  # ユーザータグをデータベースに登録
  for  i in 0..49
    if params[:tags][i].length > 0
      user_tag = UsersTag.new
      user_tag.user_id = user.id;
      user_tag.name = params[:tags][i]
      user_tag.save
    end
  end
  @users = User.all
  erb :All_Users
end

# トップページのイベント観覧並び替えを更新した時
post '/top_info_chagne' do
  
  @events = Event.where(:name => params[:keyword] )

end

get '/All_Users_Tags' do
  @tags = UsersTag.all
  erb :All_Users_Tags
end

get '/login' do
  @page = @params[:page]
  erb :login
end

# ログイン情報のチェック
post '/login_end' do
  user = User.find_by_mail(params[:mail]);
  if user != nil then
    if user.pass == params[:pass] then
      session[:login] = user.user_name
      redirect @params[:page]
    else
      "パスワードが違います"
      #redirect "/login"
    end
  else
    "登録されていません"
    #redirect "/login"
  end
end


#find はひとつだけなのでfor eachが通らない
#Event.find_by(name: "")
get '/events' do
  @events = Event.all
  erb :events
end

#ユーザーのトップページ
get '/user_top' do

  erb :user_top
end

get '/event_new' do
  erb :event_new
end
#.find_by_name(params[:keyword])
post '/search' do
  @events = Event.where("name like ?" ,"%"+params[:keyword]+"%")
  #(:name => params[:keyword] )
  #all(:conditions => [ "name like ?" ,params[:keyword]+"*"]) #where(:name => params[:keyword] )
  #Event.find_by_name(params[:keyword]) 
  #(params[:keyword])
  #(:conditions => ["name like ?" ,"%"+params[:keyword]+"%"])
  #find(:conditions => [ :all,"name LIKE ?" ,params[:keyword]+"%"]) 
  #正規表現
  erb :events
end
# 通常観覧モード
get '/event/:id' do 
  id = params[:id].to_i
  @event = Event[id]
  p @event
  erb :event
end
# 管理者観覧モード
post '/event_/:id' do

end

post '/event_new_end' do
   event = Event.new
   event.name = params[:title]
   event.start_date = Date.new(2014,3,25)
   event.end_date = Date.new(2015,3,31)
   event.location = "33.5983384,130.4210585"
   event.latlng = "eeee"
   event.comment = params[:comment]
   day = Time.now
   event.registration_date = DateTime.new(day.year,day.month,day.day,day.hour,day.min,day.sec)
   event.save
   redirect "/events"
end

# 新着メッセージ
get 'my_news' do
  erb :my_news
end

# 登録しているユーザー
get 'my_users_list' do
  erb :my_users_list
end
# newsの数を表示
# 最新のメッセージのなかで一番新しい
# 分類別 表示 選択したものを記憶


# 作成したイベント
get 'my_create_events' do
  erb :my_create_events
end
# 進行状況
# 投稿画像
# 投稿動画
# コメント

# 設定
get 'my_system_setting' do
end
# 自分の投稿したイベントになにか投稿されたnewsに反映
# 登録しているユーザーがコメントしたらnewsに反映


# 静的コンテンツ参照のためのパス設定
#set :public, File.dirname(__FILE__) + '/public'


#// 拡張子からアップロードを許すか調べる
def FileExtensionGetAllowUpload(ext)
  # アップロードを許可したい拡張子があればここに追加
  allow_ext = ["bmp","gif","jpg","jpeg","png","zip"]
  allow_ext.each { |v|
    if (v == ext) then
      return true
    end
  }
  return false
end
#// 文字列から拡張子を取得する（なければ nil）
def StringGetFileExtension(string)
  string = string.split(/(\\|\/)/)[-1]
  a = string.split(/(\.)/)
  if a.length > 1 then
    return a[-1]
  end
  return nil
end

  #file_ext = StringGetFileExtension(input_file.original_filename)  # 拡張子を取得する
  # アップロード可能な拡張子であるか調べる
  #if (FileExtensionGetAllowUpload(file_ext)) then
  # 現在の時間を取得する
  #time_now = Time.now.tv_sec
  # 保存先のファイルパスを生成する（実戦運用する場合、排他処理を考慮して保存先のファイル名を生成する必要があります）

post '/upload' do
  if params[:input_file]
      file_ext = StringGetFileExtension(params[:input_file][:filename])
      if (FileExtensionGetAllowUpload(file_ext))
        send_path = "upload/#{params[:input_file][:filename]}"
        save_path = "public/"+send_path
        File.open(save_path, 'wb') do |f|
          f.write params[:input_file][:tempfile].read
          send_path
        end
      else
        "error"
      end
  else
    "error"
  end
end







# アップロードした画像の表示
get '/images' do
images_name = Dir.glob("public/images/*")
@images_path = []
images_name.each do |image|
@images_path << image.gsub("public/", "./")
end
haml :images
end
=begin
   EVENTS << {
      name: params[:name],
      start_date: Date.parse(params[:start_date]),
      end_date: Date.parse(params[:end_date]),
      location: params[:location],
      comment: params[:comment]
   }
=end