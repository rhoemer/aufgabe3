require 'graph'

class RouteFinder
	attr_accessor :route, :strecke, :block, :success
	
	def initialize(initRoute)
	    g = Graph.new("AB5,BC4,CE2,EB3,CD8,AE7,AD5,DE6") 		#Der Graph wird initialisiert
		@strecke = 0											#Strecke wird initialisiert			
		@route = initRoute.split('-')							#Die Bindestriche werden aus dem Übergabeparameter initRoute entfernt und der Rest in das Array "route" geschrieben
		@block = []												#Ein leeres Array "block" wird initialisiert															
		x = 0
		while x < route.size - 1								#In dieser while-Schleife, wird die übergebene route in einzelne Abschnitte (Blöcke) geteilt
			@block.insert(x, @route[x] + @route[x+1])			#Diese zweier Blöcke werden in das Array "block" geschrieben
			x +=1
		end

		x = 0	
		while x < block.size									#Diese beiden Schleifen sind das Herzstück der Application
			y = 0
			while y < g.stationen.size
				if @block[x] == g.stationen[y]					#Es wird verglichen ob der x-te Abschnitt im array "block" auch im Verzeichnis aller Verbindungen vorhanden ist
					@strecke = @strecke + g.kanten[y].to_i		#Sollte das der Fall sein, wird der zugehörige Wert aus dem "kanten" array entnommen und zur Gesamt strecke addiert 
					@success = true								#Da in diesem zweig eine Verbindung gefunden wurde wird die Schleife verlassen
					break if success == true
				else
					@success = false							#Falls kein passende verbindung gefunden wurde wird die Schleife nocheinmal durchlaufen
				end			
				y +=1
			end
			break if success == false							#Diese break Anweisung gewährleistet dass Anfragen wie z.B. A-B-E-B-C auch Verbindungslos erkannt werden
			x +=1	
		end
	end
			
	def to_s
		if success 												
		puts "Strecke gesamt:"									#Wenn die verbindungssuche Erfolgreich war wird die Gesamtstrecke ausgegeben
		@strecke
		elsif 
		puts "Keine Verbindung"									#Wenn nicht dann nicht
		end
	end

end

n = RouteFinder.new("A-B-C")									#Erstellen einer neue Suchabfrage mit der Route als Übergabeparameter
puts n.to_s														#Ausgabe auf der Konsole

