import 'package:flutter/material.dart';

Widget dropDownButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: Container(
      color: const Color.fromARGB(39, 158, 158, 158),
      child: DropdownButtonFormField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0))),
          items: <String>[
            "State",
            "Maharashtra",
            "Uttar Pradesh",
            "Madhya Pradesh",
            "Punjab",
            "Andhra Pradesh",
            "Gujarat",
            "Bihar",
            "Jharkhand",
            "Tamil Nadu",
            "Rajasthan",
            "Kerala",
            "Karnataka",
            "Delhi",
            "Manipur",
            "Meghalaya",
            "Himachal Pradesh",
            "Goa",
            "Sikkim",
            "Orissa",
            "Nagaland",
            "Tripura",
            "Arunachal Pradesh",
            "Haryana",
            "Assam",
            "Chhatisgarh",
            "Jammu and Kashmir",
          ]
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {}),
    ),
  );
}
