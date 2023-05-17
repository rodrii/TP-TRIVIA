import wollok.game.*
import niveles.*
import objetos.*

object personaje {
	
	var property objetos = #{}
	
	var property position = game.origin()
	var property energia = 100000000
	
	
	var property mapa = 1
	var property mapaQueDejo
	
	method image() =  "mariochico.png"
	
	method volar(kms) {
		
		energia = energia - (kms * 9)
	}
	
	method agarraObjeto(unObjeto){
		
		objetos.add(unObjeto)
		game.removeVisual(unObjeto)
		
	}
	
	
	method devolverObjetos(){
		
		return objetos
		
	}
	
	method irA(nuevaPosicion){
		
		var posy = position.y()
	
		if(position.x()<0 && objetos.size()>=1){
			
			position = new Position(x = 23, y = posy)
			mapaQueDejo = mapa
			mapa --
			armarNivel.armar(mapa,mapaQueDejo)
			
		}else if(position.x()==24 && objetos.size()>=1){
			
			position = new Position(x = 0, y = posy)
			mapaQueDejo = mapa
			mapa++
			armarNivel.armar(mapa,mapaQueDejo)
		
		}else if(position.x()==0  && objetos.size()<1 ){
			
			game.say(self, "No tenes los objetos!")
			position = new Position(x = 1, y = posy)
			self.irA(position)
			
			
		}else if(position.x()==23 && objetos.size()<1 ){
			
			game.say(self, "No tenes los objetos!")
			position = new Position(x = 22, y = posy)
			self.irA(position)
		
			
		}else{
			
			self.volar(nuevaPosicion.distance(position))
			position = nuevaPosicion
			self.corregirPosicion()	
			
		}
	
	}
	

	method corregirPosicion() {
		
		position = new Position(x = position.x().max(-1).min(game.width()), y = position.y().max(0).min(game.height()))
	}
	
	
	
	
}









