#This simple affine cypher preserves puncuation and works on characters in the 0-25 space

class AffineCypher

	def initialize(a,b)
		@a = a
		@b = b
	end

	def encrypt(plain_text)
		puts "Encrypt function Received #{plain_text}"

		plain_text.upcase!
		encrypted_string = []

		plain_text.chars.each do |char|
			var = (char.ord - 65)
			unless var < 0
				encrypted_string << ( ((var*@a+@b) % 26) + 65 ).chr
			else
				encrypted_string << char
			end
		end
		encrypted_string.join.downcase!
	end


	#Currently decryption only works for @a=1 (ie, a Caesarian shift cypher)
	def decrypt(encrypted)
		puts "Decrypt function received #{encrypted}"
		decrypted_string = []

		encrypted.upcase!

		encrypted.chars.each do |char|
			var = (char.ord - 65)
			unless var < 0
				decrypted_string << (((var/@a-@b) % 26) + 65 ).chr
			else
				decrypted_string << char
			end
		end
		decrypted_string.join.downcase!
	end

end

if $0 == __FILE__

	puts "Running the affine cypher"

	cyph = AffineCypher.new(1,5)

	string = %Q{Hello World}

	puts "The string is: #{string}"

	encrypted = cyph.encrypt(string)

	puts "encrypted: #{encrypted}"

	decrypted = cyph.decrypt(encrypted)
	
	puts "decrypted: #{decrypted}"

end