// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CostumTextFieldAccount extends StatelessWidget {
  final bool readonly ; 
  final String title;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  const CostumTextFieldAccount(
      {super.key,
      required this.title,
      required this.mycontroller,
      this.validator, required this.readonly});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16, top: 12),
          height: 50,
          child: TextFormField(
            readOnly: readonly,
            controller: mycontroller,
            validator: validator,
            style: const TextStyle(fontSize: 18),
            cursorHeight: 25,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        )
      ],
    );
  }
}
