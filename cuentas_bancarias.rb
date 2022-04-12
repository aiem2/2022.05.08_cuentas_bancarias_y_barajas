class CuentaBancaria
    attr_accessor :banco, :numero_de_cuenta, :saldo
    def initialize (banco,numero_de_cuenta, saldo = 0)
        @banco = banco
        raise RangeError, 'Las cuentas tienen 8 dígitos' if numero_de_cuenta.chars.count != 8
        @numero_de_cuenta = numero_de_cuenta
        @saldo = saldo
    end
    def transferir(monto,cuenta_destino)
        @saldo -= monto
        cuenta_destino.saldo += monto       
    end
end

class Usuario
    attr_accessor :cuentas, :saldo_total
    def initialize (cuentas)
        @cuentas = cuentas
    end
    def saldo_total
        n = cuentas.count
        saldo_total = 0
        n.times do |i|
            saldo_total = cuentas[i].sum {|s| s.saldo }
        end
        @saldo_total = saldo_total
    end
end 

cuenta1 = CuentaBancaria.new('Santander','12345678',5000)
cuenta2 = CuentaBancaria.new('Estado','22334455',5000)
usuario1 = Usuario.new([[cuenta1],[cuenta2]])

puts "El saldo de la cuenta #{cuenta1.numero_de_cuenta} es #{cuenta1.saldo}"
puts "El saldo de la cuenta #{cuenta2.numero_de_cuenta} es #{cuenta2.saldo}"
puts "\n"
cuenta1.transferir(5000,cuenta2)
puts "Se hizo una transferencia de la cuenta #{cuenta1.numero_de_cuenta} a la cuenta #{cuenta2.numero_de_cuenta} por un monto de 5000"
puts "\n"
puts "El saldo de la cuenta #{cuenta1.numero_de_cuenta} es #{cuenta1.saldo}"
puts "El saldo de la cuenta #{cuenta2.numero_de_cuenta} es #{cuenta2.saldo}"
puts "\n"
puts "El saldo del Usuario1 es #{usuario1.saldo_total}"
