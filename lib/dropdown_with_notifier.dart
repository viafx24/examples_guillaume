import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Phoenix(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DropdownText()),
      ],
      child: const DropdownMenuApp(),
    )),
  );
}


class DropdownMenuApp extends StatefulWidget {
  const DropdownMenuApp({super.key});

  @override
  State<DropdownMenuApp> createState() => _DropdownMenuAppState();
}

class _DropdownMenuAppState extends State<DropdownMenuApp> {
  @override
  Widget build(BuildContext context) {
    String? text_dropdown_1 = context.watch<DropdownText>().text_dropdown_1;
    String? text_dropdown_2 = context.watch<DropdownText>().text_dropdown_2;
    double A=3;
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        home:  Scaffold(
            body: SafeArea(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DropDownMenu_1(),
                        const SizedBox(height: 60),
                        text_dropdown_1 != null ? DropDownMenu_2(): Container()
                      ],
                    )))));
  }
}

 

// class DropdownMenuApp extends StatelessWidget {
//   const DropdownMenuApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String? text_dropdown_1 = context.watch<DropdownText>().text_dropdown_1;
//     String? text_dropdown_2 = context.watch<DropdownText>().text_dropdown_2;
//     double A=3;
//     return MaterialApp(
//         theme: ThemeData(
//           useMaterial3: true,
//           colorSchemeSeed: Colors.green,
//         ),
//         home: const Scaffold(
//             body: SafeArea(
//                 child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Column(
//                       //mainAxisAlignment: MainAxisAlignment.center,
//                       //crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         DropDownMenu_1(),
//                         const SizedBox(height: 60),
//                         if (A == 1)
//                         text_dropdown_1 != null ? DropDownMenu_2(): container()
// //                        DropDownMenu_2()
//                         // text_dropdown_1 != null
//                         //  ? DropDownMenu_2():
//                       ],
//                     )))));
//   }
// }

class DropdownText with ChangeNotifier {
  String? _text_dropdown_1 ;
  String? _text_dropdown_2 ;

  String? get text_dropdown_1 => _text_dropdown_1;

  String? get text_dropdown_2 => _text_dropdown_2;

  void setText_dropdown_1(String value) {
    _text_dropdown_1 = value;
    notifyListeners();
  }

  void setText_dropdown_2(String value) {
    _text_dropdown_2 = value;
    notifyListeners();
  }
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

String augmentin = "Augmentin";
String melox = "Melox";

CasDeFigure A =
    CasDeFigure("Hérisson", "augmentin", "poids/1000", "Hérisson 50mg/kg");
CasDeFigure B =
    CasDeFigure("Oiseau", "augmentin", "poids*5/1000/12", "Hérisson 50mg/kg");

CasDeFigure C = CasDeFigure("musté", "melox", "poids/1000", "Hérisson 50mg/kg");
CasDeFigure D =
    CasDeFigure("toto", "melox", "poids*5/1000/24", "Hérisson 50mg/kg");

Map<String, List<CasDeFigure>> myMap = {
  augmentin: [A, B],
  melox: [C, D]
};

double? poids;
double? volume;
double width = 300;
bool myBool = false;

class DropDownMenu_1 extends StatefulWidget {
  const DropDownMenu_1({super.key});

  @override
  State<DropDownMenu_1> createState() => _DropDownMenu_1State();
}

class _DropDownMenu_1State extends State<DropDownMenu_1> {
  final TextEditingController colorController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    var text_dropdown_1 = context.watch<DropdownText>().text_dropdown_1;
    var text_dropdown_2 = context.watch<DropdownText>().text_dropdown_2;
    return DropdownMenu(
      // initialSelection: null,
      controller: colorController,
      requestFocusOnTap: true,
      width: width,
      //hintText: 'test',
      label: Text("Choisir un médicament"),
      onSelected: (newValue) {
        //myBool=true ? Phoenix.rebirth(context):
        context.read<DropdownText>().setText_dropdown_1(newValue);

        poids = null;
        volume = null;
        print("1:${text_dropdown_1}");
        print("2:${text_dropdown_2}");
      },

      dropdownMenuEntries: myMap.keys.map<DropdownMenuEntry>((value) {
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


class DropDownMenu_2 extends StatefulWidget {
  const DropDownMenu_2({super.key});

  @override
  State<DropDownMenu_2> createState() => _DropDownMenu_2State();
}

class _DropDownMenu_2State extends State<DropDownMenu_2> {
   final TextEditingController iconController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var text_dropdown_1 = context.watch<DropdownText>().text_dropdown_1;
    var text_dropdown_2 = context.watch<DropdownText>().text_dropdown_2;
    return DropdownMenu(
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
                          context.read<DropdownText>().setText_dropdown_2(newValue);
                          print(text_dropdown_2);
                        },

                        dropdownMenuEntries:
                            myMap[text_dropdown_1]!.map<DropdownMenuEntry>((value) {
                          return DropdownMenuEntry(
                            value: value.nameCasDeFigure,
                            label: value.nameCasDeFigure!,
                            // enabled: test.label != 'Grey',
                            //style: MenuItemButton.styleFrom(
                            // foregroundColor: test.color,
                          );
                        }).toList(),
                      );
  }
}