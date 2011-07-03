class Graph
	attr_accessor :kanten, :stationen
	
	def initialize(initKanten)
	
		@kanten = initKanten.split(',')										#Zu erst werden beide Arrays mit den übergebenen Verbindungen gefüllt und von den Kommas befreit
		@stationen = initKanten.split(',')
		
		y = 0
			while y < kanten.size
				stationen[y] = stationen[y].delete "1234567890"				#Um ein Array für die Verbindungen zu kriegen, werden einfach alle Zahlen entfernt
			y = y+1
			end	
		
		x = 0
			while x < kanten.size			
				kanten[x] = kanten[x].delete "ABCDEFGHIJKLMNOPQRSTUVWXYZ"	#Das gleiche nur umgekehrt wird gemacht um ein Array mit der Strecke zwischen den Knoten zu erhalten
				x = x+1
			end	
	end
	
	
	def to_s
		@kanten + @stationen
	end

end


