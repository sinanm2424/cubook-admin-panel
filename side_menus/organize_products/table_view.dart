import 'package:cu_book_admin_new/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}




class Checkbox2 extends StatelessWidget {
  Checkbox2({super.key});

  RxBool isCheched = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Checkbox(
        value: isCheched.value,
        onChanged: (value) => isCheched.value = value!));
  }
}



List<List> database_lookup(List search, Map database) {
  // Setting columns
  List column = ['UID', 'title', 'section', 'file type', 'link'];
  List<List> rows = [column];

  database.forEach((key, value) {
    List row = List.filled(column.length, "");

    Map ids = value;
    ids.removeWhere((key2, value2) => !search.contains(key2));
    ids.forEach((key3, value3) {
      row = [key3, value3['title'], key, value3['type'], value3['link']];
      rows.add(row);
    });
  });
  return rows;
}



class Data_Table extends StatelessWidget {
  const Data_Table({super.key});

  @override
  Widget build(BuildContext context) {
    var search_ids = [
      "17216227240477",
      "17216227240483",
      "17216227240485",
      "17216227250517",
      "17216227240510",
      "17216227240509",
      "17216227240508",
      "17216227240507",
      "17216227240506",
      "17216227240505",
      "17216227240504",
      "17216227240503",
      "17216227240502",
      "17216227240501",
      "17216227240500",
      "17216227240499",
    ];
    List<List> data = database_lookup(search_ids, product);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SearchBar(), // search bar
        SizedBox(height: 10),
        Flexible(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: 0,
                sortAscending: true,
                columnSpacing: 10,
                headingRowColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 217, 217, 217)),
                headingRowHeight: 40,
                columns: [
                  DataColumn(label: Checkbox2()),
                  ...data[0]
                      .sublist(0, data[0].length - 1)
                      .map((e) => DataColumn(
                            label: Text(e),
                          ))
                      .toList(),
                  DataColumn(label: Row(
                    children: [
                      Text('Action'),
                      IconButton(onPressed: (){}, icon: Icon(Icons.download)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.close)),
                    ],
                  ))
                ],
                rows: data.sublist(1).map((sub) {
                  return DataRow(cells: [
                    DataCell(Checkbox2()),
                    ...sub
                        .sublist(0, sub.length - 1)
                        .map((e) => DataCell(Text(e)))
                        .toList(),
                    DataCell(Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.close)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.file_open)),
                        IconButton(
                          onPressed: () => print(sub.last),
                          icon: Icon(Icons.link),
                        ),
                      ],
                    ))
                  ]);
                }).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
