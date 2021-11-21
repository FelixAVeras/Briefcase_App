import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(sortAscending: true, sortColumnIndex: 0, columns: [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Precio')),
        DataColumn(label: Text('Cant.')),
      ], rows: [
        DataRow(cells: [
          DataCell(Text('Jugo naranja Tropicana')),
          DataCell(Text('285.96')),
          DataCell(Text('28'))
        ]),
        DataRow(cells: [
          DataCell(Text('Carne Angus')),
          DataCell(Text('397.14 x Lbs')),
          DataCell(Text('32'))
        ]),
        DataRow(cells: [
          DataCell(Text('Pantalon Levis')),
          DataCell(Text('800.00')),
          DataCell(Text('12'))
        ]),
        DataRow(cells: [
          DataCell(Text('Perfume CH-212')),
          DataCell(Text('2564.96')),
          DataCell(Text('8'))
        ]),
      ]),
    );
  }
}
