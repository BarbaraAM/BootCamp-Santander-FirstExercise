import Foundation

//Enum para representar os tipos de alimentação
enum TipoComida {
    case carne
    case vegetais
    case graos
    case peixe
}

//Protocolo dos animais
protocol Animal {
    var nome: String { get }
    var especie: String { get }
    var idade: Int { get }
    var comidaFavorita: TipoComida { get }
    func fazerSom()
    func alimentarAnimal(com comida: TipoComida)
}

//Estrutura que pega o protocolo Animal
struct Dog: Animal {
    var nome: String
    var especie: String {
        return "Cachorro"
    }
    var idade: Int
    var comidaFavorita: TipoComida

    func fazerSom() {
        print("Au Au Au")
    }

    func alimentarAnimal(com comida: TipoComida) {
        if comida == comidaFavorita {
            print("Essa é a comida favorita de \(nome)")
        } else {
            print("\(nome) come isso, mas preferiria \(comidaFavorita).")
        }
    }
}

struct Cat: Animal {
    var nome: String
    var especie: String {
        return "Gato"
    }
    var idade: Int
    var comidaFavorita: TipoComida

    func fazerSom() {
        print("Miau!")
    }

    func alimentarAnimal(com comida: TipoComida) {
        if comida == comidaFavorita {
            print("Essa é a comida favorita de \(nome)")
        } else {
            print("\(nome) come isso, mas preferiria \(comidaFavorita).")
        }
    }
}

func manageAnimals() {
    let dog = Dog(nome: "Lobo", idade: 2, comidaFavorita: .carne)
    let cat = Cat(nome: "Severo", idade: 3, comidaFavorita: .peixe)

    let animals: [Animal] = [dog, cat]

    for animal in animals {
        print("Nome: \(animal.nome)")
        print("Espécie: \(animal.especie)")
        print("Idade: \(animal.idade)")

        switch animal.comidaFavorita {
        case .carne:
            print("Comida favorita: Carne")
        case .vegetais:
            print("Comida favorita: Vegetais")
        case .graos:
            print("Comida favorita: Grãos")
        case .peixe:
            print("Comida favorita: Peixe")
        }

        animal.fazerSom()
        print()

        let randomFood = [TipoComida.carne, TipoComida.vegetais, TipoComida.graos, TipoComida.peixe].randomElement()!
        print("Alimentando com \(randomFood):")
        animal.alimentarAnimal(com: randomFood)
        print()
    }
}

manageAnimals()
