object neo{
    var energia = 100

    method energia() = energia

    method saltar() {
        energia = (energia / 2).max(0)
    }

    method vitalidad() = energia / 10

    method esElElegido() = true

    method subir() {
        nave.subirA(self)
    }
    method bajar() {
        nave.bajarA(self)
    }
    method limpiarBanio() {}
}

object morfeo{
    var vitalidad = 8
    var estaCansado = false

    method vitalidad() = vitalidad

    method esElElegido() = false

    method saltar() {
        estaCansado = not estaCansado
        vitalidad = (vitalidad - 1). max(0)
    }   
    method subir() {
        nave.subirA(self)
    }
    method bajar() {
        nave.bajarA(self)
    }
    method limpiarBanio() {}
}
object trinity {

    method vitalidad() = 0
    method saltar() {}
    method esElElegido() = false   
    method subir() {
        nave.subirA(self)
    }
    method bajar() {
        nave.bajarA(self)
    } 
    method limpiarBanio() {}
} 

object nave{
    const pasajeros = #{}

    var potenciaVital = 1

    method subirA(alguien){
        pasajeros.add(alguien)
    }

    method bajarA(alguien){
        pasajeros.remove(alguien)
    }

    method cantidadDePasajeros() = pasajeros.size()
    
    method pasajeroConMayorVitalidad() = pasajeros.max({p => p.vitalidad()})

    method pasajeroConMenorVitalidad() = pasajeros.min({p => p.vitalidad()})

    method estaEquilibrada() = self.pasajeroConMayorVitalidad().vitalidad() <=
                               self.pasajeroConMenorVitalidad().vitalidad() *2

    method estaElElegido() = pasajeros.any({p => p.esElElegido()})

    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.forEach({p=> p.bajar()})
    }

    method acelerar() {
        self.losNoElegidos().forEach({p => p.saltar()})
    }

    method losNoElegidos() = pasajeros.filter({p=> not p.esElegido()})
    
    method pasajerosValiosos()= pasajeros.filter({p => p.vitalidad() > 5})

    method hayAlgunoAlHorno() = pasajeros.any({p => p.vitalidad() == 0})

    method todosPuedenEnfrentarAgente() = pasajeros.all({p => p.vitalidad() > 2})

    method vitalidadPromedio() = pasajeros.average({p => p.vitalidad()})

    method cuantosTienenVitalidadPar() = pasajeros.count({p => p.vitalidad().even()})

    method simulacro(){
        pasajeros.forEach(
            {p =>
                 p.saltar()
                 p.saltar()
                 p.saltar()})

    }

    method laVitalidadDeTodos() = pasajeros.map({p => p.vitalidad()})

    method deMenorAMayor() = pasajeros.sortBy({p1, p2 =>p1.vitalidad() < p2.vitalidad()})

    method limpiarBanio() = pasajeros.anyOne().limpiarBanio()

    method cantidadDeElegidos() = pasajeros.count({p => p.esElElegido()})

    method potenciaVital() =
         pasajeros.forEach({p => potenciaVital = potenciaVital * p.vitalidad()})
    

}