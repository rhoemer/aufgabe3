class Graph
	attr_accessor :knoten, :kanten
	



	def initialize(initKanten)
	        
                @knoten = initKanten.split(',')
                @kanten = initKanten.split(',')								
	        
		
                i = 0
		while i < kanten.size
			knoten[i] = knoten[i].delete "0123456789"				
		        i = i + 1
		end	
		
		z = 0
	        while z < kanten.size			
		kanten[z] = kanten[z].delete "ABCDEFGHIJKLMNOPQRSTUVWXYZ"	
		z = z + 1
		end	
	end
	
        

        def to_s
                @kanten + @knoten
	end
end


