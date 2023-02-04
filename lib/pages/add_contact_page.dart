import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon_proyekt/models/contact_model.dart';
import 'package:imtihon_proyekt/states.dart';

import 'Contact_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var nameCtr = TextEditingController();
  var surnameCtr = TextEditingController();
  var numberCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Add',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          foregroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  if (nameCtr.text.isNotEmpty &&
                      surnameCtr.text.isNotEmpty &&
                      numberCtr.text.isNotEmpty) {
                    contactList.add(ContactModel(
                        nameCtr.text + " " + surnameCtr.text, numberCtr.text));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const ContactPage();
                        }));
                    setState(() {});
                  } else if (nameCtr.text.isNotEmpty &&
                      surnameCtr.text.isEmpty &&
                      numberCtr.text.isNotEmpty) {
                    contactList.add(ContactModel(nameCtr.text, numberCtr.text));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const ContactPage();
                        }));
                    setState(() {});
                  }if(nameCtr.text.isEmpty||nameCtr.text.isEmpty){
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              color: Colors.transparent,
                            ),
                            height: 30,
                            child: const Center(
                              child: Text("Name and Phone number is reuqired!",style: TextStyle(color: Colors.redAccent),),
                            ),
                          );
                        });
                  }

                },
                icon: SvgPicture.asset('assets/svg/galochka.svg'))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: nameCtr,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: "Enter name",
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Surname",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: surnameCtr,
                decoration: const InputDecoration(
                  hintText: "Enter surname",
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Phone number",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                maxLength: 9,
                keyboardType: TextInputType.phone,
                controller: numberCtr,
                decoration: InputDecoration(
                    hintText: '__ ___ __ __',
                    hintStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: const OutlineInputBorder(borderSide: BorderSide()),
                    prefixIcon: SizedBox(
                        width: 85,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '+998',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 15),
                            ),
                          ],
                        ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            )
          ]),
        ));
  }
}
