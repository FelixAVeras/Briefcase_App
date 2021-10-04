import 'package:briefcase/src/models/categoria.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> cats;
  CategoryList({Key key, this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cats == null ? 0 : cats.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => DetailWidget(trans[index])),
              // );
            },
            child: ListTile(
              title: Text(cats[index].ctgyname),
            ),
          ));
        });
  }
}
