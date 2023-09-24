import dependencias.*
import pedidos.*


class ChevroletCorsa {
	var property color
	
	method capacidadDePasajeros() = 4
	method velocidadMaxima() = 150
	method peso() = 1300
	
	
}
 
class RenaultKwid {
	var property color
	var property tieneTanqueAdicional = false
	
	
	method capacidadDePasajeros() = if (tieneTanqueAdicional) (3) else (4)
	method velocidadMaxima() = if (tieneTanqueAdicional) (110) else (120)

	method peso() = if (tieneTanqueAdicional) ( 1200 + 150 ) else (1200)
	method color() = 'azul'	
}



object trafic {
	var property interior
	var property motor
	
	method capacidadDePasajeros() = interior.capacidadDePasajeros() // el objeto entiende el mensaje interno.
	method velocidadMaxima() = motor.velocidadMaxima()
	method peso() = 4000 + motor.peso() + interior.peso()
	
	method configurar(unInterior,unMotor) {
		interior = unInterior
		motor = unMotor
	}
	
	method color() = 'blanco'
}

object motorBataton {
	method peso() = 500
	method velocidadMaxima() = 80
}

object motoPulenta {
	method peso() = 800
	method velocidadMaxima() = 130
}


object interiorComodo {
	method capacidadDePasajeros() = 5
	method peso() = 700
}

object interiorPopular{
	method capacidadDePasajeros() = 12
	method peso() = 1000
}

class AutosEspeciales {
	var property capacidadDePasajeros
	var property velocidadMaxima
	var property peso
	var property color
}
