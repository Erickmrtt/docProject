import RxSwift
import RxCocoa

/*:
# Operadores de combinação


## Merge
Combina múltiplos Observables emitindo todos os itens de todos os Observables conforme eles são emitidos.
 **Output: 1, 2, 3, 4, 5, 6**
 */

 let observable1 = Observable.of(1, 2, 3)
 let observable2 = Observable.of(4, 5, 6)

 Observable.merge(observable1, observable2)
     .subscribe(onNext: { print($0) })

/*:
## zip
Combina múltiplos Observables emitindo pares de itens combinados de cada Observable.
 **Output: 1A, 2B, 3C**
 */
 let observable1 = Observable.of(1, 2, 3)
 let observable2 = Observable.of("A", "B", "C")

 Observable.zip(observable1, observable2) { (num, letter) in
     return "\(num)\(letter)"
 }
 .subscribe(onNext: { print($0) })


/*:
 ## combineLatest
Combina múltiplos Observables emitindo o item mais recente de cada Observable sempre que qualquer um dos Observables emite um item.

 **Output: 1A, 2A, 2B**

 */
let observable1 = BehaviorSubject(value: 1)
let observable2 = BehaviorSubject(value: "A")

Observable.combineLatest(observable1, observable2) { (num, letter) in
    return "\(num)\(letter)"
}
.subscribe(onNext: { print($0) })

observable1.onNext(2)
observable2.onNext("B")
/*:
## withLatestFrom
Combina dois Observables emitindo o item mais recente do segundo Observable sempre que o primeiro Observable emite um item.
 **Output: Updated**
 */

let buttonTap = PublishSubject<Void>()
let textFieldInput = BehaviorSubject(value: "Initial")

buttonTap
    .withLatestFrom(textFieldInput)
    .subscribe(onNext: { print($0) })

textFieldInput.onNext("Updated")
buttonTap.onNext(())
/*:
## startWith
Emite um item inicial antes de começar a emitir os itens do Observable.

 **Output : 1, 2, 3, 4**
 */
let observable = Observable.of(2, 3, 4)
observable
    .startWith(1)
    .subscribe(onNext: { print($0) })
/*:
## switchLatest
Converte um Observable que emite Observables em um Observable que emite os itens emitidos pelo Observable mais recente.

 **Output : Subject1 - 1, Subject2 - 1, Subject2 - 2**
*/
let subject1 = PublishSubject<String>()
let subject2 = PublishSubject<String>()
let observable = BehaviorSubject(value: subject1)

observable
    .switchLatest()
    .subscribe(onNext: { print($0) })

subject1.onNext("Subject1 - 1")
observable.onNext(subject2)
subject2.onNext("Subject2 - 1")
subject1.onNext("Subject1 - 2")
subject2.onNext("Subject2 - 2")
