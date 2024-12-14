class Mago{
    var objetosMagicos = #{}
    var poderInnato
    var nombre
    var property resistenciaMagica
    var property energiaMagica
    var caracteristica

    method poderTotal() = self.sumatoriaPoderDeSusObjetos() * poderInnato

    method sumatoriaPoderDeSusObjetos() = objetosMagicos.sum({objeto => objeto.poder(self)})

    method cantLetrasDelNombre() = nombre.size()

    method desafiar(otroMago){ //tambien funciona con un gremio
        if(self.vence(otroMago)){
           self.ganarleA(otroMago)
        } // sino no pasa nada porque no se puede vencer
    }

    method vence(otroMago) = caracteristica.esVencidoPor(otroMago, self)

    method ganarleA(otroMago){
        self.sumarPuntosMagicos(otroMago.puntosPerdidos())
        otroMago.perdio()
    }

    method sumarPuntosMagicos(cant){
        energiaMagica += cant
    }

    method restarPuntosMagicos(cant){
        energiaMagica -= cant
    }

    method puntosPerdidos() = caracteristica.puntosPerdidos(self)

    method perdio(){
        self.restarPuntosMagicos(caracteristica.puntosPerdidos(self))
    }

    method esUnGremio() = false

}

///////caracteristicas 
object aprendiz{

    method esVencidoPor(vencido, atacante) = vencido.resistenciaMagica() < atacante.poderTotal()
    
    method puntosPerdidos(mago) = mago.energiaMagica() / 2
    
}

object veterano{
    
    method esVencidoPor(vencido, atacante) = vencido.resistenciaMagica() * 1.5 <= atacante.poderTotal()

    method puntosPerdidos(mago) = mago.energiaMagica() * 0.25
}

object inmortal{

    method esVencidoPor(vencido, atacante) = false

    method puntosPerdidos(mago) = 0
}