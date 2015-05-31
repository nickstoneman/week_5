require 'sinatra'
require 'sinatra/contrib/all'
require 'pg'
require 'pry'

get '/' do
  erb :index
end

get '/videos' do
  sql = "select * from videos"
  @videos = run_sql(sql)
  # This line checks if this is an ajax request
  if request.xhr?
    json @videos.to_a
  else
    erb :index
  end
end

post '/videos' do
  artist = params[:artist],
  title = params[:title],
  description = params[:description],
  category = params[:category],
  genre = params[:genre],
  url = params[:url]
  sql = "insert into videos (artist, title, description, category, genre, url) values (
    '#{artist}',
    '#{title}',
    '#{description}',
    '#{category}',
    '#{genre}',
    '#{url}'
    ) returning *"
  @artist = run_sql(sql).first
  if request.xhr?
    json @artist 
  else
    redirect_to '/videos'
  end
end

put '/videos/:id' do
  sql = "select * from videos"
  run_sql(sql)
  if request.xhr?
    json [{status: :ok}]
  else
    redirect to('/videos')
  end
end


private

def run_sql(sql)
  conn = PG.connect(dbname: 'meme_tube_ajax', host: 'localhost')
  begin 
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end
