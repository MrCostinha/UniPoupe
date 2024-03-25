// Arquivo de referência inicial para elaboração do projeto.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniPoupe',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // TENTE ISSO: Tente executar sua aplicação com "flutter run". Você verá
        // que a aplicação possui uma barra de ferramentas roxa. Em seguida, sem
        // fechar o aplicativo, tente alterar a seedColor no colorScheme abaixo
        // para Colors.green e depois invoque "hot reload" (salve suas
        // alterações ou pressione o botão "hot reload" em um IDE compatível com
        // Flutter, ou pressione "r" se você usou a linha de comando para
        // iniciar o aplicativo).
        //
        // Observe que o contador não foi redefinido para zero; o estado da
        // aplicação não é perdido durante a recarga. Para redefinir o estado,
        // use o hot restart em vez disso.
        //
        // Isso também funciona para código, não apenas para valores: a maioria
        // das alterações de código pode ser testada apenas com um hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget é a página inicial da sua aplicação. É um widget stateful, o
  // que significa que ele possui um objeto State (definido abaixo) que contém
  // campos que afetam sua aparência.

  // Essa classe é a configuração para o estado. Ela armazena os valores (neste
  // caso, o título) fornecidos pelo pai (neste caso, o widget App) e usados
  // pelo método build do State.
  // Campos em uma subclasse de Widget são sempre marcados como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que o setState é chamado, por
    // exemplo, como feito pelo método _incrementCounter acima.
    //
    // O framework Flutter foi otimizado para tornar a execução dos métodos
    // build rápida, para que você possa simplesmente reconstruir qualquer coisa
    // que precise ser atualizada em vez de ter que alterar individualmente as
    // instâncias dos widgets.
    return Scaffold(
      appBar: AppBar(
        // TENTE ISSO: Tente alterar a cor aqui para uma cor específica (como
        // Colors.amber, talvez?) e execute um hot reload para ver a AppBar
        // mudar de cor enquanto as outras cores permanecem as mesmas.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aqui pegamos o valor do objeto MyHomePage que foi criado pelo método
        // App.build e usamos para definir o título da nossa appbar.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele recebe um único filho e o posiciona
        // no centro do pai.
        child: Column(
          // Column é também um widget de layout. Ele recebe uma lista de
          // filhos e os organiza verticalmente. Por padrão, ele se dimensiona
          // para caber seus filhos horizontalmente e tenta ser tão alto
          // quanto seu pai.
          //
          // Column possui várias propriedades para controlar como ele se
          // dimensiona e como posiciona seus filhos. Aqui usamos
          // mainAxisAlignment para centralizar os filhos verticalmente; o
          // eixo principal aqui é o eixo vertical porque as colunas são
          // verticais (o eixo cruzado seria horizontal).
          //
          // TENTE ISSO: Ative o "debug painting" (escolha a ação "Toggle
          // Debug Paint" na IDE ou pressione "p" no console) para ver a
          // estrutura de arame de cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // Esta vírgula final melhora a formatação automática para os métodos de construção.
    );
  }
}
