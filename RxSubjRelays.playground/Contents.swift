import RxSwift
import RxCocoa
import Foundation


/*:
# Subjects


## PublishSubject
 Emite apenas novos eventos para os assinantes.
 Não retém nenhum valor anterior.
 Começa vazio e só emite novos elementos para o seu observer quando recebe um novo conteúdo.
 Use quando você precisa emitir novos eventos para os assinantes e não precisa reter nenhum valor anterior
 **Output: Pix**
 */

let subject = PublishSubject<String>()
subject.onNext("Dinheiro")
subject.subscribe(onNext: { print($0) })
subject.onNext("Pix")
/*:

## BehaviorSubject
 Emite o valor mais recente (ou um valor inicial) e todos os novos eventos para os assinantes.
 Retém o último valor emitido.
 Use quando você precisa emitir o valor mais recente (ou um valor inicial) e todos os novos eventos para os assinantes.
 **Output: Dinheiro, Pix**
 */
let subject = BehaviorSubject(value: "Dinheiro")
subject.subscribe(onNext: { print($0) })
subject.onNext("Pix")

/*:

## ReplaySubject
 Emite todos os eventos anteriores e novos eventos para os assinantes.
 Retém um buffer de eventos anteriores.
 Use quando você precisa emitir todos os eventos anteriores e novos eventos para os assinantes.
 BufferSize: armazena um número especificado de eventos em um buffer ou seja vc pode especificar o tamanho do buffer, cuidado ao usar pois se o tamanho do buffer for menor do que o total de eventos emitidos, os eventos mais antigos serão descartados.
 Reemissao dos eventos: Quando um novo assinante se inscreve, ele recebe todos os eventos armazenados no buffer.
 **Output: Dinheiro, Pix, Cartao**
 */
let subject = ReplaySubject<String>.create(bufferSize: 2)
subject.onNext("Dinheiro")
subject.onNext("Pix")
subject.subscribe(onNext: { print($0) })
subject.onNext("Cartao")
/*:

## AsyncSubject
 Emite apenas o último valor e completa quando o Observable é completado.
 **Output: Pix**
 */
let subject = AsyncSubject<String>()
subject.onNext("Dinheiro")
subject.onNext("Pix")
subject.onCompleted()
subject.subscribe(onNext: { print($0) })
/*:

## PublishRelay
 Emite apenas novos eventos para os assinantes.
 Não retém nenhum valor anterior.
 Começa vazio e só emite novos elementos para o seu observer quando recebe um novo conteúdo.
 Use quando você precisa emitir novos eventos para os assinantes e não precisa reter nenhum valor anterior
 Não pode emitir eventos de erro.
 Use quando você precisa de um PublishSubject que não pode emitir eventos de erro.
 **Output: Pix**
 */
let createOurRelay = PublishRelay<String>()
relay.accept("Dinheiro")
relay.subscribe(onNext: { print($0) })
relay.accept("Pix")

/*:

## BehaviorRelay
 Começa com um elemento inicial e replica esse ou o último valor recebido para os inscritos.
 Não pode emitir eventos de erro.
 Emite o valor mais recente (ou um valor inicial) e todos os novos eventos para os assinantes.
 Retém o último valor emitido.
 Use quando você precisa de um BehaviorSubject que não pode emitir eventos de erro.
 **Output: Dinheiro, Pix**
 */
let relay = BehaviorRelay(value: "Dinheiro")
relay.subscribe(onNext: { print($0) })
relay.accept("Pix")
