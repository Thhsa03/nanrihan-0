use Rack::Session::Cookie,
# :key => 'rack.session',
# :domain => 'takumakei.blogspot.com',
# :path => '/',
:expire_after => 3600,
:secret => 'sD9HiXsapPu2l0'

helpers do
# def login
   # データーベースの値と比較
 #  if params['id'], params['pw']
 #   session[:login] = 'What should i have to put here ?'
  #   redirect '/'
  # else
  #   erb :login
  # end
 #end

 def logout
   session.delete(:login)
   redirect '/'
 end

 def need_auth
  # 条件が偽のとき実行
   unless session[:login]
     erb :login
   else
     yield #ブロックの処理をする
   end
 end
 
end