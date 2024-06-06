void main() {
  
  Medicament melox = Medicament("Melox (metacam) ", 
  {'oiseaux (1mg/kg) ':'poids/1500',
  'Gros rapace > 1500gr (0.5mg/kg) ':'poids/1500/2',
  'Cygne (0.2mg/ml)':'poids/1500/5'
  });
  
 

  
   }



class Medicament {
  //String categorie;
  String name;
  //String location;
  Map<String,String> map;

  String get nameMedoc {
    return name;
  }

  Medicament(this.name, this.map);

  
}
