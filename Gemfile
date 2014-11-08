source 'https://rubygems.org/'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'
gem 'activerecord'
#gem 'exifr'

group :development, :test do
  # Build tool  データベースのコマンド
  gem 'rake'
  # SQLite
  gem 'sqlite3'
  # Foreman  git でサーバー
  gem 'foreman'

  gem 'byebug'
end
  
group :production do
  # PostgreSQL     コマンド--without production
  gem 'pg'
end