#!/usr/bin/ruby

# Segunda practica de la asignatura Lenguajes y Paradigmas
# de Programacion
# Descripción: Se debe desarrollar un programa en Ruby que
# implemente el juego de piedra, papel, tijeras
# Objetivo: Familiarizarse con la programacion imperativa
# haciendo uso de Ruby

class PiedraPapelTijeras

	# Método que inicializa la instancia de la clase
	# e invoca al metodo correspondiente para comenzar
	# a jugar
	def initialize()
		# Inicialización de variables de instancia
		@items = ['piedra', 'papel', 'tijeras']

		@scores = {
			human:    0,
			computer: 0,	
		}

		@rules = {
			'piedra'  => 'tijeras',
			'papel'   => 'piedra',
			'tijeras' => 'papel'
		}

		# Comienza el juego
		while (true)
			juego
		end
	end
	
	# Metodo que implementa el juego
	def juego
		# El humano selecciona la jugada
		while (true)
			print "Selecciona tu jugada: #{@items}: "
			human_plays = gets.strip.downcase
			break if (@items.index(human_plays) != nil)
		end
		puts "Has seleccionado #{human_plays}"

		# El ordenador selecciona la jugada
		index = rand(@items.size())
		computer_plays = @items[index]
		puts "El ordenador ha seleccionado #{computer_plays}"

		# Se aplican las reglas del juego
		if (@rules[human_plays] == computer_plays)
			@scores[:human] += 1
			puts "Tu ganas"
		elsif (human_plays == computer_plays)
			puts "Ha habido un empate"
		else
			@scores[:computer] += 1 
			puts "El ordenador gana"
		end

		# Se muestra el marcador
		puts "Tu: #{@scores[:human]} - Ordenador: #{@scores[:computer]}"
	end

end

# Creacion de la instancia de la clase correspondiente
PiedraPapelTijeras.new
