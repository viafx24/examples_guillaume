import 'package:flutter/material.dart';

void main() {
  runApp(const DropdownMenuExample());
}


class DropdownMenuAlone extends StatefulWidget {
  const DropdownMenuAlone({super.key});

  @override
  State<DropdownMenuAlone> createState() => _DropdownMenuAloneState();
}

class _DropdownMenuAloneState extends State<DropdownMenuAlone> {

  String? _selectedKey;

  Medicament augmentin =
      Medicament("augmentin", "antibio", ["Augmentin", "Melox", "Dexa"]);
  Medicament melox = Medicament(
      "melox", "antiinflammatoire", ["Herisson", "oiseaux", "fouine"]);
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
                    initialSelection: _selectedKey,
                    //controller: colorController,
                    // requestFocusOnTap is enabled/disabled by platforms when it is null.
                    // On mobile platforms, this is false by default. Setting this to true will
                    // trigger focus request on the text field and virtual keyboard will appear
                    // afterward. On desktop platforms however, this defaults to true.
                    requestFocusOnTap: true,
                    label: const Text('Médicament'),
                    onSelected: (newValue) {
                      setState(() {
                        _selectedKey = newValue;  
                        //_selectedKey = null; 
                        print(_selectedKey) ;   
                        _selectedKey = null;
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
                  );

  }

}


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
  //String? _selectedKey;

  Medicament augmentin =
      Medicament("augmentin", "antibio", ["Augmentin", "Melox", "Dexa"]);
  Medicament melox = Medicament(
      "melox", "antiinflammatoire", ["Herisson", "oiseaux", "fouine"]);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        home: const Scaffold(
          body: SafeArea(
           child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   DropdownMenuAlone(),
                   SizedBox(height: 60),
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



class Medicament {
  String? categorie;
  var listAnimal = [];
  String name;

  String get nameMedoc {
    return name;
  }

  Medicament(this.name, this.categorie, this.listAnimal);
}


  //final ListeMedoc=[augmentin, melox];

// late List<Medicament> deckList = [augmentin];
// decklist.add(melox);
// print("test");
  // /List<Medicament>? ListMedoc;

  // var A=[1,2,3];
  // A.add(4);
  // print(A)



 //ListMedoc.add(augmentin);


//  DropdownMenu(
//                     initialSelection: _selectedKey,
//                     controller: colorController,
//                     // requestFocusOnTap is enabled/disabled by platforms when it is null.
//                     // On mobile platforms, this is false by default. Setting this to true will
//                     // trigger focus request on the text field and virtual keyboard will appear
//                     // afterward. On desktop platforms however, this defaults to true.
//                     requestFocusOnTap: true,
//                     label: const Text('Médicament'),
//                     onSelected: (newValue) {
//                       setState(() {
//                         _selectedKey = newValue;
//                         augmentin.listAnimal;
//                         print(_selectedKey);
                        
//                       });
//                     },

//                     dropdownMenuEntries:
//                         augmentin.listAnimal.map<DropdownMenuEntry>((value) {
//                       return DropdownMenuEntry(
//                         value: value,
//                         label: value,
//                         // enabled: test.label != 'Grey',
//                         //style: MenuItemButton.styleFrom(
//                         // foregroundColor: test.color,
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(height: 60),
//                   _selectedKey != null
//                       ? DropdownMenu(
//                           initialSelection: _selectedKey,
//                           controller: iconController,
//                           // requestFocusOnTap is enabled/disabled by platforms when it is null.
//                           // On mobile platforms, this is false by default. Setting this to true will
//                           // trigger focus request on the text field and virtual keyboard will appear
//                           // afterward. On desktop platforms however, this defaults to true.
//                           requestFocusOnTap: true,
//                           label: const Text('Animal'),
//                           onSelected: (newValue) {
//                             setState(() {
//                               _selectedKey = newValue;
//                               melox.listAnimal;
//                               print(_selectedKey);
//                             });
//                           },

//                           dropdownMenuEntries:
//                               melox.listAnimal.map<DropdownMenuEntry>((value) {
//                             return DropdownMenuEntry(
//                               value: value,
//                               label: value,
//                               // enabled: test.label != 'Grey',
//                               //style: MenuItemButton.styleFrom(
//                               // foregroundColor: test.color,
//                             );
//                           }).toList(),
//                         )
//                       : Container(),


                  
                  // _selectedKey != null
                  // ? const DropdownMenuAlone() : Container(),
                  