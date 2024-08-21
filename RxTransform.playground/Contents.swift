import RxSwift
import RxCocoa


/*:
# Operadores de transformação


## Map
Combina múltiplos Observables emitindo todos os itens de todos os Observables conforme eles são emitidos.
 Quando usar: Use map quando você precisa transformar cada item emitido por uma sequência observável aplicando uma função a cada item individualmente.
 **Output: 2, 4, 6**
 */

let observable = Observable.of(1, 2, 3)

observable.map { $0 * 2 } // Multiplica por 2
    .subscribe(onNext: { value in
        print(value)
    })
/*:

## FlatMap
 Transforma os itens emitidos por uma sequência observável aplicando uma função a cada item.
 Quando usar: Use flatMap quando você precisa transformar cada item emitido por uma sequência observável em outras sequências observáveis e mesclar as emissões dessas sequências em uma única sequência observável. É útil para operações assíncronas, como chamadas de rede.
 **Output: 2, 4, 6**
 */
let observable = Observable.of(1, 2, 3)

observable.flatMap { number in
    return Observable.just(number * 2)
}
.subscribe(onNext: { value in
    print(value)
})
/*:


## FlatMapLatest
 Transforma os itens emitidos por uma sequência observável em outras sequências observáveis e mescla as emissões dessas sequências em uma única sequência observável.
 Quando usar: Use flatMapLatest quando você precisa transformar cada item emitido por uma sequência observável em outras sequências observáveis, mas deseja emitir itens apenas da sequência observável mais recente. É útil para cenários onde apenas o resultado mais recente é relevante, como buscas em tempo real.
 **Output: 2, 4, 6**
 */
let observable = Observable.of(1, 2, 3)

observable.flatMapLatest { number in
    return Observable.just(number * 2)
}
.subscribe(onNext: { value in
    print(value)
})
/*:


## Scan
 Aplica uma função acumuladora a uma sequência observável e emite cada valor intermediário.
 Quando usar: Use scan quando você precisa aplicar uma função acumuladora a uma sequência observável e emitir cada valor intermediário. É útil para calcular somas parciais ou estados acumulados.
 **Output: 1, 3, 6**
 */
let observable = Observable.of(1, 2, 3)

observable.scan(0) { accumulator, value in
    return accumulator + value
}
.subscribe(onNext: { value in
    print(value)
})
/*:


## Buffer
 Agrupa os itens emitidos por uma sequência observável em buffers e emite esses buffers como itens.
 Quando usar: Use buffer quando você precisa agrupar os itens emitidos por uma sequência observável em buffers e emitir esses buffers como itens. É útil para processar itens em lotes.
 **Output:
 [1, 2]
 [3, 4]
 [5]**
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.buffer(timeSpan: .seconds(1), count: 2, scheduler: MainScheduler.instance)
    .subscribe(onNext: { value in
        print(value)
    })

/*:


## Window
 Agrupa os itens emitidos por uma sequência observável em janelas observáveis e emite essas janelas como itens.
 Quando usar: Use window quando você precisa agrupar os itens emitidos por uma sequência observável em janelas observáveis e emitir essas janelas como itens. É útil para processar itens em janelas de tempo ou contagem.
 **Output:
 [1, 2]
 [3, 4]
 [5]**
 */
let observable = Observable.of(1, 2, 3, 4, 5)

observable.window(timeSpan: .seconds(1), count: 2, scheduler: MainScheduler.instance)
    .flatMap { $0.toArray() }
    .subscribe(onNext: { value in
        print(value)
    })
/*:


## Reduce
 Aplica uma função acumuladora a uma sequência observável e emite o valor final.
 Quando usar: Use reduce quando você precisa aplicar uma função acumuladora a uma sequência observável e emitir apenas o valor final. É útil para calcular um valor agregado, como a soma total.
 **Output: 6**
 */
let observable = Observable.of(1, 2, 3)

observable.reduce(0) { accumulator, value in
    return accumulator + value
}
.subscribe(onNext: { value in
    print(value)
})
/*:


## ConcatMap
 Transforma os itens emitidos por uma sequência observável em outras sequências observáveis e concatena as emissões dessas sequências em uma única sequência observável.
 Quando usar: Use concatMap quando você precisa transformar cada item emitido por uma sequência observável em outras sequências observáveis e concatenar as emissões dessas sequências em uma única sequência observável. É útil quando a ordem das emissões importa.
 **Output:
 2
 4
 6**
 */
let observable = Observable.of(1, 2, 3)

observable.concatMap { number in
    return Observable.just(number * 2)
}
.subscribe(onNext: { value in
    print(value)
})
