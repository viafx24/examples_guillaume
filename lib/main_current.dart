import 'package:flutter/material.dart';


/// Flutter code sample for [DropdownMenu].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: const Center(
          child: DropdownMenuExample(),
        ),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue = "test";

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: dropdownValue,
      label: const Text("test"),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          //dropdownValue = null;
          print(dropdownValue);
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

