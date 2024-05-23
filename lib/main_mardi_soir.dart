import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
//import 'package:restart_app/restart_app.dart';

// Flutter code sample for [DropdownMenu]s. The first dropdown menu
// has the default outlined border and demos using the
// [DropdownMenuEntry] style parameter to customize its appearance.
// The second dropdown menu customizes the appearance of the dropdown
// menu's text field with its [InputDecorationTheme] parameter.

// void main() {



//   runApp(const DropdownMenuExample());
// }




void main() {
  runApp(
    Phoenix(
      child: const DropdownMenuExample(),
    ),
  );
}

// DropdownMenuEntry labels and values for the first dropdown menu.
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

// DropdownMenuEntry labels and values for the second dropdown menu.
enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

class medicament {
  String? categorie;
  var listAnimal = [];
  String name;

  String get nameMedoc {
    return name;
  }

  medicament(this.name, this.categorie, this.listAnimal);
}

medicament augmentin =
medicament("augmentin", "antibio", ["Augmentin                ", "Melox", "Dexa"]);
medicament melox = medicament(

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  //ColorLabel? selectedColor;
  //IconLabel? selectedIcon;
  String? _selectedKey;
  String? _selectedKey_2;
 final String  _medocLabel="Médicament";
 final String  _animalLabel="Animal";
  medicament augmentin =
      medicament("augmentin", "antibio", ["Augmentin                ", "Melox", "Dexa"]);
  medicament melox = medicament(
      "melox", "antiinflammatoire", ["Herisson", "oiseaux", "fouine"]);
  //final ListeMedoc=[augmentin, melox];
  final ListeMedoc=[augmentin.name, melox.name];

  print(ListeMedoc[0].name);
// late List<medicament> deckList = [augmentin];
// decklist.add(melox);
// print("test");
  // /List<medicament>? ListMedoc;

  // var A=[1,2,3];
  // A.add(4);
  // print(A)



 //ListMedoc.add(augmentin);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        home: Scaffold(
          body: SafeArea(
           child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 60),
                  DropdownMenu(
                   // initialSelection: null,
                    controller: colorController,
                    // requestFocusOnTap is enabled/disabled by platforms when it is null.
                    // On mobile platforms, this is false by default. Setting this to true will
                    // trigger focus request on the text field and virtual keyboard will appear
                    // afterward. On desktop platforms however, this defaults to true.
                    requestFocusOnTap: true,
                    label:Text(_medocLabel),
                    onSelected: (newValue) {
                      setState(() {
                        _selectedKey = newValue;
                        augmentin.listAnimal;
                        print(_selectedKey);
                        
                      });
                    },

                    dropdownMenuEntries:
                        augmentin.listAnimal.map<DropdownMenuEntry>((value) {
                      return DropdownMenuEntry(
                        value: value,
                        label: value,
                        // enabled: test.label != 'Grey',
                        //style: MenuItemButton.styleFrom(
                        // foregroundColor: test.color,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 60),
                  // _selectedKey != null
                       DropdownMenu(
                          //initialSelection: null,
                          controller: iconController,
                          // requestFocusOnTap is enabled/disabled by platforms when it is null.
                          // On mobile platforms, this is false by default. Setting this to true will
                          // trigger focus request on the text field and virtual keyboard will appear
                          // afterward. On desktop platforms however, this defaults to true.
                          requestFocusOnTap: true,
                          label:  Text(_animalLabel),
                          onSelected: (newValue) {
                            setState(() {
                              _selectedKey_2 = newValue;
                              melox.listAnimal;
                              print(_selectedKey_2);
                            });
                          },

                          dropdownMenuEntries:
                              melox.listAnimal.map<DropdownMenuEntry>((value) {
                            return DropdownMenuEntry(
                              value: value,
                              label: value,
                              // enabled: test.label != 'Grey',
                              //style: MenuItemButton.styleFrom(
                              // foregroundColor: test.color,
                            );
                          }).toList(),
                        ),
                      // : Container(),
                      ElevatedButton(
                        onPressed: (){
                          Phoenix.rebirth(context);

                          //RestartWidget.restartApp(context);
                          // setState(() {
                          // _selectedKey = null;
                          // _selectedKey_2 = null;
                          //Restart.restartApp();
                          // }
                          //);
                        } ,
                         child: const Text('Reset'))
                ],
    //          ),
            ),
//          ),
        ),
        ),
        ),
    );
  }
}

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
