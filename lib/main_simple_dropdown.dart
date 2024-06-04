import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Flutter code sample for [DropdownMenu].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

//void main() => runApp(const DropdownMenuApp());

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DropdownText()),
      ],
      child: const DropdownMenuApp(),
    ),
  );
}

class DropdownText with ChangeNotifier {
  String _text = "One";

  String get text => _text;

  void setText(String value) {
    _text = value;
    notifyListeners();
  }
}

// class DropdownMenuApp extends StatelessWidget {
//   const DropdownMenuApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final data = context.watch<DropdownText>();
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownMenu Sample')),
//         body: const Center(
//           child: Column(
//             children: [
//               DropdownMenuExample(),
//               Text(context.read<DropdownText>().text)
//            //   CounterBody(TextNotifier: MyObjectText)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DropdownMenuApp extends StatefulWidget {
  const DropdownMenuApp({super.key});

  @override
  State<DropdownMenuApp> createState() => _DropdownMenuAppState();
}

class _DropdownMenuAppState extends State<DropdownMenuApp> {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<DropdownText>();
    print(data.text);
    String A = 'test';
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: const Center(
          child: Column(
            children: [
              //Text(context.watch<DropdownText>().text),
              DropdownMenuExample(),
              const SizedBox(height: 60),
              MyTextWidget()
            ],
          ),
        ),
      ),
    );
  }
}


class MyTextWidget extends StatefulWidget {
  const MyTextWidget({super.key});

  @override
  State<MyTextWidget> createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<DropdownText>();
    return Text(data.text);
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  // final DropdownText MyObjectText = DropdownText();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.

        dropdownValue = value!;
        context.read<DropdownText>().setText(value);
        //print(dropdownValue);
        //print(context.read<DropdownText>().text);
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

// class CounterBody extends StatelessWidget {
//   const CounterBody({super.key, required this.TextNotifier});

//   final DropdownText TextNotifier;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text('Current counter value:'),
//           // Thanks to the ListenableBuilder, only the widget displaying the
//           // current count is rebuilt when counterValueNotifier notifies its
//           // listeners. The Text widget above and CounterBody itself aren't
//           // rebuilt.
//           ListenableBuilder(
//             listenable: TextNotifier,
//             builder: (BuildContext context, Widget? child) {
//               return Text('${TextNotifier.text}');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }