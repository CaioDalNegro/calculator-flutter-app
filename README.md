# Calculadora Flutter

Meu primeiro projeto em Flutter: uma calculadora simples, feita passo a passo para aprender os conceitos básicos do Flutter e do Dart.

## Funcionalidades planejadas

- [x] Visor com o número
- [ ] Números de 0 a 9
- [ ] Operações `+`, `-`, `×` e `÷`
- [ ] Botão `C` (limpar)
- [ ] Botão `=`
- [ ] Tratamento de divisão por zero

## Estrutura do projeto

| Pasta/Arquivo | Para que serve |
|---|---|
| `lib/main.dart` | Ponto de partida do app (função `main`) |
| `lib/` | Todo o código Dart do app |
| `test/` | Testes automatizados |
| `pubspec.yaml` | Nome, versão e pacotes usados pelo projeto |
| `android/`, `ios/` | Configurações de cada plataforma (quase nunca é preciso mexer) |
| `build/` | Arquivos gerados na compilação (não mexer) |

## Como rodar o app

### Pelo VS Code (recomendado)

Requer as extensões **Dart** e **Flutter** instaladas.

1. **Escolher o dispositivo:** clique no nome do dispositivo na barra azul, no canto inferior direito do VS Code, e escolha o emulador Android (ex.: `sdk gphone64 x86 64`).
   - Se ele não aparecer, escolha um emulador da lista (ex.: "Start Pixel...") e espere o celular virtual ligar.
2. **Rodar:** abra `lib/main.dart` e aperte **F5** (ou menu **Run → Start Debugging**).
   - Se perguntar qual debugger usar, escolha **Dart & Flutter**.
   - A primeira vez demora de 1 a 3 minutos (compilação do app Android). É normal.
3. **Ver mudanças em tempo real:** com o app aberto, altere o código e salve com **Ctrl+S**. O app atualiza sozinho em menos de 1 segundo (**Hot Reload**).

Com o app rodando, aparece uma barra de controle no topo do VS Code:

```
 ⏸   ⚡   🔄   ⏹
     │    │    └── Parar o app
     │    └── Hot Restart (reinicia o app do zero)
     └── Hot Reload (o mesmo que salvar)
```

### Pelo terminal

```
flutter devices                  # lista os dispositivos disponíveis
flutter run -d emulator-5554     # roda o app no emulador Android
```

Com o app rodando, use estas teclas **no terminal**:

| Tecla | Ação |
|---|---|
| `r` | Hot Reload |
| `R` | Hot Restart |
| `q` | Fecha o app |

> No terminal, o Hot Reload **não** acontece automaticamente ao salvar: é preciso apertar `r`.

## Hot Reload x Hot Restart

| | Hot Reload ⚡ | Hot Restart 🔄 |
|---|---|---|
| Como usar | Salvar (Ctrl+S) | Botão 🔄 ou **Ctrl+Shift+F5** |
| Velocidade | Menos de 1 segundo | Alguns segundos |
| O que faz | Atualiza a tela **mantendo** os dados | Reinicia o app **do zero** |
| Quando usar | Quase sempre | Quando o Hot Reload não mostrar a mudança (ex.: mudanças na função `main()`) |

## Verificar erros e rodar os testes

```
flutter analyze   # procura erros no código sem abrir o app
flutter test      # roda os testes da pasta test/
```

## Problemas comuns

| Problema | Solução |
|---|---|
| "No devices found" | O emulador está fechado. Clique no rodapé do VS Code e escolha um emulador para ligar. |
| Demora muito para abrir | Na primeira vez é normal. As próximas são bem mais rápidas. |
| Tela vermelha no app | Erro no código. Leia a mensagem no app ou no **Debug Console** do VS Code. |
| Mudança não aparece ao salvar | Use o **Hot Restart** (Ctrl+Shift+F5). |

## Links úteis

- [Documentação oficial do Flutter](https://docs.flutter.dev/)
- [Catálogo de widgets](https://docs.flutter.dev/ui/widgets)
- [Linguagem Dart](https://dart.dev/language)
