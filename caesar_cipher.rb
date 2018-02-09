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

puts caesar_cipher("What a string!", 5)