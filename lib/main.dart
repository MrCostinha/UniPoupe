import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'color_schemes.g.dart';
import 'custom_color.g.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          // Usa os esquemas de cores dinâmicos se eles estiverem disponíveis.
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Caso contrário, usa os esquemas de cores estáticos.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MaterialApp(
          theme: ThemeData(
            // Tema claro
            useMaterial3: true,
            colorScheme: lightScheme,
            extensions: [lightCustomColors],
          ),
          darkTheme: ThemeData(
            // Tema escuro
            useMaterial3: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
          ),
          home: const Home(title: 'Despesas'),
        );
      },
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          // Ícone do menu
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            semanticLabel: 'Menu',
          ),
          onPressed: () {
            print('Menu Button');
          },
        ),
        title: Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: DropdownButton<String>(
                hint: Text(
                  dropdownValue,
                  style: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(38.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: <Widget>[
                Spacer(flex: 5), // Espaço à esquerda
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  color: Colors.black,
                  onPressed: () {
                    print('Mês anterior');
                    // Lógica para voltar ao mês anterior
                  },
                ),
                Spacer(flex: 1),
                Text(
                  'MM/AAAA',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                Spacer(flex: 1),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  color: Colors.black,
                  onPressed: () {
                    print('Mês seguinte');
                    // Lógica para avançar para o próximo mês
                  },
                ),
                Spacer(flex: 5), // Espaço à direita
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lista de despesas aqui',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          print('Adicionar despesa');
          // Lógica para adicionar despesa
        },
        child: const Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
