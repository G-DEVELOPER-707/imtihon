import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../states.dart';
import 'Contact_page.dart';

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
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 83.33,
                        width: 83.3,
                        child: Image.asset(
                          'assets/images/odamcha.png',
                          height: 83.33,
                          width: 83.33,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        contactList[widget.index].name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {contactList.removeAt(widget.index);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const ContactPage();
                        }));
                    setState(() {});
                      },

                    child: Icon(
                      Icons.delete,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.drive_file_rename_outline_rounded,
                      size: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      contactList[widget.index].number,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset("assets/images/Group 22.png"),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset("assets/images/Group 23.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text("Call history",textAlign:TextAlign.start,)

            ],
          ),
        ));
  }
}
