require 'caesar_cipher'

describe "#caesar_cipher" do

	context "given an empty string" do
		it "returns an empty string" do
			expect(caesar_cipher("", 5)).to eql("")
		end
	end

	context "given a string and no shift factor" do
		it "returns the string unchanged" do
			expect(caesar_cipher("hello", 0)).to eql("hello")
		end
	end	

	context "given a string and shift factor" do
		it "returns the string shifted" do
			expect(caesar_cipher("hello", 10)).to eql("rovvy")
		end
	end	

	context "given a negative shift" do
		it "returns the string with negative shift factor" do
			expect(caesar_cipher("efgh", -1)).to eql("defg")
		end
	end	

	context "given a string with shift factor exceeding alphabet limits" do
		it "returns the encrypted string, wrapping back to the beginning of the alphabet" do
			expect(caesar_cipher("zap", 5)).to eql("efu")
		end
	end	

end