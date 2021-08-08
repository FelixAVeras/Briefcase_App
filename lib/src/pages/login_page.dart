import 'package:briefcase/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(padding: EdgeInsets.all(8.0), children: [
      Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset('assets/briefcase.png'),
            SizedBox(height: 15.0),
            Text('Briefcase',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0)),
            SizedBox(height: 30.0),
            Text('Iniciar Sesion',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic)),
            SizedBox(height: 15.0),
            Container(
              child: Column(children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Correo Electronico',
                          prefixIcon: Icon(Icons.alternate_email),
                          hintText: 'ejemplo@ejemplo.com'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduzca un email valido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduzca una contraseña valida';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 35.0),
                    RaisedButton(
                      child: Container(
                        child: Text('Iniciar Sesion'),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 15.0),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()))
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 25.0),
                    // RaisedButton(
                    //   child: Text('Registro de Usuario'),
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 80.0, vertical: 15.0),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5.0)),
                    //   color: Colors.white,
                    //   textColor: Colors.blue,
                    //   onPressed: () {},
                    // ),
                  ]),
                )
              ]),
            ),
          ]),
        ),
      )
    ])));
  }

  bool validatedForm() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();

      return true;
    }

    return false;
  }
}
