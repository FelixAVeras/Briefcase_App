import 'package:flutter/material.dart';

class ProfilePago extends StatefulWidget {
  @override
  ProfilePagoState createState() => ProfilePagoState();
}

class ProfilePagoState extends State<ProfilePago>{
  Future <void> _openModal() async {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return SimpleDialog(
          title: Text('Nuevo contacto'),
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Oscar',
                  labelText: 'Nombre',
                ),
                validator: (String value){
                  if(value == null || value.isEmpty){
                    return 'Rellene el campo';
                  }
                  return null;
                }
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.call),
                  hintText: '3333333333',
                  labelText: 'Celular',
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.badge_outlined),
                  hintText: 'CC',
                  labelText: 'Tipo de documento',
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.badge_outlined),
                  hintText: '1234567',
                  labelText: 'Documento',
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.edit),
                  hintText: 'Comentarios (opcional)',
                  labelText: 'Comentarios',
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                onPressed: () {},
                child: const Text('Guardar'),
              )
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                child: const Text('Eliminar'),
                onPressed: () => {
                  Navigator.pop(context)
                }
              )
            )
          ]
          // decoration: new BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: new BorderRadius.only(
          //     topLeft: const Radius.circular(25.0),
          //     topRight: const Radius.circular(25.0),
          //   ),
          // ),
        );
      },
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos de pago'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: (
        Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                onPressed: () => _openModal(),
                child: const Text('Crear / importar contacto'),
              ),
            ],
          )
        )
      )
    );
  }
}