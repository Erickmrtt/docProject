import UIKit

/*:
# Grand Central Dispatch (GCD)

O GCD deixa que que execute tarefas de forma assíncrona em segundo plano, permitindo que você execute tarefas em paralelo.

Ele tem basicamente tem tres conceitos principais:
 **Filas (Queues): ** Serial Queues: Executam uma tarefa de cada vez, na ordem em que foram adicionadas.
 Concurrent Queues: Executam múltiplas tarefas simultaneamente, mas não garantem a ordem de execução.
 **Main Queue: ** Fila serial que executa tarefas na thread principal.. Normalmente usada para update da interface do usuario
 **Global Queues: ** Filas concorente que são compartilhadas pelo sistema. Tem prioridades que vão de background até user interactive. (alta, padrao, baixa e background)
 */
let serialQueue = DispatchQueue(label: "serialQueue")
serialQueue.async {

}

/*:

 ## Delays
Para executar um código após um certo tempo. O código abaixo será executado após 2 segundos.
 */
DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    // Código a ser executado após 2 segundos
}
/*:

## Sync
 Para garantir que uma tarefa seja executada antes de outra, você pode usar sync. Deve ter cuidado ao usar essa, pq pode causar deadlocks.
*/
serialQueue.sync {
    // Código a ser executado de forma síncrona
}
/*:

## Fila Serial Personalizada
 Quando você tem uma série de tarefas que precisam ser executadas em uma ordem específica.
 Quando múltiplas tarefas precisam acessar um recurso compartilhado e você quer evitar condições de corrida.
*/
let serialPersonalizada = DispatchQueue(label: "com.example.serialQueue")

serialQueue.async {
    // Tarefa 1
}
serialQueue.async {
    // Tarefa 2 (executada após a Tarefa 1)
}
/*:

## Fila Concorrente Personalizada
 Quando você tem várias tarefas que podem ser executadas simultaneamente sem depender umas das outras que ajuda melhorar a performance.
*/
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
concurrentQueue.async {
    // Tarefa 1
}
concurrentQueue.async {
    // Tarefa 2 (pode ser executada simultaneamente com a Tarefa 1)
}

/*:

## Main Queue
 Qualquer operação que precise atualizar a interface do usuário deve ser executada na main queue, pois a UI só pode ser atualizada na thread principal.
 Tarefas que envolvem interações diretas com o usuário, como responder a toques ou gestos.
*/
DispatchQueue.main.async {
   // self.view.backgroundColor = .red
}

/*:

## Global Queues
 Para executar tarefas em segundo plano, como operações de rede, processamento de dados, etc.
 Quando você quer especificar a prioridade da tarefa (alta, padrão, baixa, background).
*/
DispatchQueue.global(qos: .background).async {
    let url = URL(string: "https://dummyjson.com")!
    let data = try? Data(contentsOf: url)
    DispatchQueue.main.async {
        if let data = data {
            print("Data: \(data)")
        }
    }
}
