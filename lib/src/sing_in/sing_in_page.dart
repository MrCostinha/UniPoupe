import 'package:flutter/material.dart';
import 'package:unipoupe/src/util/validator.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;

  final _formKey = GlobalKey<FormState>();

  void _singin() {
    if (_formKey.currentState?.validate() ?? false) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      // Lógica de autenticação aqui
      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        children: [
          Image.asset('assets/images/logo_cheia.png'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  // Container para o TextField do e-mail
                  width: 315,
                  height: 50,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'e-mail',
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8),
                          Icon(Icons.email),
                          Container(
                            width: 1,
                            height: 28,
                            color: Colors.grey,
                            margin: EdgeInsets.only(left: 8, right: 8),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000)),
                    validator: Validator.validateEmail,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  // Container para o TextField da senha
                  width: 315,
                  height: 50,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8),
                          Icon(Icons.lock),
                          Container(
                            width: 1,
                            height: 28,
                            color: Colors.grey,
                            margin: EdgeInsets.only(left: 8, right: 8),
                          ),
                        ],
                      ),
                      labelText: 'senha',
                      suffixIcon: IconButton(
                        onPressed: passwordVisible
                            ? () => setState(() => passwordVisible = false)
                            : () => setState(() => passwordVisible = true),
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    obscureText: passwordVisible,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000)),
                    validator: Validator.validatePassword,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 190,
                height: 41,
                child: TextButton(
                  onPressed: () {
                    // Lógica para redirecionar o usuário aqui
                  },
                  child: Text(
                    'esqueceu a senha?',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 153,
                height: 45,
                child: FloatingActionButton.extended(
                  onPressed: _singin,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xFF000000)),
                  ),
                  label: const Text(
                    'entrar',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 315,
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/linha.png'),
                    Expanded(
                      child: Center(
                        child: Text(
                          'ou',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Image.asset('assets/images/linha.png'),
                  ],
                ),
              ),
              SizedBox(
                width: 315,
                height: 45,
                child: FloatingActionButton.extended(
                  onPressed: _singin,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xFF000000)),
                  ),
                  label: const Text(
                    'criar conta',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
