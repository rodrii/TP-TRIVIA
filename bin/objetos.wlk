import wollok.game.*

object manzana {
	var property position = game.at(2,10)
	
	const property mapa = 2

	method image() = "manzana.png"
	
}


object nido{
	
	var property position = game.at(9,7)
	
	const property mapa = 2
	method image() = "nido.png"

	
	
}
object compu{
	const property mapa = 1
	var property position = game.at(4,15)
	method image() = "compu.png"

	
	
}

object pepitagris{
	const property mapa = 0
	var property position = game.at(5,8)
	method image() = "pepita-gris.png"

	
	
}
object libro{
	const property mapa = 0
	var property position = game.at(12,10)
	method image() = "libro.png"

	
	
}

object silvestre{
	const property mapa = 0
	var property position = game.at(3,8)
	method image() = "silvestre.png"

	
	
}
object escudo{
	const property mapa = 2
	var property position = game.at(5,3)
	method image() = "escudo.png"
	
	
	
}

object pepigrande{
	const property mapa = 1
	
	var property position = game.at(1,9)
	method image() = "pepita-grande.png"
	

}

object fondos{
	
	var property listaFondos =["fondoa.jpg","fondox.jpg","fondod.jpeg"]
	var property mapa = 1
	
	method setMapa(elMapa){
		
		mapa = elMapa
	}
	
	
	method image() = listaFondos.get(mapa)
	
	method position() = new Position(x = 0, y = 0)	
	
	
}




object magoMalo{
	
	const property mapa = 1
	
	var property pasosIzq = 3
	var property pasosDer = 3
	
	var property position = game.at(15,12)
	method image() = "magoMalo.png"
	
	method movimiento(){
		
		game.onTick(1000, "pepitaMoving", { => 
			
			self.moverse()
			game.say(self, "hola!")
			
		})
		
	}
	
	method moverse(){
		
		if(pasosDer>0){
			
			self.muevoDer()
			
		}else{
			
			if(pasosIzq>0){
				
				self.muevoIzq()
				
			}else{
				
				pasosDer = 3
				pasosIzq = 3
			}
		}
	}
	
	method muevoIzq(){
		
			var posx =  self.position().x()
			posx = posx -1
			position = game.at(posx,12)
			pasosIzq--
		
	}
	
	method muevoDer(){
		
			var posx =  self.position().x()
			posx = posx +1
			position = game.at(posx,12)
			pasosDer--

	}		
	
	method removeTick(){
		
		game.removeTickEvent("pepitaMoving")
	}
	
	
}