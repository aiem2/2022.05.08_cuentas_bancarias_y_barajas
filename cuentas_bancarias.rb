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
        @saldo_total = @cuentas.map {|cuenta| cuenta.saldo}.sum
    end
end 

cuenta1 = CuentaBancaria.new('Santander','12345678',5000)
cuenta2 = CuentaBancaria.new('Estado','22334455',5000)
cuenta3 = CuentaBancaria.new('BCI','00112233',5000)
cuenta4 = CuentaBancaria.new('Chile','99887766',5000)
usuario1 = Usuario.new([cuenta1,cuenta2])
usuario2 = Usuario.new([cuenta3,cuenta4])

puts "El saldo de la cuenta #{cuenta1.numero_de_cuenta} es #{cuenta1.saldo}"
puts "El saldo de la cuenta #{cuenta2.numero_de_cuenta} es #{cuenta2.saldo}"
puts "El saldo de la cuenta #{cuenta3.numero_de_cuenta} es #{cuenta3.saldo}"
puts "El saldo de la cuenta #{cuenta4.numero_de_cuenta} es #{cuenta4.saldo}"
puts "\n"
cuenta1.transferir(5000,cuenta2)
cuenta2.transferir(2500,cuenta3)
puts "Se hizo una transferencia de la cuenta #{cuenta1.numero_de_cuenta} a la cuenta #{cuenta2.numero_de_cuenta} por un monto de 5000"
puts "Se hizo una transferencia de la cuenta #{cuenta2.numero_de_cuenta} a la cuenta #{cuenta3.numero_de_cuenta} por un monto de 2500"
puts "\n"
puts "El saldo de la cuenta #{cuenta1.numero_de_cuenta} es #{cuenta1.saldo}"
puts "El saldo de la cuenta #{cuenta2.numero_de_cuenta} es #{cuenta2.saldo}"
puts "El saldo de la cuenta #{cuenta3.numero_de_cuenta} es #{cuenta3.saldo}"
puts "El saldo de la cuenta #{cuenta4.numero_de_cuenta} es #{cuenta4.saldo}"
puts "\n"
puts "El saldo del Usuario1 es #{usuario1.saldo_total}"
puts "El saldo del Usuario2 es #{usuario2.saldo_total}"