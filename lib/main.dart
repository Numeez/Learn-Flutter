import 'package:flutter/material.dart';

void main() {
  runApp(const MainScreenWithState());
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Sign up page"),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Enter email",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Enter your password",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class MainScreenWithState extends StatefulWidget {
  const MainScreenWithState({super.key});

  @override
  State<MainScreenWithState> createState() => _MainScreenWithStateState();
}

class _MainScreenWithStateState extends State<MainScreenWithState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const snackbar = SnackBar(content: Text("Text link clicked"));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Login page"),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        if (!emailRegex.hasMatch(text)) {
                          setState(() {
                            _validateEmail = true;
                          });
                        } else {
                          setState(() {
                            _validateEmail = false;
                          });
                        }
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter email",
                        border: const OutlineInputBorder(),
                        errorText:
                            _validateEmail ? "Enter a valid email" : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        if (!passwordRegex.hasMatch(text)) {
                          setState(() {
                            _validatePassword = true;
                          });
                        } else {
                          setState(() {
                            _validatePassword = false;
                          });
                        }
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Enter your password",
                          border: const OutlineInputBorder(),
                          errorText: _validatePassword
                              ? "Enter a strong password"
                              : null),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () {
                              if (!emailRegex.hasMatch(emailController.text)) {
                                setState(() {
                                  _validateEmail = true;
                                });
                              }
                              if (!passwordRegex
                                  .hasMatch(passwordController.text)) {
                                _validatePassword = true;
                              }
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))),
                  ),
                  Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          debugPrint("Text link pressed");

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
                        },
                        child: const Text(
                          "New user ? Sign up here",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
