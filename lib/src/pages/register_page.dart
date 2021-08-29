import 'package:briefcase/src/pages/home_page.dart';
import 'package:briefcase/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
              Text('Registro de Usuario',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic)),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          labelText: 'Nombre',
                          hintText: 'Joe Doe'),
                    ),
                    SizedBox(height: 22.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.alternate_email,
                            color: Colors.blue,
                          ),
                          labelText: 'Correo Electronico',
                          hintText: 'ejemplo@ejemplo.com'),
                    ),
                    SizedBox(height: 22.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // obscureText: hideShowPass,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          labelText: 'Contraseña'),
                    ),
                    SizedBox(height: 28.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // obscureText: hideShowPass,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          labelText: 'Confirmar Contraseña'),
                    ),
                    SizedBox(height: 28.0),
                    ElevatedButton(
                        child: Text('Registrarse'),
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.blue[800],
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 120)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }),
                    SizedBox(height: 20.0),
                    TextButton(
                      child: Text('Iniciar Sesion'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => LoginPage()));
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
}
