import 'package:cu_book_admin_new/side_menus/organize_products/data_tree.dart';
import 'package:cu_book_admin_new/side_menus/organize_products/table_view.dart';
import 'package:flutter/material.dart';

class Organize_Products extends StatelessWidget {
  const Organize_Products({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 15, spreadRadius: -15, offset: Offset(4, 0))
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButton(child: Text('Expand All'), onPressed: () {}),
                      TextButton(child: Text('Shrink All'), onPressed: () {}),
                    ],
                  ),
                  Flexible(
                    child: Container(
                        alignment: Alignment.topLeft, child: DataTree()),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Import by UID',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), 
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Upload Products with Dir',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Data_Table(),
                        width: double.infinity,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

