import 'package:flutter/material.dart';
import 'package:unipoupe/src/splash/splash_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Tema claro
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF690BA3)),
      ),
      darkTheme: ThemeData(
        // Tema escuro
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF690BA3), brightness: Brightness.dark),
      ),
      home: const SplashPage(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'Evento Tal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF690BA3),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                DropdownButton<String>(
                  hint: Text(
                    dropdownValue,
                    style: const TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(Icons.expand_more),
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.black,
                  iconSize: 24,
                  elevation: 10,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Evento Tal', 'Evento X', 'Evento Y']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        color: Colors.black,
                        onPressed: () {
                          // Lógica para voltar ao mês anterior
                        },
                      ),
                      const Text(
                        'MM/AAAA',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        color: Colors.black,
                        onPressed: () {
                          // Lógica para avançar para o próximo mês
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Ícone do menu
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(8.0),
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Color(0xFF690BA3),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Lista de despesas aqui',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          // Lógica para adicionar despesa
        },
        child: const Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
