import 'package:flutter/material.dart';
import 'package:briefcase/src/pages/perfil/profile_edit.dart';
import 'package:briefcase/src/pages/perfil/contactos_pago.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: (Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Text.rich(
                TextSpan(text: 'Perfil'),
              ),
              Card(
                child: ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Editar perfil'),
                    subtitle: Text('Oscar Galloval'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEdit())),
                        }),
              ),
              Card(
                child: ListTile(
                  // leading: Icon(Icons.badge_outlined),
                  leading: Icon(Icons.badge),
                  title: Text('Tarjeta de contacto'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              Text.rich(
                TextSpan(text: 'Contactos'),
              ),
              Card(
                child: ListTile(
                  // leading: Icon(Icons.groups_rounded),
                  leading: Icon(Icons.group_rounded),
                  title: Text('Contactos de cobro'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              Card(
                child: ListTile(
                    leading: Icon(Icons.local_shipping_rounded),
                    title: Text('Contactos de pago'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePago())),
                        }),
              ),
            ],
          ))),
    );
  }
}
