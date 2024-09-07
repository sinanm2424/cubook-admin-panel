import 'package:cu_book_admin_new/side_menus/organize_products/root_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  int screenIndex = 2;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedLabelTextStyle: const TextStyle(color: Colors.white),
            elevation: 1,
            backgroundColor: const Color.fromARGB(255, 40, 43, 115),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedLabelTextStyle: const TextStyle(color: Colors.white),
            selectedIndex: widget.screenIndex,
            extended: MediaQuery.of(context).size.width > 700,
            leading: SizedBox(
                height: 300,
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  width: 70,
                )),
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text("Home")),
              NavigationRailDestination(
                  icon: Icon(Icons.production_quantity_limits),
                  label: Text("Manage Products")),
              NavigationRailDestination(
                  icon: Icon(Icons.manage_accounts_rounded),
                  label: Text("Organize Products")),
              NavigationRailDestination(
                  icon: Icon(Icons.upload_file_outlined),
                  label: Text("Prepare PDFs")),
            ],
            onDestinationSelected: (value) => setState(() {
              widget.screenIndex = value;
            }),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          spreadRadius: -15,
                          offset: Offset(0, 4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    [
                      "Home",
                      "Manage Products",
                      "Organize Products",
                      "Prepare PDFs"
                    ][widget.screenIndex],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              [
                Container(),
                Container(),
                Organize_Products(),
                Container()
              ][widget.screenIndex]
            ],
          ))
        ],
      ),
    );
  }
}
