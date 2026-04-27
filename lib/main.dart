import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Aplicação',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nomeExibido = 'Bem-vindo ao mundo Flutter!';
  String subtitulo = 'Seja muito bem-vindo!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Aplicação de Boas-Vindas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print('Ícone do AppBar pressionado!');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nomeExibido,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              subtitulo,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              print('Botão pressionado!');
              setState(() {
                nomeExibido = 'Bem-vindo ao mundo Flutter!';
                subtitulo = 'Seja muito bem-vindo!';
              });
            },
            child: Icon(Icons.check),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              print('Thomas Gabriel');
              setState(() {
                nomeExibido = 'Thomas Gabriel';
                subtitulo = 'Bem-vindo ao mundo Flutter!';
              });
            },
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}