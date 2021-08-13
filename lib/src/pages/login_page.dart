import 'package:briefcase/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.99,
              child: Column(
                children: [
                  Image.asset('assets/briefcase.png'),
                  SizedBox(height: 15.0),
                  Text('Briefcase',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.blue)),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              child: Column(children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.alternate_email,
                            color: Colors.blue,
                          ),
                          labelText: 'Correo Electronico',
                          hintText: 'ejemplo@ejemplo.com'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduzca un Correo valido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          labelText: 'Contraseña'),
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
                    SizedBox(height: 10),
                    RaisedButton(
                      child: Container(
                        child: Text('Registrar Usuario'),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 15.0),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () => {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => HomePage()))
                      },
                      color: Colors.white,
                      textColor: Colors.blue,
                    )
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
