//: Playground - noun: a place where people can play

import UIKit

var palavra: String?

palavra = "Teste"
if let palavra = palavra{
    for letra in palavra{
        print(letra)
    }
}else{
    print("houve um erro")
}

var novaPalavra: String?
var novaPalavra2: String?

novaPalavra = "Teste nova palavra"
novaPalavra2  = "Nova Palavra 2"

func desempacote(palavr1: String?, palavr2: String?) throws -> [String] {
    guard let palavr1 = palavr1, let palavr2 = palavr2 else{
        throw Erros.PalavraNaoIdentificada
    }
    return [palavr1, palavr2]
}

enum Erros:Error{
    case PalavraNaoIdentificada
}

var asPalavrasDesempacotadas: [String]

do{
    try asPalavrasDesempacotadas = desempacote(palavr1: novaPalavra, palavr2: novaPalavra2)
}catch Erros.PalavraNaoIdentificada{
    print("Sem palavra(s)")
}








