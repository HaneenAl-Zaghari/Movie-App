import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isvisable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05,
          ),
          child: Column(
            children: [
              const Text(
                'Create new account',
                textScaleFactor: 2.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              const Text(
                'Please fill the form to continue',
                textScaleFactor: 1.6,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .125,
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
                  controller: _userName,
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
                  horizontal: MediaQuery.of(context).size.width * .1,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 42, 52),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      bool isValid = EmailValidator.validate(value);
                      if (!isValid) {
                        return 'Enter Valid Email!';
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email',
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                height: MediaQuery.of(context).size.height * .125,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 85, 104, 254),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      textScaleFactor: 2.2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ('Have an Account?'),
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign In',
                      textScaleFactor: 1.3,
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
