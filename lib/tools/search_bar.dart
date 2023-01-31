import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
              EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
              border: InputBorder.none,
              hintText: 'Rechercher',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search,color: Colors.black,size: 25,),
              suffixIcon: Icon(Icons.filter_alt_outlined,color: Colors.black,size: 25),
            ),
            cursorHeight: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
