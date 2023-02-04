import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../states.dart';

class ContactInfosPage extends StatefulWidget {
  ContactInfosPage({required this.index, Key? key}) : super(key: key);

  int index;

  @override
  State<ContactInfosPage> createState() => _ContactInfosPageState();
}

class _ContactInfosPageState extends State<ContactInfosPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Contact Infos",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/odamcha.png',
                height: 83.33,
                width: 83.33,
              ),
              SizedBox(height: 20,),
              Text(contactList[widget.index].name,s)
            ],
          ),
        ],
      ),
    );
  }
}
