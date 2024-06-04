
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

//void main() => runApp(const SimpleDropdown());


void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 60),
                SearchDropdown()]

            ),
          ),
        ),
      ),
    ),
  );
}



// void main() => runApp(const SearchDropdown());

class Job with CustomDropdownListFilter {
  final String name;
  final IconData icon;
  const Job(this.name, this.icon);

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}


const List<Job> _list = [
    Job('Developer', Icons.developer_mode),
    Job('Designer', Icons.design_services),
    Job('Consultant', Icons.account_balance),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Developer', Icons.developer_mode),
    Job('Designer', Icons.design_services),
    Job('Consultant', Icons.account_balance),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
        Job('Developer', Icons.developer_mode),
    Job('Designer', Icons.design_services),
    Job('Consultant', Icons.account_balance),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
        Job('Developer', Icons.developer_mode),
    Job('Designer', Icons.design_services),
    Job('Consultant', Icons.account_balance),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
    Job('Student', Icons.school),
  ];

class SearchDropdown extends StatelessWidget {
  const SearchDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<Job>.search(
      hintText: 'Select job role',
      items: _list,
      excludeSelected: false,
      onChanged: (value) {
        log('changing value to: $value');
      },
    );
  }
}

