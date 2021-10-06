import 'package:briefcase/src/helpers/db_category.dart';
import 'package:briefcase/src/pages/categories/category_list.dart';
import 'package:flutter/material.dart';
import 'package:briefcase/src/models/categoria.dart';
import 'package:briefcase/src/helpers/db_helper.dart';

class CategoryPage extends StatefulWidget {
  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  // DatabaseHelper dbHelper;
  DbConn dbconn = DbConn();
  final _formKey = GlobalKey<FormState>();
  final categoryName = TextEditingController();

  List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    if (categoryList == null) {
      categoryList = List<CategoryModel>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
        backgroundColor: Colors.blue[800]),
      body: new Container(
        child: FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return categoryList.length > 0
              ? new CategoryList(cats: categoryList)
              : new Center(child: Text('No hay datos que mostrar'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[800],
        icon: Icon(Icons.add),
        label: Text('Crear categoria'),
        onPressed: () => _openModal(),
      ),
    );
  }

  Future<void> _openModal() async {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return SimpleDialog(title: Text('Nueva categoria'), children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_tree),
                      hintText: 'Ej: Ropa...',
                      labelText: 'Categoria',
                    ),
                    controller: categoryName,
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Rellene el campo';
                      }
                      return null;
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 16.0
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Categoria creada');

                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        final initDB = dbconn.initDB();
                        initDB.then((db) async {
                          await dbconn.insertCategory(
                            CategoryModel(name: categoryName.text));
                        });

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Guardar'),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1, horizontal: 16.0
                  ),
                  child: ElevatedButton(
                    child: const Text('Cerrar'),
                    onPressed: () => {Navigator.pop(context)},
                  )
                )
              ],
            ),
          )
        ]);
      },
    );
  }

  Future loadList() {
    final Future futureDB = dbconn.initDB();
    return futureDB.then((db) {
      Future<List<CategoryModel>> futureTrans = dbconn.cats();
      futureTrans.then((categoryList) {
        setState(() {
          this.categoryList = categoryList;
        });
      });
    });
  }
}
