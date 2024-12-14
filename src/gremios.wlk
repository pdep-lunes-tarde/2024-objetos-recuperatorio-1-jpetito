class Gremio{
    var miembros = #{}

    method initialize() {
        if(miembros.size() <= 2){
            throw new Exception(message = "Un gremio debe tener al menos dos miembros")
        }
    }

    method esGremio() = true

    method poderTotal() = miembros.sum({miembro => miembro.poderTotal()})

    method energiaMagica() = miembros.sum({miembro => miembro.energiaMagica()})

   // method liderDelGremio() = miembros.max({miembro => miembro.poderTotal()}) lo modifico para cumplir con el requerimiento del punto 3.

    method miembroConMasPoder() = miembros.max({miembro => miembro.poderTotal()}) 

    method liderDelGremio() {
        const masPoderoso = self.miembroConMasPoder()
        if(masPoderoso.esGremio()){ //si el miembro mas poderoso es un gremio
            return masPoderoso.liderDelGremio() //el lider del gremio padre es el lider del gremio hijo
        } else return masPoderoso // si el miembro mas poderoso no es un gremio entonces ese es el lider
    }

    method resistenciaMagica() = self.sumaDeResistenciaMagica() + self.liderDelGremio().resistenciaMagica()

    method sumaDeResistenciaMagica() = miembros.sum({miembro => miembro.resistenciaMagica()})

    method desafiar(otroGremio){ //tambien funciona con un miembro, no tiene porque ser otro gremio
        if(self.vence(otroGremio)){
            self.ganarleA(otroGremio)
        }
    }

    method ganarleA(otroGremio){
        self.sumarPuntosMagicos(otroGremio.puntosPerdidos())
        otroGremio.perdio()
    }

    method sumarPuntosMagicos(cant){
        self.liderDelGremio().sumarPuntosMagicos(cant)
    }

    method perdio(){
        miembros.forEach({miembro => miembro.perdio()})
    }

    method puntosPerdidos() = miembros.sum({miembro => miembro.puntosPerdidos()})
    
    method vence(otroGremio) = self.esVencidoPor(otroGremio, self)

    method esVencidoPor(gremioVencido, gremioAtacante) =  gremioAtacante.poderTotal() > gremioVencido.liderDelGremio().resistenciaMagica()

}