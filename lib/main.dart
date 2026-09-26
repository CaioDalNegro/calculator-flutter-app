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

        body: Column(
          children: [
            // Visor da calculadora -------------->
            Container(
              height: 200,
              color: Colors.black,
              padding: EdgeInsets.all(24),
              alignment: Alignment.bottomRight,

              child: Text(
                '0',
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),

            // Primeira linha de botões -------------------->
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('1');
                  },
                  child: Text('1'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('2');
                  },
                  child: Text('2'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('3');
                  },
                  child: Text('3'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('÷');
                  },
                  child: Text('÷'),
                ),
              ],
            ),

            // Segunda linha de botões -------------------->
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('4');
                  },
                  child: Text('4'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('5');
                  },
                  child: Text('5'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('6');
                  },
                  child: Text('6'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('×');
                  },
                  child: Text('×'),
                ),
              ],
            ),

            // Terceira linha de botões -------------------->
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('7');
                  },
                  child: Text('7'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('8');
                  },
                  child: Text('8'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('9');
                  },
                  child: Text('9'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('-');
                  },
                  child: Text('-'),
                ),
              ],
            ),

            // Última linha: limpar, zero, igual e soma
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('C');
                  },
                  child: Text('C'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('0');
                  },
                  child: Text('0'),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('=');
                  },
                  child: Text('='),
                ),

                ElevatedButton(
                  onPressed: () {
                    print('+');
                  },
                  child: Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
