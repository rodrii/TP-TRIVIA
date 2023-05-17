import wollok.game.*
import personaje.*
import objetos.*

object juegoPepita {

	var enJuego = true
	
	var mapaviejo = 19

	method configurar() {
	
		armarNivel.armar(99, 99)
		teclado.configurar()
	
	}
	
}

object teclado {

	method configurar() {
	
		keyboard.left().onPressDo({ personaje.irA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.irA(personaje.position().right(1))})
		keyboard.up().onPressDo({ personaje.irA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.irA(personaje.position().down(1))})
		
		keyboard.c().onPressDo({ 
			
			if(game.colliders(personaje) != []) {personaje.agarraObjeto(game.uniqueCollider(personaje))}
		})
		
		keyboard.k().onPressDo({ 
			
			if(personaje.devolverObjetos().size() >= 6) {
				
				game.stop()
			}
		})	

		}		
		
}

object armarNivel{
	
	//var property objetosNiveles = #{manzana, nido,pepigrande,libro,silvestre,escudo, magoMalo}
	var property objetosNiveles = #{manzana, nido,pepigrande,libro,silvestre,escudo, magoMalo}
	var property objetosPepita = #{}
	
	method agregoObjetosPepita(){
		
		objetosPepita = personaje.devolverObjetos()
	}
	
	method armar(mapaNuevo, mapaViejo){

		if(mapaViejo == 99){
			
			game.addVisual(fondos)
			game.addVisual(pepigrande)
			game.addVisual(magoMalo)
			magoMalo.movimiento()
			game.addVisual(personaje)
			
		}else{

			self.agregoObjetosPepita()

			game.removeVisual(personaje)
	
			objetosPepita.forEach { obj => 
			
				if(objetosNiveles.contains(obj)){
				
					objetosNiveles.remove(obj)
				}
			}
			
			objetosNiveles.forEach { obj => 
			
				if(obj.mapa() == mapaViejo){
					
					if(obj == magoMalo){
						
						obj.removeTick()
					}
				
					game.removeVisual(obj)
			
				}
			}
		
			game.removeVisual(fondos)
		
			fondos.setMapa(mapaNuevo)
			game.addVisual(fondos)
		
		
			objetosNiveles.forEach { obj => 
			
				if(obj.mapa() == mapaNuevo){
				
					game.addVisual(obj)
					
					if(obj == magoMalo){
						
						obj.movimiento()
					}
					
				}
			}
		
		game.addVisual(personaje)
		
		
		}
		

	}

	
}


