import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon_proyekt/items/contact_item.dart';
import 'package:imtihon_proyekt/pages/contact_infos_page.dart';
import 'package:imtihon_proyekt/states.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _NoContactPageState();
}

class _NoContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return contactList == null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: isClicked == true
                  ? Row(children: [
                      InkWell(
                          onTap: () {
                            isClicked = !isClicked;
                            setState(() {});
                          },
                          child: Icon(Icons.arrow_back_ios_new)),
                      TextFormField(
                        onChanged: (user) {
                          searchedUsers(user);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.black)),
                      )
                    ])
                  : Text(
                      "Contacts",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
              actions: [
                InkWell(
                    onTap: () {
                      isClicked = !isClicked;
                      setState(() {});
                    },
                    child: Icon(Icons.search)),
                SizedBox(
                  width: 12,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Positioned(
                  top: 231,
                  left: 127,
                  child: SvgPicture.asset(
                    'assets/icons/down.svg',
                    width: 105.08,
                    height: 100,
                  ),
                ),
                const Positioned(
                  top: 351,
                  left: 91,
                  child: Text(
                    "You have no contacts yet",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(CupertinoIcons.add),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: isClicked == true
                  ? TextFormField(
                      onChanged: (user) {
                        searchedUsers(user);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.black)),
                    )
                  : const Text(
                      "Contacts",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
              actions: [
                InkWell(
                    onTap: () {
                      isClicked = !isClicked;
                      setState(() {});
                    },
                    child: Icon(Icons.search)),
                SizedBox(
                  width: 12,
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onSelected: (value) {
                    if (value == "Delete") {
                      contactList.clear();
                      setState(() {});
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                        value: "Delete", child: Text("Delete all")),
                    const PopupMenuItem(
                      value: "A-Z",
                      child: Text("Sort by A-Z"),
                    ),
                    const PopupMenuItem(
                      value: "Z-A",
                      child: Text("Sort by Z-A"),
                    ),
                  ],
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          zzzm[0] = contactList[index];
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ContactInfosPage(index: index)),
                          );
                        },
                        child: contactItem(context, contactList[index]));
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AddPage');
              },
              child: Icon(CupertinoIcons.add),
            ),
          );
  }
}

void searchedUsers(String user) {
  searchList.clear();
  contactList.forEach((element) {
    if (element.name.toLowerCase().contains(user.toLowerCase())) {
      searchList.add(element);
    }
  });
}
