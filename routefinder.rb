require 'Graph'



class RouteFinder
	attr_accessor :route, :trueler, :strecke, :block
	


	def initialize(initRoute)
	    g = Graph.new("AB6,BC3,CE5,EC8,CE3,BE2,BD5,DE7") 	
		@strecke = 0												
		
                @route = initRoute.split('-')							
		
                @block = []									
															
		i = 0
		while i < route.size - 1							
			@block.insert(i, @route[i] + @route[i + 1])			
			
                        i = i + 1
		end

		


                i = 0	
		while i < block.size									
			j = 0
			

                        while j < g.knoten.size
				if @block[i] == g.knoten[j]				
					@strecke = @strecke + g.kanten[j].to_i		 
					@trueler = true								
				
                                        break if trueler == true
				else
					@trueler = false							
				end			
				j = j + 1
			end
			break if trueler == false							
			i = i + 1	
		end
	end
			
	def to_s
		if trueler 												
		puts "Die gesamte Strecke Betraegt:"									
		@strecke
		
                elsif 
		puts "Keine Verbindung verfügbar"									
                end
	end

end


n = RouteFinder.new("A-B-C")


puts n.to_s														

