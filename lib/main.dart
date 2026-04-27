import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora SENAI',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.orange,
        ),
      ),
      home: const CalculadoraSENAI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculadoraSENAI extends StatefulWidget {
  const CalculadoraSENAI({super.key});

  @override
  State<CalculadoraSENAI> createState() => _CalculadoraSENAIState();
}

class _CalculadoraSENAIState extends State<CalculadoraSENAI> {
  String _display = '0';
  double _primeiroNumero = 0;
  String _operacao = '';
  bool _novaOperacao = true;

  void _adicionarNumero(String numero) {
    setState(() {
      if (_novaOperacao) {
        _display = numero;
        _novaOperacao = false;
      } else {
        _display = _display == '0' ? numero : _display + numero;
      }
    });
  }

  void _adicionarPonto() {
    setState(() {
      if (_novaOperacao) {
        _display = '0.';
        _novaOperacao = false;
      } else if (!_display.contains('.')) {
        _display = _display + '.';
      }
    });
  }

  void _escolherOperacao(String operacao) {
    setState(() {
      _primeiroNumero = double.parse(_display);
      _operacao = operacao;
      _novaOperacao = true;
    });
  }

  void _calcular() {
    setState(() {
      double segundoNumero = double.parse(_display);
      double resultado = 0;

      switch (_operacao) {
        case '+':
          resultado = _primeiroNumero + segundoNumero;
          break;
        case '-':
          resultado = _primeiroNumero - segundoNumero;
          break;
        case '×':
          resultado = _primeiroNumero * segundoNumero;
          break;
        case '÷':
          if (segundoNumero != 0) {
            resultado = _primeiroNumero / segundoNumero;
          } else {
            _display = 'Erro';
            _novaOperacao = true;
            return;
          }
          break;
      }

      _display = resultado.toString();
      if (_display.contains('.0')) {
        _display = _display.substring(0, _display.length - 2);
      }
      _novaOperacao = true;
      _operacao = '';
    });
  }

  void _limpar() {
    setState(() {
      _display = '0';
      _primeiroNumero = 0;
      _operacao = '';
      _novaOperacao = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora SENAI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display da calculadora
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange, width: 2),
            ),
            child: Text(
              _display,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          
          // Botões da calculadora
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Linha 1: 7, 8, 9, ÷
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botaoNumero('7'),
                      _botaoNumero('8'),
                      _botaoNumero('9'),
                      _botaoOperacao('÷', Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Linha 2: 4, 5, 6, ×
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botaoNumero('4'),
                      _botaoNumero('5'),
                      _botaoNumero('6'),
                      _botaoOperacao('×', Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Linha 3: 1, 2, 3, -
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botaoNumero('1'),
                      _botaoNumero('2'),
                      _botaoNumero('3'),
                      _botaoOperacao('-', Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Linha 4: 0, ., =, +
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botaoNumero('0'),
                      _botaoPonto(),
                      _botaoIgual(),
                      _botaoOperacao('+', Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Linha 5: Botão Limpar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _limpar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[900],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          child: const Text('C'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoNumero(String numero) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          onPressed: () => _adicionarNumero(numero),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: Text(numero),
        ),
      ),
    );
  }

  Widget _botaoOperacao(String operacao, Color cor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          onPressed: () => _escolherOperacao(operacao),
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: Text(operacao),
        ),
      ),
    );
  }

  Widget _botaoPonto() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          onPressed: _adicionarPonto,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text('.'),
        ),
      ),
    );
  }

  Widget _botaoIgual() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          onPressed: _calcular,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text('='),
        ),
      ),
    );
  }
}