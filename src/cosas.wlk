object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }

	method cantidadBultos(){
		return 1
	}

	method modificarCosaAlCargar(){
		return null
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method cantidadBultos(){
		return 2
	}

	method modificarCosaAlCargar(){
		transformadoEnAuto = false
	}
}

object paqueteDeLadrillos{
	var cantidadDeLadrillos = 0
	
	method cantidadDeRefuerzos(){
		if (cantidadDeLadrillos <= 1000){
			return (cantidadDeLadrillos / 100).roundUp()
		} else {
			return (cantidadDeLadrillos / 50).roundUp()
		}
	}

	method peso(){
		return cantidadDeLadrillos * 2 + self.cantidadDeRefuerzos() * 10
	}

	method nivelPeligrosidad(){
		return (50 - self.cantidadDeRefuerzos()).max(0)
	}

	method LadrillosACargar(cantidad){
		cantidadDeLadrillos = cantidad
	}

	method cantidadBultos(){
		if (cantidadDeLadrillos <= 100) {
			return 1
		} else if (cantidadDeLadrillos <= 300){
			return 2
		} else {
			return 3
		}
	}

	method modificarCosaAlCargar(){
		cantidadDeLadrillos -= 12
	}
}


object arenaAGranel{
	var arenaEnKilos = 0

	method peso(){
		return arenaEnKilos
	}

	method nivelPeligrosidad(){
		return 1
	}

	method ingresarArena(cantidad){
		arenaEnKilos = cantidad
	}

	method cantidadBultos(){
		return 1
	}
	
	method modificarCosaAlCargar(){
		arenaEnKilos = (arenaEnKilos - 15).max(0)
	}
}

object bateriaAntiaerea{
	var tieneMisiles = true

	method peso(){
		if (tieneMisiles){
			 return 300
		} else {
			 return 200
		}
	}

	method nivelPeligrosidad(){
		return if (tieneMisiles){
			100
		} else {
			0
		}
	}

	method subirBajarMisiles(){
		tieneMisiles = not tieneMisiles
	}

	method cantidadBultos(){
		if (tieneMisiles){
			return 2
		} else {
			return 1
		}
}
	method modificarCosaAlCargar() {
		tieneMisiles = true
	}

}


object contenedorPortuario{
	const property cosasAdentro = []

	method peso(){
		return 100 + self.pesoDeCosas(cosasAdentro)
	}

	method pesoDeCosas(lista){
		var pesoTotalDeCosas = 0
		lista.forEach({unaCosa => 
			pesoTotalDeCosas += unaCosa.peso()
		})
		return pesoTotalDeCosas
	}

	method nivelPeligrosidad(){
		return self.cosaConMasNivelDePeligrosidadDe(cosasAdentro)
	}

	method cosaConMasNivelDePeligrosidadDe(lista){
		var mayorPeligrosidad = 0
		lista.forEach({ unaCosa =>
					mayorPeligrosidad = mayorPeligrosidad.max(unaCosa.nivelPeligrosidad())})
		return mayorPeligrosidad
	}

	method cantidadBultos(){
		return 1 + self.cantidadBultosEnCosas(cosasAdentro)
	}

	method cantidadBultosEnCosas(lista){
		var cantidadBultos = 0

		lista.forEach({ unaCosa =>
			cantidadBultos += unaCosa.cantidadBultos()})
		return cantidadBultos
		
	}

	method modificarCosaAlCargar() {
	  cosasAdentro.forEach({unaCosa =>
	  	unaCosa.modificarCosaAlCargar()
		})
	}
}


object residuosRadioactivos{
	var pesoResiduos = 0

	method peso(){
		return pesoResiduos
	}

	method pesoActual(pesoIngresado){
		pesoResiduos = pesoIngresado
	}

	method nivelPeligrosidad(){
		return 200
	}

	method cantidadBultos(){
		return 1
	}

	method modificarCosaAlCargar() {
	  pesoResiduos = (pesoResiduos - 15).max(0)
	}
}


object embalajeDeSeguridad{
	var objetoAEmbalar = bumblebee

	method peso(){
		return (objetoAEmbalar.peso())
	}

	method nivelPeligrosidad(){
		return objetoAEmbalar.nivelPeligrosidad() / 2
	}

	method cantidadBultos(){
		return 2
	}

	method modificarCosaAlCargar(){
		return null
	}
}