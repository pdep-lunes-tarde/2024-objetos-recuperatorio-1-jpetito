class ObjetoMagico{
    var poderBase

    method poder(mago)
}

class Varita inherits ObjetoMagico{

    override method poder(mago){
        if(mago.cantLetrasDelNombre() / 2 == 0){
            return poderBase * 1.5
        } else return poderBase
    }
}

class Tunica inherits ObjetoMagico{

    override method poder(mago){
        return poderBase + 2 * mago.resistenciaMagica()
    }
}

class TunicaEpica inherits Tunica{

    override method poder(mago){
        return super(mago) + 10
    }
}

class Amuleto{

    method poder(mago) = 200
}

object Ojota{

    method poder(mago) = 10 * mago.cantLetrasDelNombre()
}