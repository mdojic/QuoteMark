//: Playground - noun: a place where people can play

import UIKit

class SomeClass {
    var someField : Int = 0
}

var str = "Hello, playground"



// Deklaracija konstante bez eksplicitno navedenog tipa
let const1 = 1

// Deklracija konstante sa eksplicitno navedenim tipom
let const2 : Int = 2

// Unarni operatori
// - (Prefiksni - Unarni minus)
-1

// ! (Prefiksni - negacija)
!true

// ! (Sufiksni - ekstrakcija vrednosti opcionog tipa)	
//let opcionaVrednost : Int? = 2
//let ekstrahovanaVrednost = opcionaVrednost!

//

// 2. Binarni operatori
// + (Sabiranje)
3 + 2   // 5

// - (Oduzimanje)
3 - 2   // 1

// * (Mnozenje)
3 * 2   // 6

// / (Deljenje)
3 / 2   // 1

// % (Ostatak pri deljenju)
3 % 2   // 1

// =, +=, *=, /=, -=, %= (Dodela vrednosti)
var number = 3  // 3
number += 2     // 5
number *= 2     // 10
number /= 2     // 5
number -= 2     // 3
number %= 2     // 1

// && (Logicko "i")
true && false    // false

// || (Logicko "ili")
true || false    // true

// == (Provera jednakosti)
true == false   // false

// !=, >, <, >=, <= (Provera nejednakosti)
3 != 2      // true
3 > 2       // true
3 < 2       // false
3 >= 2      // true
3 <= 2      // false

// === (Provera jednakosti po referenci)
var obj1 = SomeClass()
var obj2 = SomeClass()

obj1 === obj2   // false
obj1 = obj2     // obj1 prima istu referencu kao obj2
obj1 === obj2   // true

// !== (Provera nejednakosti po referenci)
var obj3 = SomeClass()
var obj4 = SomeClass()

obj3 !== obj4   // true
obj3 = obj4     // obj3 prima istu referencu kao obj4
obj3 !== obj4   // false

// nil-sjedinujuci operator (eng. nil-coalescing)
var opcionaVrednost : Int? = 2
var ekstrahovanaVrednost = opcionaVrednost ?? 3 // 2

opcionaVrednost = nil
ekstrahovanaVrednost = opcionaVrednost ?? 3     // 3
// Ovaj izraz je ekvivalentan izrazu: ekstrahovanaVrednost = opcionaVrednost ? opcionaVrednost! : 3

// ... (Zatvoreni interval)
for i in 1 ... 3 {
    // Radi nesto (koraci su i=1, i=2, i=3)
}

// ..< (Poluotvoreni interval)
for i in 1 ..< 3 {
    // Radi nesto (koraci su i=1, i=2)
}

// ? : (Ternarni operator)
let c = 5 > 4 ? 1 : 2   // c == 2


var NumberOfElements = 0
var InitialValue = SomeClass()


// Kreiranje praznog niza
var prazanNiz = [SomeClass]()
	
// Opsta sintaksa za kreiranje niza
var nekiNiz = [SomeClass](count: NumberOfElements, repeatedValue: InitialValue)

// Kreiranje niza sa incijalizacijom pocetne vrednosti svim njegovim elementima
var nizNula = [Int](count: 3, repeatedValue: 0)      // [0, 0, 0]

// Kreiranje niza sa inicijalizacijom svih njegovih elemenata
var nizBBrojeva : [Int] = [10, 20, 30]

// Pristup elementima niza
var brojevi = [Int](count: 3, repeatedValue: 10)
var broj = brojevi[0]       // 10

// Modifikovanje niza funkcijom append
brojevi.append(10)

// Modifikovanje niza dodavanjem vrednosti operatorom +=
brojevi += [10]

// Modifikovanje odredjenog elementa niza
brojevi[1] = 10

// Prolazak kroz niz for-in petljom
for broj in brojevi {
    // Radi nesto
}

// Sabiranje (konkatenacija) nizova
var niz1 = [1, 2, 3]
var niz2 = [4, 5]
var niz3 = niz1 + niz2      // [1, 2, 3 ,4, 5]

// Broj elemenata u nizu
var nizOdTriElementa = [1, 2 ,3]
// var brojElemenata = nizOdTriElementa.count      // 3

// Provera da li je niz prazan
var niz = [Int]()
var nizPrazan = niz.isEmpty     // true

typealias KeyType = Int
typealias ValueType = String


// Kreiranje praznog recnika
var prazanRecnik =  [KeyType: ValueType]()

// Kreiranje recnika sa inicijalnim vrednostima
var nekiRecnik : [Int : String] = [1 : "Jedan", 2 : "Dva", 3 : "Tri"]

// Pristupanje vrednosti recnika preko njenog kljuca
var vrednost = nekiRecnik[2]    // "Dva"	

// Menjanje vrednosti recnika
nekiRecnik[1] = "Kec"

// Uklanjanje vrednosti iz recnika
nekiRecnik.removeValueForKey(3)     // [1 : "Kec", 2: "Dva"]

// Prolazak kroz recnik for-in petljom
for (kljuc, vrednost) in nekiRecnik {
    // Radi nesto
}

// Vadjenje kljuceva u niz
var kljucevi = [Int](nekiRecnik.keys)

// Vadjenje vrednosti u niz
var vrednosti = [String](nekiRecnik.values)

// Broj elemenata u recniku
var recnikOdTriElementa = [1 : "Prvi", 2 : "Drugi", 3 : "Treci"]
var brojElemenata = recnikOdTriElementa.count   // 3

// Provera da li je recnik prazan
var recnik = [Int : String]()
var recnikPrazan = recnik.isEmpty   // true



