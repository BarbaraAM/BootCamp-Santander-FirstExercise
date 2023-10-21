import Foundation
import UIKit

enum Curso {
    case matematica
    case historia
    case ciencias
    case linguas
}
class Aluno {
    var nome: String
    var idade: Int
    var curso: Curso
    
    init(nome: String, idade: Int, curso: Curso) {
        self.nome = nome
        self.idade = idade
        self.curso = curso
    }
    
    func estudar(materia: Curso) {
        print("\(nome) está estudando \(nomeDoCurso(materia)).")
    }
    
    func fazerProva(materia: Curso) {
        print("\(nome) está fazendo prova de \(nomeDoCurso(materia)).")
    }
    
    func avaliarNota(_ nota: Int) {
        switch nota {
        case 0...4:
            print("\(nome) está reprovado.")
        case 5...6:
            print("\(nome) está de recuperação.")
        case 7...10:
            print("\(nome) está aprovado.")
        default:
            print("Nota inválida para \(nome).")
        }
    }
    
    func downloadMaterialDeEstudo() {
        let queue = DispatchQueue.global(qos: .utility)
        
        queue.async {
            print("Iniciando o download do material de estudo para \(self.nome)")
            sleep(3)
            print("Download concluído para \(self.nome)")
        }
    }
}

func nomeDoCurso(_ curso: Curso) -> String {
    switch curso {
    case .matematica: return "Matemática"
    case .historia: return "História"
    case .ciencias: return "Ciências"
    case .linguas: return "Linguagens"
    }
}
let aluno1 = Aluno(nome: "João", idade: 20, curso: .matematica)
let aluno2 = Aluno(nome: "Maria", idade: 22, curso: .linguas)

var alunosArray: [Aluno] = []
var alunosDict: [String: Aluno] = [:]

alunosArray.append(aluno1)
alunosArray.append(aluno2)

alunosDict[aluno1.nome] = aluno1
alunosDict[aluno2.nome] = aluno2

func calcularIdadeMedia(alunos: [Aluno]) -> Double {
    var somaIdades = 0
    for aluno in alunos {
        somaIdades += aluno.idade
    }
    return Double(somaIdades) / Double(alunos.count)
}

let idadeMedia = calcularIdadeMedia(alunos: alunosArray)
print("Idade média dos alunos: \(idadeMedia)")

func gerenciarAlunos() {
    for aluno in alunosArray {
        print("Nome: \(aluno.nome)")
        print("Idade: \(aluno.idade)")
        print("Curso: \(nomeDoCurso(aluno.curso))")
        aluno.estudar(materia: aluno.curso)
        aluno.fazerProva(materia: aluno.curso)
        aluno.avaliarNota(8)
        aluno.downloadMaterialDeEstudo()
        print()
    }
}
gerenciarAlunos()

