import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Simples',
      home: const MinhaTela(),
    );
  }
}
class MinhaTela extends StatefulWidget {
  const MinhaTela({super.key});

  @override
  State<MinhaTela> createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  int _quantidadePessoas = 0;

  void _adicionarPessoa() {
    setState(() {
      _quantidadePessoas++;
    });
  }

  void _removerPessoa() {
    setState(() {
      if (_quantidadePessoas > 0) {
        _quantidadePessoas--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Simples'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quantidade de Pessoas:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              '$_quantidadePessoas',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _adicionarPessoa,
                  child: const Icon(Icons.person_add),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _removerPessoa,
                  child: const Icon(Icons.person_remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}