import 'package:flutter/material.dart';

// Ponto de partida do app
void main() {
  runApp(const CalculadoraApp());
}

// Widget raiz: configura o aplicativo
class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove a faixa "DEBUG" do canto
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora', style: TextStyle(fontSize: 30)),
        ),
        
        // Visor da calculadora
        body: Container(
          height: 200,
          color: Colors.black,
          padding: EdgeInsets.all(24),
          alignment: Alignment.bottomRight, // número à direita, como nas calculadoras
          child: Text(
            '0',
            style: TextStyle(fontSize: 48, color: Colors.white),
          ),
        ),
      ),
    );
  }
}