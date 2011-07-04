class Strecke
	attr_accessor :stationen, :kanten
	
	def initialize(initKanten)
	
		@kanten = initKanten.split(',')								
		

                @stationen = initKanten.split(',')
		
		y = 0
			while y < kanten.size
				stationen[y] = stationen[y].delete "1234567890"				
			y = y+1
			end	
		
		x = 0
			

                                while x < kanten.size			
				kanten[x] = kanten[x].delete "ABCDEFGHIJKLMNOPQRSTUVWXYZ"	
				x = x+1
			end	
	end
	
	
	def to_s
		@kanten + @stationen
	end

end


