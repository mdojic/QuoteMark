//: Playground - noun: a place where people can play

import UIKit

// Struktura za predstavljanje matrice
// Definisan je subskript za intuitivno pristupanje elementima
struct Matrica {
    
    var redovi: Int
    var kolone: Int
    var tabela: [Int]
    
    init(redovi: Int, kolone: Int) {
        self.redovi = redovi
        self.kolone = kolone
        let velicina = redovi * kolone
        self.tabela = [Int](count: velicina, repeatedValue: 0)
    }
    
    subscript(red: Int, kolona: Int) -> Int {
        get {
            return tabela[(red * kolone) + kolona]
        }
        
        set (novaVrednost) {
            tabela[(red * kolone) + kolona] = novaVrednost
        }
    }
}

// Koriscenje subskripta
var matrica = Matrica(redovi: 3, kolone: 3)
matrica[0, 0] = 1
matrica[1, 1] = 1
matrica[2, 2] = 1

print(matrica[1, 1])    // 1
print(matrica[0, 1])    // 0


// Primer uskladistenih polja 
class NekaKlasa {
    var inicijalizovanoPolje : String  = "definicija"
    var praznoPolje : String?
    var inicijalizovanoPriInstanciranju: String
    
    init(vrednost: String) {
        self.inicijalizovanoPriInstanciranju = vrednost
    }
    
}

// Pristup uskladistenim poljima
var instanca = NekaKlasa(vrednost: "instanciranje")
print(instanca.inicijalizovanoPolje)                // "definicija"
print(instanca.praznoPolje)                         // nil
print(instanca.inicijalizovanoPriInstanciranju)     // "instanciranje"


// Primer lenjih uskladistenih polja
class Igra {
    
    var brojRundi: Int
    lazy var pocetniIgraci: [String] = self.kreirajPocetneIgrace()
    
    init(brojRundi: Int) {
        self.brojRundi = brojRundi
    }
    
    func kreirajPocetneIgrace() -> [String] {
        return ["Marko", "Janko", "Pera", "Djura"]
    }
}

// Primer izracunatog polja
class Pravougaonik {
    
    var gornjiLeviX: Double
    var gornjiLeviY: Double
    var sirina: Double
    var duzina: Double
    
    var centar: (x: Double, y: Double) {
        get {
            let x = gornjiLeviX + duzina/2
            let y = gornjiLeviY + sirina/2
            return (x, y)
        }
        set (noviCentar) {
            gornjiLeviX = noviCentar.x - duzina/2
            gornjiLeviY = noviCentar.y - sirina/2
        }
    }
    
    init(gornjiLeviX: Double, gornjiLeviY: Double, sirina: Double, duzina: Double) {
        self.gornjiLeviX = gornjiLeviX
        self.gornjiLeviY = gornjiLeviY
        self.sirina = sirina
        self.duzina = duzina
    }
}

// Instanciranje pravogaonika sa koordinatama gornjeg levog temena i dimenzijama
var p = Pravougaonik(gornjiLeviX: 3.0, gornjiLeviY: 2.0, sirina: 4.0, duzina: 5.0)

// Provera centra izracunatog na osnovu gornjeg levog temena i dimenzija
print(p.centar)                         // (5.5, 4.0)

// Promena centra i provera novog gornjeg levog temena
p.centar = (6.0, 6.0)
print(p.gornjiLeviX, p.gornjiLeviY)     // (3.5, 4.0)


// Primer read-only izracunatog polja
class Kocka {
    var stranica: Double
    var zapremina: Double {
        return stranica * stranica * stranica
    }
    
    init(stranica: Double) {
        self.stranica = stranica
    }
}

var k = Kocka(stranica: 3.0)
print(k.zapremina)      // 27.0


// Primer posmatraca polja
class Osoba {
    var ime: String
    var prezime: String
    var masa: Double {
        willSet {
            
            var promena: String
            let razlika: Double = abs(newValue - masa)
            
            if (newValue > masa) {
                promena = "se ugojila"
            } else {
                promena = "je smrsala"
            }
            
            print("Osoba \(ime) \(prezime) \(promena) \(razlika)kg")
        }
        
        didSet {
            // Masa ne moze biti negativna
            if (masa < 0) {
                masa = 0
            }
        }
    }
    
    init(ime: String, prezime: String, masa: Double) {
        self.ime = ime
        self.prezime = prezime
        self.masa = masa
    }
}

var o = Osoba(ime: "Petar", prezime: "Petrovic", masa: 70.0)
o.masa = 64     // Osoba Petar Petrovic je smrsala 6.0kg

// Dve funkcije tipa (Int, Int) -> Int
func saberi(a: Int, b: Int) -> Int {
    return a + b
}

func pomnozi(a : Int, b: Int) -> Int {
    return a * b
}

// Promenljiva funkcionalnog tipa (Int, Int) -> Int
var racunanje : (Int, Int) -> Int




// Primer funkcije kao parametra druge funkcije
func kompozicija(f1 f1: (Int) -> Int, f2: (Int) -> Int, a: Int) -> Int {
    let rezultat1 = f2(a)
    let rezultat2 = f1(rezultat1)
    return rezultat2
}

