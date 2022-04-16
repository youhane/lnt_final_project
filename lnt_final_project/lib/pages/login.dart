import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/counter.dart';
import 'package:lnt_final_project/pages/register.dart';
import 'package:lnt_final_project/utils/flutterfire.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Counter(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                  onPressed: () async {
                    bool shouldNavigate = await LoginUser(context, _emailController.text, _passwordController.text);
        
                    if (shouldNavigate) {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}