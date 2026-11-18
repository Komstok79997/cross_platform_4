import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Довільна зміна: Змінено внутрішній заголовок додатку (MaterialApp title) на інформативніший.
      title: 'Lab 4 - Desktop Flutter App',
      theme: ThemeData(
        // Обов'язкова вимога варіанта 10: Colors.brown
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      // Обов'язкова вимога: шаблон заголовка. Замініть <Group> та <Name> на свої дані.
      home: const MyHomePage(title: '<Group>: <Name>\'s first Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Обов'язкова вимога варіанта 10: крок лічильника 3
      _counter += 3;
    });
  }

  // 2. Довільна зміна: Додано новий метод для скидання лічильника до нуля.
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3. Довільна зміна: Змінено базовий колір фону Scaffold на дуже світлий відтінок коричневого для кращої читабельності.
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        // 4. Довільна зміна: Відцентровано заголовок AppBar.
        centerTitle: true,
        // 5. Довільна зміна: Додано кнопку скидання (IconButton) у верхню панель (AppBar) для виклику _resetCounter.
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetCounter,
            tooltip: 'Reset Counter',
          ),
        ],
      ),
      body: Center(
        // 6. Довільна зміна: Обернуто головний Column у віджет Padding для створення естетичних відступів на екрані.
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // 7. Довільна зміна: Змінено mainAxisAlignment на spaceEvenly, щоб елементи розподілялись рівномірно, а не збивалися в центрі.
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // 8. Довільна зміна: Додано новий текстовий віджет, який вітає користувача.
              const Text(
                'Вітаємо у десктопному застосунку на Flutter!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              // 9. Довільна зміна: Модифіковано стиль тексту лічильника – застосовано displayLarge з напівжирним накресленням та темнішим відтінком кольору.
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
      // 10. Довільна зміна: Замінено стандартний FloatingActionButton на FloatingActionButton.extended для додавання текстового підпису поруч з іконкою.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment by 3',
        // Обов'язкова вимога варіанта 10: іконка Icons.mouse
        icon: const Icon(Icons.mouse),
        label: const Text('Add 3'),
      ),
    );
  }
}