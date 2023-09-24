import rodados.*
import dependencias.*


class Pedidos{
	
	const property distancia
	const property tiempo
	const property pasajeros
	const property colorIncompatibles = #{}
	
	method velocidadRequerida() {
		return distancia/tiempo
	}
	
	method puedeSerSatispechoPor(unRodado) {
		return unRodado.velocidadMaxima() >= 10+self.velocidadRequerida()
		and unRodado.capacidadDePasajeros() >= pasajeros
		and self.esDeColorCompatible(unRodado.color())
	}
	
	
	method esDeColorCompatible(unColor) {
		return not colorIncompatibles.contains(unColor)
	}
	
	method ningunoSatisfaceElPedido(pedido) {
		return not rodados.any({r => pedido.puedeSerSatispechoPor(r)})
	}
}