// Opsta sintaksa za deklarisanje funkcije
//func imeFukcije(Parametri) -> povratniTip {
//    // Telo funkcije
//}


// Primer jednostavne funkcije
func punoIme(ime: String, prezime: String) -> String {
    return ime + " " + prezime
}

// Funkcija bez povratnog tipa
func pozdrav(ime: String) {
    print("Pozdrav, \(ime)")
}

// Drugi nacin zapisivanja da funkcija nema povratni tip
func pozdrav2(ime: String) -> Void {
    print("Pozdrav, \(ime)")
}

// Pozivanje funkcije
var ime = punoIme("Milan", prezime: "Dojic")    // "Milan Dojic"

// Davanje eksternog i lokalnog imena parametru i poziv takve funkcije
func nekaFunkcija(prviArgument a : Int, drugiArgument b : Int) {
    // Telo funkcije
}

nekaFunkcija(prviArgument: 1, drugiArgument: 2)

// Parametri kao otvoren niz
func proizvod(cinioci: Int...) -> Int {
    var rezultat = 1
    for cinilac in cinioci {
        rezultat *= cinilac
    }
    
    return rezultat
}

// Varijabilni parametar
func povecaj(inout a : Int) {
    a += 1
}

// Enum u swiftu
enum imeEnuma {
    case prvaVrednost
    case drugaVrednost
    // ...
    case ntaVrednost
}

// Enum sa pridruzenim vrednostima
enum PridruzeneVrednosti {
    case prvaVrednost(String)
    case drugaVrednost
    case trecaVrednost(Int, String)
    case cetvrtaVrednost([Float])
}

var prva = PridruzeneVrednosti.prvaVrednost("Prva")
var druga = PridruzeneVrednosti.drugaVrednost
var treca = PridruzeneVrednosti.trecaVrednost(3, "Treca")
var cetvrta = PridruzeneVrednosti.cetvrtaVrednost([0.1, 0.2, 0.3])

// Enum sa sirovim vrednostima
enum SiroveVrednosti : Int {
    case prvaVrednost = 7
    case drugaVrednost = 13
}

// Implicitna dodela uzastopnih vrednosti elementima enuma
enum UzastopneVrednosti : Int {
    case prvaVrednost = 1
    case drugaVrednost      // Implicitno dobija vrednost 2
    case trecaVrednost      // Implicitno dobija vrednost 3
}

// Deklaracija strukture sa promenljivim i konsantnim poljem, bez inicijalizatora
struct NekaStruktura {
    var promenljivoPolje : Int
    let konstantnoPolje : String
}

// Inicijalizacija strukture koristeci implicitni inicijalizator
var struktura = NekaStruktura(promenljivoPolje: 1, konstantnoPolje: "konstanta")

// Deklaracija strukture sa eksplicitnim inicijalizatorom
struct PravougliCetvorougao {
    var duzina: Int
    var sirina: Int
    
    init(duzina: Int) {
        self.duzina = duzina
        self.sirina = duzina
    }
    
    init(duzina: Int, sirina: Int) {
        self.duzina = duzina
        self.sirina = sirina
    }
}

// Inicijalizacija strukture koristeci eksplicitni inicijalizator
var kvadrat = PravougliCetvorougao(duzina: 4)
var pravougaonik = PravougliCetvorougao(duzina: 3, sirina: 4)


// Deklaracija klase sa inicijalizatorom, deinicijalizatorom i statickim poljem
class Vozilo {
    
    var brojTockova: Int
    static var vozilaNaOtpadu : Int = 0
    
    init(brojTockova: Int) {
        self.brojTockova = brojTockova
    }
    
    deinit {
        Vozilo.vozilaNaOtpadu += 1
    }
}

// Deklaracija klase koja ima nadklasu
class Bicikl : Vozilo {
    
    var brojBrzina: Int
    var imaKorpu: Bool
    
    init(brojBrzina: Int) {
        self.brojBrzina = brojBrzina
        self.imaKorpu = false
        super.init(brojTockova: 2)
    }
    
    init(brojBrzina: Int, imaKorpu: Bool) {
        self.brojBrzina = brojBrzina
        self.imaKorpu = imaKorpu
        super.init(brojTockova: 2)
    }
    
}

// Inicijalizacije klase i njene podklase
var vozilo = Vozilo(brojTockova: 4)
var bicikl = Bicikl(brojBrzina: 6)

// Provera da li je bicikl vozilo
var biciklJeVozilo = bicikl is Vozilo       // true

// Posmatranje bicikla kao vozila
var biciklKaoVozilo : Vozilo = bicikl as Vozilo

// Deklarisanje promenljive opcionog tipa
var opcioniString : String?

// Dodela vrednosti opcionoj promenljivoj
opcioniString = "Neki string"

// Unwrap-ovanje vrednosti opcione promenljive
var vrednostOpcionogStringa : String = opcioniString!

// Dodela prazne vrednosti opcionoj promenljivoj
opcioniString = nil

// Koriscenje opcionog vezivanja
if let unwrapovanaVrednost = opcioniString {
    print("Opciona promenljiva ima vrednost: \(unwrapovanaVrednost)")
} else {
    print("Opciona promenljiva je nil")
}


// Funkcija sa visestrukom povratnom vrednosti
func minimumIMaksimum(niz: [Int]) -> (min: Int, max: Int) {
    var minimum = niz[0]
    var maximum = niz[0]
    
    for i in niz {
        if (i < minimum) {
            minimum = i
        }
        if (i > maximum) {
            maximum = i
        }
    }
    
    return (minimum, maximum)
    
}

var nizBrojeva = [3, 5, 9, 2, 7, 6, 11, 5]
var (minimum, maximum) = minimumIMaksimum(nizBrojeva)