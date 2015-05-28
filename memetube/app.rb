require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry-byebug'

get '/' do 
  redirect to ('/video')
end

get '/video' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]

  sql = "INSERT into VIDEOS (title, description, url, genre) values (
    '#{title}', 
    '#{params[:description]}', 
    '#{params[:url]}', 
    '#{params[:genre]}'
    )"
  @video = run_sql(sql)
  erb :video
end

get '/videos' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]
  sql = 'select * from videos' 
  @videos = run_sql(sql)
  erb :videos
end




private

def run_sql(sql)
  conn = PG.connect(dbname: 'memetube', host: 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end