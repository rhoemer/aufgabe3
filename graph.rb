class Graph
	attr_accessor :knoten, :kanten
	



	def initialize(initKanten)
	        @kanten = initKanten.split(',')								
	        @knoten = initKanten.split(',')
		i = 0
			while i < kanten.size
				knoten[i] = knoten[i].delete "1234567890"				
		                i = i+1
			end	
		
		                z = 0
			        while z < kanten.size			
				kanten[z] = kanten[z].delete "ABCDEFGHIJKLMNOPQRSTUVWXYZ"	
				z = z+1
			        end	
	end
	


	
	def to_s
		@kanten + @knoten
	end

end


