require 'Graph'



class RouteFinder
	attr_accessor :route, :trueler, :strecke, :array
	


	def initialize(initRoute)
	    g = Graph.new("AB6,BC3,CE5,EC8,CE3,BE2,BD5,DE7") 	
												
		@array = []
                @route = initRoute.split('-')							
		@strecke = 0
									
															
		i = 0
		while i < route.size - 1							
			@array.insert(i, @route[i] + @route[i + 1])			
			
                        i = i + 1
		end

		


                i = 0	
		while i < array.size									
			j = 0
			

                        while j < g.knoten.size
				if @array[i] == g.knoten[j]				
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

