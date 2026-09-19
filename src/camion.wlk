import cosas.*

object camion {
	const property cosas = []
	const pesoTotalDelCamion = 2500
	
	method cargar(unaCosa) {
		if ((self.pesoTotal() + unaCosa.peso()) <= pesoTotalDelCamion)
		cosas.add(unaCosa)
		unaCosa.modificarCosaAlCargar()
	}

	method descargar(unaCosa){
		if (cosas.contains(unaCosa))
		cosas.remove(unaCosa)
	}

	method pesoTotal(){
		return 1000 + self.pesoDeCosas(cosas)
	}
	
	method pesoDeCosas(lista){
		var pesoTotalDeCosas = 0
		lista.forEach({unaCosa => 
			pesoTotalDeCosas += unaCosa.peso()
		})
		return pesoTotalDeCosas
	}

	method excedidoDePeso(){
		return (self.pesoTotal() > pesoTotalDelCamion)
	}

	method objetosPeligrosos(nivel){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return !cosas.any({unaCosa => unaCosa.nivelPeligrosidad() > nivelMaximoPeligrosidad}) 
	}

//agregados al camion
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({
			unaCosa => (unaCosa.peso() >= min && unaCosa.peso() <= max)
		})
	}
	//El Camion debe tener al menos una cosa
	method cosaMasPesada(){
		var cosaMasPesada = cosas.first()

		cosas.forEach({ unaCosa =>
			if (unaCosa.peso() > cosaMasPesada.peso())
				cosaMasPesada = unaCosa
		})
		return cosaMasPesada
	}

	method totalBultos(){
		return self.cantidadBultosEnCosas(cosas)
	}

	method cantidadBultosEnCosas(lista){
	var cantidadBultos = 0

	lista.forEach({ unaCosa =>
			cantidadBultos += unaCosa.cantidadBultos()})
		return cantidadBultos
	}

	method pesos(){
		var listaDePesos = []

		cosas.forEach({unaCosa =>
			listaDePesos.add(unaCosa.peso())
		})
		return listaDePesos
	}	

}