func kvadriraj(a: Int) -> Int {
    return a * a
}

func prepolovi(a: Int) -> Int {
    return a/2
}

var kvad : (Int) -> Int = kvadriraj
var pol : (Int) -> Int = prepolovi
var rezultat = kompozicija(f1: kvad, f2: pol, a: 6)  // 9

// Funkcija kao povratna vrednost funkcije
func korak(napred: Bool) -> (Int) -> Int {
    
    // Ako je korak unapred, vrednost se povecava, inace smanjuje
    let znak = napred ? 1 : -1
    
    // Funkcija za vracanje kao rezultat
    func modifikator(a: Int) -> Int{
        return a + (1 * znak)
    }
    
    return modifikator
}

// Skladistenje povratne vrednosti funkcije "korak" u promenljive
var korakNapred = korak(true)
var korakNazad = korak(false)

// Koriscenje promenljive funkcionalnog tipa
var vrednost = 3
var uvecano = korakNapred(vrednost)    // 4
var umanjeno = korakNazad(vrednost)    // 5

typealias Parameters = Int

var sabiranje = { (a: Int, b: Int) -> Int in
    return a + b
}

print(sabiranje(3, 2))

// Zakljucivanje tipa parametara iz konteksta (type inferrence),
// i izostavljanje "return" kljucne reci za krace zatvorenje u jednom redu
var zbir : (Int, Int) -> Int = { a, b in a + b }


// Koriscenje implicitnih skracenih naziva za parametre
var saberi : (Int, Int) -> Int = { return $0 + $1 }

// Skraceni nazivi za parametre + izostavljanje "return" kljucne reci
var saberi2 : (Int, Int) -> Int = { $0 + $1 }

// Funkcija ciji je poslednji argument funkcionalnog tipa
func izracunaj(a: Int, _ b: Int, funkcija: (Int, Int) -> Int) -> Int {
    return funkcija(a, b)
}

// Poziv funkcije bez koriscenja prateceg zatvorenja
izracunaj(4, 5, funkcija: { a, b in
    return a + b
})

// Poziv funkcije sa koriscenjem prateceg zatvorenja
izracunaj(4, 5) { a, b in
    return a + b
}

typealias NekiTip = Int
protocol NekiProtokol {
    
}

protocol NekiDrugiProtokol {
    
}

// Prosirenje tipa
extension NekiTip {
    // Telo prosirenja
}

// Prosirenje tipa uz dodavanje protokola koje implementira
extension NekiTip : NekiProtokol, NekiDrugiProtokol {
    // Telo prosirenja
}

extension Int {
    
    // Dodavanje privatnog izracunatog polja
    // Vraca niz koji sadrzi cifre broja
    var cifre : [Int] {
        get {
            var cifre = [Int]()
            var pom = self
            
            while pom != 0 {
                cifre.append(pom % 10)
                pom = pom / 10
            }
            return cifre.reverse()
        }
    }
    
    // Dodavanje izracunatog polja za proveru parnosti
    var neparan : Bool {
        return (self % 2) == 1
    }
    
    // Dodavanje metoda za dobijanje delilaca broja
    func delioci() -> [Int] {
        
        let polovina = self/2
        var delioci = [Int]()
        
        for i in 2...polovina {
            if (self % i == 0) {
                delioci.append(i)
            }
        }
        return delioci
    }
    
    // Dodavanje subskripta za vadjenje cifre broja
    subscript (indeksCifre: Int) -> Int? {
        let cifre : [Int] = self.cifre
        let pozitivanIndeks = indeksCifre > 0
        let prevelikIndeks  = indeksCifre - 1 > cifre.count
        let ispravanIndeks  = pozitivanIndeks && !prevelikIndeks
        return ispravanIndeks ? cifre[indeksCifre-1] : nil
    }
}

// Promenljiva tipa Int za testiranje
var broj : Int = 1313

// Provera parnosti dodatim poljem
print(broj.neparan)     // true

// Provera druge cifre broja koristeci opcionalno vezivanje
if let cifra = broj[2] {
    print("Druga cifra: \(cifra)")  // Druga cifra: 3
} else {
    print("Broj nema drugu cifru")
}

// Provera delioca broja novim metodom
print(broj.delioci())   // [13, 101]

// Opsta sintaksa deklaracije protokola sa nasledjivanjem protokola
protocol ImeProtokola : NekiProtokol, NekiDrugiProtokol {
    // Telo protokola
}


enum TipIshrane {
    case Mesojed, Biljojed, Svastojed
}

protocol Zivotinja {
    
    // read-only polja
    var tipIshrane: TipIshrane { get }
    var brojNogu: Int { get }
    
    // read-write polje
    var starost: Int { get set }
    
    init(starost: Int)
    
    func omiljenaHrana() -> String
}

class Zec : Zivotinja {
    var tipIshrane : TipIshrane
    var brojNogu: Int
    var starost: Int
    
    required init(starost: Int) {
        self.starost = starost
        self.tipIshrane = .Biljojed
        self.brojNogu = 4
    }
    
    func omiljenaHrana() -> String {
        return "Kupus"
    }
}
