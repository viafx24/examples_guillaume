import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:function_tree/function_tree.dart';
import 'Medicament.dart';
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
    int? poids = context.watch<DropdownText>().poids;
    String? volume = context.watch<DropdownText>().volume;

    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        home: Scaffold(
            body: SafeArea(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: widget_space),
                        DropDownMenu_1(),
                        SizedBox(height: widget_space),
                        text_dropdown_1 != null
                            ? DropDownMenu_2()
                            : Container(),
                        SizedBox(height: widget_space),
                        text_dropdown_2 != null ? MyInputField() : Container(),
                        SizedBox(height: widget_space),
                        poids != null ? MybuttonCompute() : Container(),
                        SizedBox(height: widget_space),
                        volume != null ? MyResult() : Container(),
                        SizedBox(height: widget_space),
                        MyResetButton()
                      ],
                    ))))));
  }
}

class DropdownText with ChangeNotifier {
  String? _text_dropdown_1;
  String? _text_dropdown_2;

  int? _poids;
  String? _volume;

  String? _equation;

  String? get text_dropdown_1 => _text_dropdown_1;
  String? get text_dropdown_2 => _text_dropdown_2;
  int? get poids => _poids;
  String? get volume => _volume;
  String? get equation => _equation;

  void setText_dropdown_1(String? value) {
    _text_dropdown_1 = value;
    notifyListeners();
  }

  void setText_dropdown_2(String? value) {
    _text_dropdown_2 = value;
    notifyListeners();
  }

  void setPoids(int? value) {
    _poids = value;
    notifyListeners();
  }

  void setVolume(String? value) {
    _volume = value;
    notifyListeners();
  }

  void setEquation(String? value) {
    _equation = value;
    notifyListeners();
  }
}




// class CasDeFigure {
//   String? name;
//   String? equation;
//   String? label;
//   String? medoc;

//   String? get nameCasDeFigure {
//     return name;
//   }

//   CasDeFigure(this.name, this.medoc, this.equation, this.label);
// }

// // Medicament augmentin = Medicament("augmentin", "antibio", "frigo");

// // Medicament melox = Medicament("melox", "antiinflammatoire", "étagère");

// String Melox = "Melox (metacam)";
// String Augmentin = "Augmentin";

// CasDeFigure A =
//     CasDeFigure("oiseaux (1mg/kg)", "augmentin", "poids/1000", "Hérisson 50mg/kg");
// CasDeFigure B =
//     CasDeFigure("Oiseau", "augmentin", "poids*5/1000/12", "Hérisson 50mg/kg");

// CasDeFigure C = CasDeFigure("musté", "melox", "poids/1000", "Hérisson 50mg/kg");
// CasDeFigure D =
//     CasDeFigure("toto", "melox", "poids*5/1000/24", "Hérisson 50mg/kg");

// Map<String?, List<CasDeFigure>> myMap = {
//   A.name: [A, B],
//   melox: [C, D]
// };

// double? poids;
// double? volume;
double width = 300;
double widget_space = 30;
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
    int? poids = context.watch<DropdownText>().poids;
    String? volume = context.watch<DropdownText>().volume;
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
        context.read<DropdownText>().setText_dropdown_2(null);
        context.read<DropdownText>().setPoids(null);
        context.read<DropdownText>().setVolume(null);
        // poids = null;
        // volume = null;
        // print("1:${text_dropdown_1}");
        // print("2:${text_dropdown_2}");
        print(MyMapMedocs[text_dropdown_1]);
      },

      //dropdownMenuEntries: myMap.keys.map<DropdownMenuEntry>((value) {
      // final List<String> MedocNames = A.map((Medicament) => Medicament.nameMedoc).toList();
      dropdownMenuEntries: MedocNames.map<DropdownMenuEntry>((value) {
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
          //myMap[text_dropdown_1]!.map<DropdownMenuEntry>((value) {
          MyMapMedocs[text_dropdown_1]!
              .map
              .keys
              .map<DropdownMenuEntry>((value) {
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

class MyInputField extends StatefulWidget {
  const MyInputField({super.key});

  @override
  State<MyInputField> createState() => MyInputFieldState();
}

class MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: (poidsValue) {
          context.read<DropdownText>().setVolume(null);
          poidsValue.characters.length > 0 ?
            context.read<DropdownText>().setPoids(int.parse(poidsValue))
            : context.read<DropdownText>().setPoids(null);
          //   print('$poidsValue (${poidsValue.characters.length})');
          },
          //print(context.read<DropdownText>().setPoids(double.parse(poidsValue)).toString());
        onTap: () {
          context.read<DropdownText>().setPoids(null);
          context.read<DropdownText>().setVolume(null);},
        // onSubmitted: (poidsValue){
        //   poidsValue.characters.length > 0 ?
        //     context.read<DropdownText>().setPoids(int.parse(poidsValue))
        //     : context.read<DropdownText>().setPoids(null);
        // },
        onTapOutside: ((event) {
              FocusScope.of(context).unfocus();
            }),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
            labelText: "Entrer le poids de l'animal en GRAMME"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], // Only numbers can be entered
      ),
    );
  }
}

