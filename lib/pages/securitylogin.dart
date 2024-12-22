import 'package:flutter/material.dart';
import 'package:sbce_visitors/pages/securitynavbar.dart';

class Security extends StatefulWidget {
  Security({super.key});

  @override
  State<Security> createState() => _AddState();
}

class _AddState extends State<Security> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          foregroundColor: Colors.white,
          title: Text("Security Login")),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers_outlined),
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    String username = usernameController.text;
                    String password = passwordController.text;

                    if (username == 'sbce' && password == 'sbce123') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecMenu()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Invalid Credentials"),
                          content: Text(
                              "The username or password you entered is incorrect."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text("LOGIN", style: TextStyle(fontSize: 25)),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
