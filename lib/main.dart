import 'package:flutter/material.dart';

//INÍCIO DO APLICATIVO ============================================================
void main() {
  runApp(const CalculadoraApp());
}

/* 
 WIDGET PRINCIPAL DO APLICATIVO

 - O CalculadoraApp é StatelessWidget porque ele não precisa
 controlar nenhuma informação que muda.

 A informação que muda (o visor) ficará na TelaCalculadora.
*/
class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove a faixa "DEBUG" do canto da tela.
      debugShowCheckedModeBanner: false,

      // Define a primeira tela do aplicativo.
      home: const TelaCalculadora(),
    );
  }
}

/* 
  TELA DA CALCULADORA
  - A tela é Stateful porque o valor do visor pode mudar.

 Exemplo:
 visor = '0'
 usuário aperta 5
 visor = '5'
*/

class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});

  @override
  State<TelaCalculadora> createState() => _TelaCalculadoraState();
}

/* 
  ESTADO DA CALCULADORA ============================================================
*/
class _TelaCalculadoraState extends State<TelaCalculadora> {
  String visor = '0'; // Guarda o texto que aparece no visor.
  double? primeiroNumero; // Guarda o primeiro número da conta.
  String? operacao; // Guarda qual operação o usuário escolheu.

  void digitarNumero(String numero) {
    setState(() {
      // Se o visor estiver mostrando apenas 0,
      // substituímos o 0 pelo número digitado.
      if (visor == '0') {
        visor = numero;
      }
      // Caso contrário, adicionamos o número
      // ao final do que já está no visor.
      else {
        visor = visor + numero;
      }
    });
  }

  void escolherOperacao(String simbolo) {
    primeiroNumero = double.parse(visor);
    operacao = simbolo;

    setState(() {
      visor = '0';
    });
  }

  /* 
   Botão de número
   
   - Método para evitar repetir o mesmo código
   várias vezes nos botões.
  */
  Widget botaoNumero(String numero) {
    return ElevatedButton(
      onPressed: () {
        digitarNumero(numero);
      },
      child: Text(numero),
    );
  }

  // ----------------------------------------------------------
  // Botão de operação
  // ----------------------------------------------------------
  Widget botaoOperacao(String simbolo) {
    return ElevatedButton(
      onPressed: () {
        escolherOperacao(simbolo);
      },
      child: Text(simbolo),
    );
  }

  // ----------------------------------------------------------
  // Botão de limpar
  // ----------------------------------------------------------
  Widget limpar() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          visor = '0';
        });
      },
      child: const Text('C'),
    );
  }

  // ==========================================================
  // CONSTRUÇÃO DA TELA
  // ==========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --------------------------------------------------------
      // Barra superior
      // --------------------------------------------------------
      appBar: AppBar(
        title: const Text('Calculadora', style: TextStyle(fontSize: 30)),
      ),

      // --------------------------------------------------------
      // Corpo da calculadora
      // --------------------------------------------------------
      body: Column(
        children: [
          // VISOR ==============================================
          Container(
            height: 200,
            color: Colors.black,

            // Espaçamento interno do visor.
            padding: const EdgeInsets.all(24),

            // Coloca o número no canto inferior direito.
            alignment: Alignment.bottomRight,

            child: Text(
              visor,
              style: const TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),

          // PRIMEIRA LINHA =======================================
          Row(
            children: [
              botaoNumero('1'),
              botaoNumero('2'),
              botaoNumero('3'),

              botaoOperacao('÷'),
            ],
          ),

          // SEGUNDA LINHA
          Row(
            children: [
              botaoNumero('4'),
              botaoNumero('5'),
              botaoNumero('6'),

              botaoOperacao('×'),
            ],
          ),

          // TERCEIRA LINHA =======================================
          Row(
            children: [
              botaoNumero('7'),
              botaoNumero('8'),
              botaoNumero('9'),

              botaoOperacao('-'),
            ],
          ),

          // ÚLTIMA LINHA =======================================
          Row(
            children: [
              limpar(),

              botaoNumero('0'),

              // Por enquanto o = apenas imprime no console.
              ElevatedButton(
                onPressed: () {
                  print('=');
                },
                child: const Text('='),
              ),

              botaoOperacao('+'),
            ],
          ),
        ],
      ),
    );
  }
}
