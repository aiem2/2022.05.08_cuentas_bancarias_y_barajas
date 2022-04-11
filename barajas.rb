require_relative 'carta.rb'
class Baraja
    def cartas
        pintas = ['C','D','E','T']
        cartas = []
        (pintas.count).times do |i|
            13.times do |j|
                cartas.push Carta.new(j+1, pintas[i])
            end
        end
        @cartas = cartas
    end

    def barajar
        print cartas.shuffle
    end

    def sacar
        carta = []
        1.times do 
            carta.push cartas.shuffle.pop 
        end
        print carta
    end

    def repartir 
        mano = []
        5.times do 
            mano.push cartas.shuffle.sample
        end
        print mano
    end
    
end

baraja = Baraja.new

puts "\n"
puts "\n"
puts "Mazo ordenado"
print baraja.cartas
puts "\n"
puts "\n"
puts "Mazo barajado"
print baraja.barajar
puts "\n"
puts "\n"
puts "Sacar una carta"
print baraja.sacar
puts "\n"
puts "\n"
puts "Repartir una mano de 5 cartas"
print baraja.repartir