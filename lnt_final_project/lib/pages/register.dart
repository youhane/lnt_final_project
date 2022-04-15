import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/home.dart';
import 'package:lnt_final_project/pages/login.dart';
import 'package:lnt_final_project/utils/flutterfire.dart';


class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _bimbelIDController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                 padding: const EdgeInsets.only(top: 45),
                 child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                  ),
              ),
               ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _bimbelIDController,
                  decoration: InputDecoration(
                    labelText: 'Bimbel ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Bimbel Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _passwordConfirmController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate = await RegisterAccount(context, _bimbelIDController.text, _emailController.text, _nameController.text, _passwordController.text);
                    if(shouldNavigate){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                    );
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}