import 'package:briefcase/src/pages/home_page.dart';
import 'package:briefcase/src/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              _loginBackground(context),
              SizedBox(height: 15.0),
              Text('Bienvenido',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic)),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
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
                                  return 'Introduzca un correo electronico valido';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 22.0),
                            TextFormField(
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.blue,
                                  ),
                                  labelText: 'Contraseña',
                                  suffix: InkWell(
                                    onTap: togglePasswordView,
                                    child: Icon(hidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Introduzca una contraseña';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 14.0),
                            SwitchListTile(
                              value: isRemember,
                              onChanged: (value) {
                                setState(() {
                                  isRemember = value;
                                });
                              },
                              title: Text('Recordar mis Datos'),
                            ),
                            SizedBox(height: 28.0),
                            ElevatedButton(
                                child: Text('Entrar'),
                                style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.white,
                                    primary: Colors.blue[800],
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 120)),
                                onPressed: () {
                                  if (validatedForm()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                }),
                          ],
                        )),
                    SizedBox(height: 20.0),
                    TextButton(
                      child: Text('Registrar Usuario'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => RegisterPage()));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  // void togglePasswordView() {
  //   setState(() {
  //     hidePassword = !hidePassword;
  //   });
  // }

  Widget _loginBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue[800]),
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Image.asset('assets/briefcase.png', width: 90.0),
            SizedBox(height: 20.0),
            Text(
              'Briefcase',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.white),
            )
          ],
        ));
  }

  bool validatedForm() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();

      return true;
    }

    return false;
  }

  void togglePasswordView() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}
