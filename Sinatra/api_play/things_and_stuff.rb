require 'sinatra'

get '/' do
  "things and stuff"
end

#path magic
get '/color/:color' do
  "You said your color was, #{params['color']}"
end

get '/music/:band' do |band|
  "Your favorite band is #{band}"
end

get '/blockparams/*/*' do |first, second|
  return "Here is the first: #{first} " +
  "Here is the second: #{second}"
end

get '/super' do
  "supermans name is #{params['name']}"
end

# Creating conditionals
set(:prob) { |val| condition { rand <= val} }
get '/binary', prob: 0.50 do
  "1"
end

get '/binary' do
  "0"
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/stream') { Stream.new }

get('/request') do
  p request.inspect
end
