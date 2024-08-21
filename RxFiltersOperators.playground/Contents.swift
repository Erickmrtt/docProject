import RxSwift
import RxCocoa
/*:
# Operadores de filtragem


## Filter
 Quando usar: Use filter quando você precisa emitir apenas os itens de uma sequência observável que atendem a uma condição específica.
 Exemplo: Filtrar uma sequência de números para emitir apenas os números pares.
 */

let observable = Observable.of(1, 2, 3, 4, 5, 6)

observable.filter { $0 % 2 == 0 }
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## DistinctUntilChanged
 Quando usar: Use distinctUntilChanged quando você precisa emitir itens de uma sequência observável, ignorando itens subsequentes que são iguais ao item anterior. É útil para evitar a emissão de valores duplicados consecutivos.
 Exemplo: Emitir apenas itens distintos consecutivos de uma sequência de números.
 */
let observable = Observable.of(1, 2, 2, 3, 3, 3, 4, 4, 5)

observable.distinctUntilChanged()
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## Take
 Quando usar: Use take quando você precisa emitir apenas os primeiros n itens de uma sequência observável. É útil quando você está interessado apenas em um número limitado de itens iniciais.
 Exemplo: Emitir apenas os primeiros 3 itens de uma sequência de números.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.take(3)
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## TakeLast
 Quando usar: Use takeLast quando você precisa emitir apenas os últimos n itens de uma sequência observável. É útil quando você está interessado apenas nos itens finais de uma sequência.
 Exemplo: Emitir apenas os últimos 2 itens de uma sequência de números.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.takeLast(2)
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## Skip
 Quando usar: Use skip quando você precisa ignorar os primeiros n itens de uma sequência observável e emitir os itens subsequentes. É útil quando você quer pular um número específico de itens iniciais.
 Exemplo: Ignorar os primeiros 2 itens de uma sequência de números.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.skip(2)
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## SkipWhile
 Quando usar: Use skipWhile quando você precisa ignorar os itens de uma sequência observável enquanto uma condição especificada for verdadeira e emitir os itens subsequentes. É útil quando você quer pular itens até que uma condição específica seja falsa.

 Exemplo: Ignorar os itens enquanto forem menores que 3.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.skipWhile { $0 < 3 }
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## TakeWhile
 Quando usar: Use takeWhile quando você precisa emitir itens de uma sequência observável enquanto uma condição especificada for verdadeira e ignorar os itens subsequentes. É útil quando você quer emitir itens até que uma condição específica seja falsa.
 Exemplo: Emitir itens enquanto forem menores que 4.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.takeWhile { $0 < 4 }
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## ElementAt
 Quando usar: Use elementAt quando você precisa emitir apenas o item no índice especificado de uma sequência observável. É útil quando você está interessado em um item específico baseado em sua posição.
 Exemplo: Emitir apenas o item no índice 2 (terceiro item) de uma sequência de números.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.elementAt(2)
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## IgnoreElements
 Quando usar: Use ignoreElements quando você precisa ignorar todos os itens emitidos por uma sequência observável, emitindo apenas notificações de conclusão ou erro. É útil quando você está interessado apenas em saber quando a sequência foi concluída ou se ocorreu um erro.
 Exemplo: Ignorar todos os itens e apenas emitir uma notificação de conclusão.
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.ignoreElements()
    .subscribe(onCompleted: {
        print("Completed")
    })

