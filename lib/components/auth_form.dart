import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _subimt() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_formData.isSignup)
                  TextFormField(
                    key: const ValueKey('Name'),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                TextFormField(
                  key: const ValueKey('E-mail'),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                ),
                TextFormField(
                  key: const ValueKey('Senha'),
                  initialValue: _formData.password,
                  onChanged: (password) => _formData.password = password,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: _subimt,
                  child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
                ),
                TextButton(
                  child: Text(_formData.isLogin
                      ? 'Criar uma nova Conta?'
                      : 'Já possui conta?'),
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
