import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

void main() {
   medicament augmentin = medicament("augmentin", "antibio", ["A", "B", "C"]);
  // medicament melox = medicament("melox", "antiinflammatoire", ["E", "F", "G"]);
 // print(augmentin.nameMedoc);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 20, 211, 109),
      ),
      //     title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60),
                 DropdownMenuExample(),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final Map<String, List<String>> medocs = {
  'Study': ['Math', 'English', 'Japanese'],
  'Workout': ['Shoulder', 'Chest', 'Back'],
  'Coding': ['Flutter', 'Python', 'C#']
};

class medicament {
  String? categorie;
  var listAnimal=[];
  String name;

   String get nameMedoc {
    return name;
  }

  medicament(this.name, this.categorie, this.listAnimal);
}

  final Map<String, List<String>> _dropDownMenu = {
    'Augmentin        ': ['Oiseaux', 'Herisson', 'Mustelidés'],
    'Workout      ': ['Shoulder', 'Chest', 'Back'],
    'Coding       ': ['Flutter', 'Python', 'C#']
  };

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  //ColorLabel? selectedColor;
  String? _selectedKey;
  // String? _selectedItem;

  medicament augmentin = medicament("augmentin", "antibio", ["A", "B", "C"]);
  medicament melox = medicament("melox", "antiinflammatoire", ["E", "F", "G"]);

//  nameMedoc(augmentin)

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: _selectedKey,
      controller: colorController,
      // requestFocusOnTap is enabled/disabled by platforms when it is null.
      // On mobile platforms, this is false by default. Setting this to true will
      // trigger focus request on the text field and virtual keyboard will appear
      // afterward. On desktop platforms however, this defaults to true.
      requestFocusOnTap: true,
      label: const Text('Médicament'),
      onSelected: (newValue) {
        setState(() {
          _selectedKey = newValue;
          _dropDownMenu.keys;
          augmentin.listAnimal;
          print(_selectedKey);
        });
      },

      dropdownMenuEntries: augmentin.listAnimal
          .map<DropdownMenuEntry>((value) {
        return DropdownMenuEntry(
          value: value,
          label: value,
          // enabled: test.label != 'Grey',
          //style: MenuItemButton.styleFrom(
            // foregroundColor: test.color,
          );
      }).toList(),

      _selectedKey != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text(
                      'Which one?',
                      style: TextStyle(fontSize: 24),
                    ),
                    DropdownButton<String>(
                      value: _selectedItem,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      elevation: 16,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                      items: _dropDownMenu[_selectedKey]!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                )
              : Container(),


      //       dropdownMenuEntries: TestLabel.values
      //     .map<DropdownMenuEntry<TestLabel>>((TestLabel test) {
      //   return DropdownMenuEntry<TestLabel>(
      //     value: test,
      //     label: test.label,
      //     // enabled: test.label != 'Grey',
      //     style: MenuItemButton.styleFrom(
      //       // foregroundColor: test.color,
      //     ),
      //   );
      // }).toList(),


    );
  }
}


// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   final TextEditingController colorController = TextEditingController();
//   final TextEditingController iconController = TextEditingController();
//   ColorLabel? selectedColor;
//   IconLabel? selectedIcon;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green,
//       ),
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     DropdownMenu<ColorLabel>(
//                       initialSelection: ColorLabel.green,
//                       controller: colorController,
//                       // requestFocusOnTap is enabled/disabled by platforms when it is null.
//                       // On mobile platforms, this is false by default. Setting this to true will
//                       // trigger focus request on the text field and virtual keyboard will appear
//                       // afterward. On desktop platforms however, this defaults to true.
//                       requestFocusOnTap: true,
//                       label: const Text('test'),
//                       onSelected: (ColorLabel? color) {
//                         setState(() {
//                           selectedColor = color;
//                         });
//                       },
//                       dropdownMenuEntries: ColorLabel.values
//                           .map<DropdownMenuEntry<ColorLabel>>(
//                               (ColorLabel color) {
//                         return DropdownMenuEntry<ColorLabel>(
//                           value: color,
//                           label: color.label,
//                           enabled: color.label != 'Grey',
//                           style: MenuItemButton.styleFrom(
//                             foregroundColor: color.color,
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(width: 24),
//                     DropdownMenu<IconLabel>(
//                       controller: iconController,
//                       enableFilter: true,
//                       requestFocusOnTap: true,
//                       leadingIcon: const Icon(Icons.search),
//                       label: const Text('Icon'),
//                       inputDecorationTheme: const InputDecorationTheme(
//                         filled: true,
//                         contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                       ),
//                       onSelected: (IconLabel? icon) {
//                         setState(() {
//                           selectedIcon = icon;
//                         });
//                       },
//                       dropdownMenuEntries:
//                           IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
//                         (IconLabel icon) {
//                           return DropdownMenuEntry<IconLabel>(
//                             value: icon,
//                             label: icon.label,
//                             leadingIcon: Icon(icon.icon),
//                           );
//                         },
//                       ).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//               if (selectedColor != null && selectedIcon != null)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                         'You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Icon(
//                         selectedIcon?.icon,
//                         color: selectedColor?.color,
//                       ),
//                     )
//                   ],
//                 )
//               else
//                 const Text('Please select a color and an icon.')
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const DropdownMenuExample());
// }

// DropdownMenuEntry labels and values for the first dropdown menu.
// enum ColorLabel {
//   blue('Blue', Colors.blue),
//   pink('Pink', Colors.pink),
//   green('Green', Colors.green),
//   yellow('Orange', Colors.orange),
//   grey('Grey', Colors.grey);

//   const ColorLabel(this.label, this.color);
//   final String label;
//   final Color color;
// }

// enum TestLabel {
//   aug('Aug'),
//   melox('Melox                     '),
//   dexa('Dexa'),
//   nem('Nem'),
//   septo('Septo');

//   const TestLabel(this.label);
//   final String label;
 
// }