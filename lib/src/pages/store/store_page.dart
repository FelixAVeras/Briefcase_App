import 'package:briefcase/src/pages/store/inventory_page.dart';
import 'package:briefcase/src/pages/store/sales_page.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tienda'),
            centerTitle: true,
            backgroundColor: Colors.blue[800],
            bottom: TabBar(tabs: [
              Tab(
                text: 'Ventas',
                icon: Icon(Icons.attach_money),
              ),
              Tab(
                text: 'Inventario',
                icon: Icon(Icons.all_inbox_sharp),
              ),
            ], indicatorWeight: 5, indicatorColor: Colors.white),
          ),
          body: TabBarView(children: [SalesPage(), InventoryPage()]),
        ));
  }
}
