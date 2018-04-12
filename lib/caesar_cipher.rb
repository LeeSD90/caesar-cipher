require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
	pass if params[:string] == nil

	string = params["string"]
	shift = params["shift"].to_i
  	encoded_string = caesar_cipher(string, shift)
  	puts encoded_string
  	erb :index, :locals => {:encoded_string => encoded_string}
end

get '/' do
  pass if params[:string] != nil

  erb :index, :locals =>{:encoded_string => ""}
end

def caesar_cipher(str, shift)

	hash_az = Hash[("a".."z").to_a.zip((1..26).to_a)]
	hash_AZ = Hash[("A".."Z").to_a.zip((1..26).to_a)]

	split = str.split(//)
	split.map! do |x|
		if hash_az[x] != nil
			i = hash_az[x] + shift
			if i >= 26 
				i -= 26 
			end
			hash_az.key(i)
		elsif hash_AZ[x] != nil
			i = hash_AZ[x] + shift
			if i >= 26 
				i -= 26 
			end
			hash_AZ.key(i)
		else x
		end
	end

	return split.join
end
