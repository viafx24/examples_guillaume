import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    Phoenix(
      child: const DropdownMenuExample(),
    ),
  );
}

class Medicament {
  String categorie;
  String name;
  String location;

  String get nameMedoc {
    return name;
  }

  Medicament(this.name, this.categorie, this.location);
}

class CasDeFigure {
  String? name;
  String? equation;
  String? label;
  String? medoc;

  String? get nameCasDeFigure {
    return name;
  }

  CasDeFigure(this.name, this.medoc, this.equation, this.label);
}

  // Medicament augmentin = Medicament("augmentin", "antibio", "frigo");

  // Medicament melox = Medicament("melox", "antiinflammatoire", "étagère");

  String augmentin="Augmentin";
  String melox="Melox";

  CasDeFigure A =
      CasDeFigure("Hérisson", "augmentin", "poids/1000", "Hérisson 50mg/kg");
  CasDeFigure B =
      CasDeFigure("Oiseau", "augmentin", "poids*5/1000/12", "Hérisson 50mg/kg");

  CasDeFigure C =
      CasDeFigure("musté", "melox", "poids/1000", "Hérisson 50mg/kg");
  CasDeFigure D =
      CasDeFigure("toto", "melox", "poids*5/1000/24", "Hérisson 50mg/kg");

  Map<String, List<CasDeFigure>> myMap = {
    augmentin: [A, B],
    melox: [C, D]
  };

double? poids;
double? volume;
double width=300;
bool myBool=false;

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
  final String _medocLabel = "Médicament";
  final String _animalLabel = "Animal";
  // Medicament augmentin =
  //     Medicament("augmentin", "antibio", ["Augmentin                ", "Melox", "Dexa"]);

  //final ListeMedoc=[augmentin, melox];
  // final ListeMedoc=[augmentin.name, melox.name];

  // print(ListeMedoc[0].name);
// late List<Medicament> deckList = [augmentin];
// decklist.add(melox);
// print("test");
  // /List<Medicament>? ListMedoc;

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
                  requestFocusOnTap: true,
                  width: width,
                  //hintText: 'test',
                  label: Text("Choisir un médicament"),
                  onSelected: (newValue) {
                    setState(() {
                     //myBool=true ? Phoenix.rebirth(context):
                      _selectedKey = newValue;
                      _selectedKey_2 = 'test2';

                      poids = null;
                      volume = null;
                      print(_selectedKey);
                    });
                  },

                  dropdownMenuEntries:
                      myMap.keys.map<DropdownMenuEntry>((value) {
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
                _selectedKey != null
                    ? DropdownMenu(
                        //initialSelection: null,
                        controller: iconController,
                        // requestFocusOnTap is enabled/disabled by platforms when it is null.
                        // On mobile platforms, this is false by default. Setting this to true will
                        // trigger focus request on the text field and virtual keyboard will appear
                        // afterward. On desktop platforms however, this defaults to true.
                        requestFocusOnTap: true,
                        width: width,
                        //hintText: 'test2',
                        label: Text("Choisir un animal/dosage"),
                        onSelected: (newValue) {
                          setState(() {
                            _selectedKey_2 = newValue;
                            print(_selectedKey_2);
                          });
                        },

                        dropdownMenuEntries:
                            myMap[_selectedKey]!.map<DropdownMenuEntry>((value) {
                          return DropdownMenuEntry(
                            value: value.nameCasDeFigure,
                            label: value.nameCasDeFigure!,
                            // enabled: test.label != 'Grey',
                            //style: MenuItemButton.styleFrom(
                            // foregroundColor: test.color,
                          );
                        }).toList(),
                      )
                    : Container(),
                const SizedBox(height: 60),
                _selectedKey_2 != null
                    ? SizedBox(
                        width: width,
                        child: TextField(
                          onChanged: (poidsValue) {
                            setState(() {
                              poids = double.parse(poidsValue);
                              print(poids.toString());
                              print(
                                  'First text field: $poidsValue (${poidsValue.characters.length})');
                            });
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              labelText:
                                  "Entrer le poids de l'animal en GRAMME"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                      )
                    : Container(),
                const SizedBox(height: 60),
                //print("test");
                //print(poids.toString());
                poids != null
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            volume = poids;
                          });
                          print((poids).toString());
                        },
                        child: const Text('Calcul du volume à préléver'))
                    : Container(),
                const SizedBox(height: 60),
                volume != null

                    ? Column(
                      children: [
                        Text("Pour le cas de figure $_selectedKey/$_selectedKey_2, il faut préléver un volume de: "),
                        Text("$volume ml",style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                      ],
                    )
                    : Container(),
                const SizedBox(height: 60),
                ElevatedButton(
                    onPressed: () {
                      volume = null;
                      poids = null;
                      Phoenix.rebirth(context);
                    },
                    child: const Text('reset'))
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

// // DropdownMenuEntry labels and values for the second dropdown menu.
// enum IconLabel {
//   smile('Smile', Icons.sentiment_satisfied_outlined),
//   cloud(
//     'Cloud',
//     Icons.cloud_outlined,
//   ),
//   brush('Brush', Icons.brush_outlined),
//   heart('Heart', Icons.favorite);

//   const IconLabel(this.label, this.icon);
//   final String label;
//   final IconData icon;
// }