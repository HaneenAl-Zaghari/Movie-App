import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';
import 'package:movie_app/services/login_services.dart';
import 'package:movie_app/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isvisable = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .17,
              ),
              const Text(
                'Welcome Back!',
                textScaleFactor: 2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              const Text(
                'Please Sign in to your account',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .09,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 42, 52),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextFormField(
                  controller: _username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: MediaQuery.of(context).size.width * .055,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .09,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .06,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 42, 52),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: ListTile(
                  title: TextFormField(
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: MediaQuery.of(context).size.width * .055,
                      ),
                    ),
                    obscureText: isvisable,
                  ),
                  trailing: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isvisable = !isvisable;
                      });
                    },
                    child: const Icon(
                      Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 85, 104, 254),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      textScaleFactor: 2,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * .1,
                      thickness: 2,
                      endIndent: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  const Text(
                    'OR',
                    textScaleFactor: 2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * .1,
                      thickness: 2,
                      indent: MediaQuery.of(context).size.width * .03,
                    ),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final provider =
                      Provider.of<SignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                      ),
                      child: ListTile(
                        leading: Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png'),
                        title: const Text(
                          'Sign In With Google',
                          textScaleFactor: 1.8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ('''Don't have Account?'''),
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                      // till back-end finished
                    },
                    child: const Text(
                      'Sign Up',
                      textScaleFactor: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
