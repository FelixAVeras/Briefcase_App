import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Editar perfil'),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: (Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.book),
                    hintText: 'Nombre',
                    labelText: 'Nombre',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.book),
                    hintText: 'Apellido',
                    labelText: 'Apellido',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    hintText: 'Tipo de documento',
                    labelText: 'No seleccionado',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.badge_outlined),
                    icon: Icon(Icons.badge),
                    hintText: 'Documento',
                    labelText: 'Documento',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.call),
                    hintText: 'Celular',
                    labelText: 'Celular',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: 'Correo',
                    labelText: 'Correo',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: const Text('Guardar'),
                ),
              ],
            ))));
  }
}
