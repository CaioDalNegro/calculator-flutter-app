import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('Tela inicial mostra o título e o visor com 0',
      (WidgetTester tester) async {
    // Monta o app em uma tela "invisível" de teste
    await tester.pumpWidget(const CalculadoraApp());

    // Confere se os textos esperados estão na tela
    expect(find.text('Calculadora'), findsOneWidget);
    // Dois "0": um no visor e outro no botão
    expect(find.text('0'), findsNWidgets(2));
  });
}
