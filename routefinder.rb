require 'graph'



class RouteFinder
	attr_accessor :route, :block, :success, :strecke
	


	def initialize(initRoute)
	    g = Graph.new("AB6,BC3,CE5,EC8,CE3,BE2,BD5,DE7") 	
		@strecke = 0												
		@route = initRoute.split('-')							
		@block = []									
															
		x = 0
		while x < route.size - 1							
			@block.insert(x, @route[x] + @route[x+1])			
			x +=1
		end

		x = 0	
		while x < block.size									
			y = 0
			while y < g.stationen.size
				if @block[x] == g.stationen[y]				
					@strecke = @strecke + g.kanten[y].to_i		 
					@success = true								
				
                                        break if success == true
				else
					@success = false							
				end			
				y +=1
			end
			break if success == false							
			x +=1	
		end
	end
			
	def to_s
		if success 												
		puts "Strecke insgesamt:"									
		@strecke
		elsif 
		puts "Keine Verbindung verfügbar"									
                end
	end

end

n = RouteFinder.new("A-B-C")
puts n.to_s														

