import rodados.*
import pedidos.*

class Dependencias {
	
	var property cantidadDeEmpleados
    const rodados = []
    
    method agregarAFlota(rodado) = rodados.add(rodado)
    method quitarDeFlota(rodado) = rodados.remove(rodado)
    method pesoTotalDeFlota() = rodados.sum({r => r.peso()})
    method estaBienEquilibrada() = rodados.size() > 3 && self.todosSuperanVelocidad(100)
    method todosSuperanVelocidad(unaVelocidad) {return  rodados.velocidadMaxima() > unaVelocidad}
    method capacidadTotalEnColor(color) = self.rodadosDeUnColor(color).sum({r => r.capacidadDePasajeros()})
    method rodadosDeUnColor(color) { return rodados.filter({r=>r.color() ==  color})}
    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
   
    method rodadoMasRapido() {
    if(rodados.isEmpty()) 
     self.error("no se puede calcular el maximo")
     return rodados.max({r => r.velocidadMaxima()})
    }
    
    method capacidadFaltante() = 0.max(cantidadDeEmpleados - self.capacidadDeLaFlota())
    method capacidadDeLaFlota() = rodados.sum({r => r.capacidadDePasajeros()})
    method esGrande() = cantidadDeEmpleados >= 40 and rodados.size() >= 5
    method ningunoSatisfaceElPedido(pedido) {
		return not rodados.any({r => pedido.puedeSerSatispechoPor(r)})
	}
	
    method pedidosSatisfechos() =
    	pedidos.filter({p => self.ningunoSatisfaceElPedido(p)})
   
}

