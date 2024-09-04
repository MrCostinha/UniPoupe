import 'package:flutter/material.dart';
import 'package:unipoupe/src/util/validator.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  void _singup() {
    if (_formKey.currentState?.validate() ?? false) {
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final String confirmPassword = confirmPasswordController.text;

      // Lógica de autenticação aqui
      print('Name: $name');
      print('Email: $email');
      print('Password: $password');
      print('Confirm Password: $confirmPassword');
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
                  width: 315,
                  height: 50,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'name',
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8),
                          Icon(Icons.person),
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
                    validator: Validator.validateName,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
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
                SizedBox(height: 20),
                SizedBox(
                  width: 315,
                  height: 50,
                  child: TextFormField(
                    controller: confirmPasswordController,
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
                      labelText: 'confirmar senha',
                      suffixIcon: IconButton(
                        onPressed: confirmPasswordVisible
                            ? () =>
                                setState(() => confirmPasswordVisible = false)
                            : () =>
                                setState(() => confirmPasswordVisible = true),
                        icon: Icon(confirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    obscureText: confirmPasswordVisible,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000)),
                    validator: (value) => Validator.validateConfirmPassword(
                        _passwordController.text, value),
                  ),
                ),
                SizedBox(height: 35),
                SizedBox(
                  width: 315,
                  height: 45,
                  child: FloatingActionButton.extended(
                    onPressed: _singup,
                    backgroundColor: Color(0xFF690BA3),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    label: const Text(
                      'criar conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
