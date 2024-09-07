import 'package:cu_book_admin_new/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get/get.dart';

class DataTree extends StatelessWidget {
  DataTree({super.key});
  Rx<TreeController> controller = TreeController(allNodesExpanded: false).obs;

  @override
  Widget build(BuildContext context) {
    Map tree_data = level;
    return SingleChildScrollView(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TreeView(
              treeController: controller.value, nodes: TreeContent(tree_data), indent: 25)),
    );
  }
}

// ............................................

// ..........................................
List<TreeNode> TreeContent(Map tree) {
  List<TreeNode> node_list = [];
  tree.map((key, value) {
    if (key == 'details') {
    } else if (value is Map) {
      node_list.add(TreeNode(
          content: Row(children: [
            Text(key),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.close),
              iconSize: 15,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit), iconSize: 15),
            IconButton(onPressed: () {}, icon: Icon(Icons.add), iconSize: 15),
          ]),
          children: TreeContent(value)));
    } else if (value is List) {
      node_list.add(TreeNode(
          content: TextButton(
        child: Text('$key'),
        onPressed: () {},
      )));
    } else {
      node_list.add(TreeNode(content: Text('$key')));
    }
    return MapEntry(key, value);
  });

  return node_list;
}
