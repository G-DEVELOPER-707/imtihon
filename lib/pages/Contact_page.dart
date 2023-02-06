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
    return contactList.isEmpty
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
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
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
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
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Positioned(
                          left: 130,
                          top: 140,
                          child: SvgPicture.asset(
                            'assets/svg/Vector.svg',
                            width: 105.08,
                            height: 100,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You have no contacts yet",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ])),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AddPage');
              },
              child: Icon(CupertinoIcons.add),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: !isClicked
                ? AppBar(
                    backgroundColor: Colors.white,
                    title: isClicked
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
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
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
                  )
                : AppBar(
                    backgroundColor: Colors.white,
                    leading: IconButton(
                        onPressed: () {
                          isClicked = !isClicked;
                          setState(() {

                          });
                        },
                        icon: Icon(
                          CupertinoIcons.chevron_back,
                          color: Colors.black,
                        )),
                    title: isClicked
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
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
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
            body: !isClicked
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: contactList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
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
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ContactInfosPage(index: index)),
                                );
                              },
                              child: contactItem(context, searchList[index]));
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