class MybuttonCompute extends StatefulWidget {
  const MybuttonCompute({super.key});

  @override
  State<MybuttonCompute> createState() => _MybuttonComputeState();
}

class _MybuttonComputeState extends State<MybuttonCompute> {
  @override
  Widget build(BuildContext context) {
    String? text_dropdown_1 = context.watch<DropdownText>().text_dropdown_1;
    String? text_dropdown_2 = context.watch<DropdownText>().text_dropdown_2;
    int? poids = context.watch<DropdownText>().poids;
    String? equation = MyMapMedocs[text_dropdown_1]!.map[text_dropdown_2];
    equation = equation?.replaceAll("poids", poids.toString());
    String volume = equation!.interpret().toStringAsFixed(2);
    return SizedBox(
      width: 300,
      child: ElevatedButton(
          onPressed: () {
            context.read<DropdownText>().setEquation(equation);
            context.read<DropdownText>().setVolume(volume);
            //print((poids).toString());
          },
          child: const Text('Calcul du volume à préléver')),
    );
  }
}

class MyResult extends StatefulWidget {
  const MyResult({super.key});

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  @override
  Widget build(BuildContext context) {
    String? text_dropdown_1 = context.watch<DropdownText>().text_dropdown_1;
    String? text_dropdown_2 = context.watch<DropdownText>().text_dropdown_2;
    int? poids = context.watch<DropdownText>().poids;
    String? equation = context.watch<DropdownText>().equation;
    String? volume = context.watch<DropdownText>().volume;
    // String? myequation = MyMapMedocs[text_dropdown_1]!.map[text_dropdown_2];
    // myequation = myequation?.replaceAll("poids", poids.toString());
    // context.read<DropdownText>().setEquation(myequation);
    // String volume = myequation!.interpret().toStringAsFixed(2);
    // context.read<DropdownText>().setVolume(volume);
    return Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text.rich(
             TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Le volume de '),
                TextSpan(
                    text: '$text_dropdown_1',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' à préléver pour un/une '),
                TextSpan(
                    text: '$text_dropdown_2',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' pesant '),
                TextSpan(
                    text: '$poids',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(
                    text: ' GRAMME',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' est de:'),

              ],
            ),
          ),
        ),
        //SizedBox(height: 10),
        Text("$equation",style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Text("soit:",style: TextStyle(fontSize: 16.0)),
        const SizedBox(height: 10),
        Text("$volume ml",
            style:
                const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
                
        //Text("$myequation -> ${myequation!.interpret().toStringAsFixed(2)}")
      ],
    );
  }
}

class MyResetButton extends StatefulWidget {
  const MyResetButton({super.key});

  @override
  State<MyResetButton> createState() => _MyResetButtonState();
}

class _MyResetButtonState extends State<MyResetButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        
          onPressed: () {
            context.read<DropdownText>().setText_dropdown_1(null);
            context.read<DropdownText>().setText_dropdown_2(null);
            context.read<DropdownText>().setPoids(null);
            context.read<DropdownText>().setVolume(null);
            Phoenix.rebirth(context);
          },
         
          child: const Text('reset')),
    );
        
  }
}
