import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/home_screen.dart';
import 'login.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isShowPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Image.asset('assets/images/bvritlogo.png')),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: Text(
              "Create your account",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)),
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: password,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      icon: isShowPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  prefixIcon: Icon(Icons.lock)),
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: confirmPassword,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Re-enter password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      icon: isShowPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  prefixIcon: Icon(Icons.lock)),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color(0xff70CCFF),
                      Color(0xff0070AE),
                    ])),
                height: 70,
                width: width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email.text, password: password.text).then((value){
                             Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => true);
                          });
                     
                    },
                  ),
                )),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                children: <Widget>[
                  const Text('Already have account?'),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                          (route) => true);
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
