import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
            
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter username',
                    labelText: 'Username'
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    print('Hi, friends!');
                  },
                  /* style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.white
                    )
                  ) */
                )
              ],
            ),
          )
        ],
      )
    );
  }
}