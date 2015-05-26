require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do
  erb :home
end

get '/basic_calc' do
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :basic_calc
end

get '/power' do
    @first = params[:first].to_f
    @second = params[:second].to_f    
    @result = @first ** @second 
  erb :power
end

get '/sqrt' do
    @first = params[:first].to_f 
    @result = Math.sqrt(@first)
  erb :sqrt
end

get '/bmi' do
    @first = params[:first].to_f 
    @second = params[:second].to_f
    @result = (@first/(@second**2))*703
  erb :bmi
end

get '/trip' do
  @distance = params[:distance].to_f
  @mpg = params[:mpg].to_f
  @fuel_price = params[:fule_price].to_f
  @speed = params[:speed].to_f
  @result_hours = (@distance / @speed)
  @cost_of = ((@distance / @mpg) * @fuel_price ) 
  erb :trip
end
















