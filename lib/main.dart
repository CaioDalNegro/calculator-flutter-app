import 'package:flutter/material.dart';

// ==========================================================
// CORES DO APLICATIVO
// ==========================================================
// Ficam em um só lugar: para mudar o visual, basta mudar aqui.
// Formato: 0xFF + código hexadecimal da cor (o FF é a opacidade: 100%).
const corFundo = Colors.black;
const corNumero = Color(0xFF333333); // cinza escuro
const corOperacao = Color(0xFFFF9500); // laranja
const corLimpar = Color(0xFFA5A5A5); // cinza claro

void main() {
  runApp(const CalculadoraApp());
}

/*
 WIDGET PRINCIPAL DO APLICATIVO

 - O CalculadoraApp é StatelessWidget porque ele não precisa
 controlar nenhuma informação que muda.

 A informação que muda (o visor) fica na TelaCalculadora.
*/
class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaCalculadora(),
    );
  }
}

/*
  TELA DA CALCULADORA
  - A tela é Stateful porque o valor do visor pode mudar.
*/
class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});

  @override
  State<TelaCalculadora> createState() => _TelaCalculadoraState();
}

class _TelaCalculadoraState extends State<TelaCalculadora> {
  String visor = '0'; // Guarda o texto que aparece no visor.
  double? primeiroNumero; // Guarda o primeiro número da conta.
  String? operacao; // Guarda qual operação o usuário escolheu.

  // ==========================================================
  // AÇÕES (o que acontece quando um botão é clicado)
  // ==========================================================

  void digitarNumero(String numero) {
    setState(() {
      // Se o visor estiver mostrando apenas 0,
      // substituímos o 0 pelo número digitado.
      if (visor == '0') {
        visor = numero;
      } else {
        // Caso contrário, adicionamos o número
        // ao final do que já está no visor.
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

  void calcular() {
    double segundoNumero = double.parse(visor);
    double resultado = 0;

    switch (operacao) {
      case '+':
        resultado = primeiroNumero! + segundoNumero;
        break;

      case '-':
        resultado = primeiroNumero! - segundoNumero;
        break;

      case '×':
        resultado = primeiroNumero! * segundoNumero;
        break;

      case '÷':
        resultado = primeiroNumero! / segundoNumero;
        break;
    }

    setState(() {
      visor = resultado.toString();
    });
  }

  void limpar() {
    setState(() {
      visor = '0';
    });
  }

  // ==========================================================
  // BOTÕES (como cada botão é desenhado)
  // ==========================================================

  /*
   Botão genérico: todos os botões da calculadora usam este método.
   Ele recebe o texto, a cor e a ação que deve acontecer no clique.

   - Expanded: faz o botão dividir o espaço da linha igualmente
     com os outros botões.
   - Padding: cria um espaço entre um botão e outro.
  */
  Widget botao(String texto, Color cor, void Function() aoClicar) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: aoClicar,
          style: ElevatedButton.styleFrom(
            backgroundColor: cor, // cor de fundo
            foregroundColor: Colors.white, // cor do texto
            minimumSize: const Size.fromHeight(80), // altura do botão
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24), // cantos arredondados
            ),
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: Text(texto),
        ),
      ),
    );
  }

  Widget botaoNumero(String numero) {
    return botao(numero, corNumero, () {
      digitarNumero(numero);
    });
  }

  Widget botaoOperacao(String simbolo) {
    return botao(simbolo, corOperacao, () {
      escolherOperacao(simbolo);
    });
  }

  // ==========================================================
  // CONSTRUÇÃO DA TELA
  // ==========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,

      appBar: AppBar(
        backgroundColor: corFundo,
        foregroundColor: Colors.white,
        title: const Text('Calculadora'),
      ),

      // SafeArea: evita que o conteúdo fique embaixo da barra
      // de navegação ou do "entalhe" (notch) do celular.
      body: SafeArea(
        child: Column(
          children: [
            // VISOR ==============================================
            // Expanded: o visor ocupa todo o espaço que sobrar
            // depois dos botões, em qualquer tamanho de tela.
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomRight,

                // FittedBox: diminui o texto quando o número é grande
                // demais para caber na largura da tela.
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    visor,
                    style: const TextStyle(
                      fontSize: 72,
                      color: Colors.white,
                      fontWeight: FontWeight.w300, // letra mais fina
                    ),
                  ),
                ),
              ),
            ),

            // BOTÕES =============================================
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      botaoNumero('1'),
                      botaoNumero('2'),
                      botaoNumero('3'),
                      botaoOperacao('÷'),
                    ],
                  ),
                  Row(
                    children: [
                      botaoNumero('4'),
                      botaoNumero('5'),
                      botaoNumero('6'),
                      botaoOperacao('×'),
                    ],
                  ),
                  Row(
                    children: [
                      botaoNumero('7'),
                      botaoNumero('8'),
                      botaoNumero('9'),
                      botaoOperacao('-'),
                    ],
                  ),
                  Row(
                    children: [
                      botao('C', corLimpar, limpar),
                      botaoNumero('0'),
                      botao('=', corOperacao, calcular),
                      botaoOperacao('+'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
