import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:formapp/repository/AuthService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _validateAndLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Implemente a lógica de autenticação aqui, como verificar o email e a senha no banco de dados.
      if (!result.isNull){
        Navigator.pushNamed(context, '/home');
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email ou senha inválido')));
      }
    }
    //return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  onSaved: (value) => _email = value,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Por favor, insira um e-mail válido';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      fillColor: Color.fromARGB(22, 68, 137, 255),
                      filled: true,
                      prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'A senha deve ter pelo menos 5 caracteres';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Senha",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      fillColor: Color.fromARGB(22, 68, 137, 255),
                      filled: true,
                      prefixIcon: Icon(Icons.password_outlined)),
                      obscureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: Text('Entrar'),
                  onPressed: _validateAndLogin,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  child: Text('Cadastrar-se'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}