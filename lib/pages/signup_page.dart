import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _confirmPassword;

  void _validateAndSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Implemente a lógica de cadastro aqui, como salvar o email e a senha no banco de dados.
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
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
                  keyboardType: TextInputType.emailAddress,
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    if (_password != null && value != _password) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                  onSaved: (value) => _confirmPassword = value,
                  decoration: const InputDecoration(
                      hintText: "Confirmar senha",
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
                  child: Text('Cadastrar'),
                  onPressed: _validateAndSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}