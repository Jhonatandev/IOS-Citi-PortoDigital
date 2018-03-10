//: Playground - noun: a place where people can play

import UIKit

//Variaveis - dinamicamente tipada, e fortemente tipada

var str = "Hello, playground"
var numero: Float = 23


//Arrays

var matriz: [[Int]] = [[20,30], [30,40]]
var matriz2:[[Int]] = [[40,20],[3,20]]
var array = [20,30,50]
array.append(29)
array[0]
array.removeFirst()
array[0]
array.remove(at: 2)
array.popLast() // remove e retorna o ultimo numero
array.isEmpty
array.count
array.removeAll()
array.isEmpty


//Dicionario

var dicionario: [String:String] = ["Nome":"Brasil",
                                   "Cidade":"Olinda"]

var dicionario1:[Int:(String,String)] = [1:("Teste","Teste2")]
print(10)


//0. For

var arraynotas:[Int] = [1,3,4,5,9,10]

for notas in arraynotas{
    print("Notas do aluno = \(notas)")
}

for index in 1 ... 10{
    print(index)
}

//1. While

var contador = -3
while contador < 10 {
    contador += 1
    print(contador)
}

//2. Repeat while

var contador2 = -4
repeat{
    contador2 += 1
    print(contador2)
}while(contador2 < 10)

//Funcões

func maior(primeiro: Int, segundo:Int) -> Int{
    if primeiro > segundo{
        return primeiro
    }else{
        return segundo
    }
}
func soma(_ x: Int, _ y: Int) -> Int{
    return x + y
}

func mux(um operador1: Int, por operador2:Int) -> Int{
    return operador1 * operador2
}
mux(um: 2, por: 3)
maior(primeiro: 2, segundo: 3)
soma(3, 5)

struct Point{
    var x:Int
    var y:Int
    
    init(x: Int, y:Int) {
        self.x = x;
        self.y = y;
    }
}

var ponto = Point(x: 3, y: 5)

func increment(ponto2: inout Point){
    ponto2.x += 10
    ponto2.y += 20
    print(ponto.x)
}
increment(ponto2: &ponto)

var numeros: [Int] = [356, 236, 45, 321, 345]

var numerosOrdenados = numeros.sorted { (x, y) -> Bool in
    x > y
}

//ENUM

enum Tipo{
    case agua
    case terra
    case fogo
    case ar
}

var meuTipo: Tipo
meuTipo = .ar
