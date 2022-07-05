import 'package:flutter/material.dart';
import 'login.dart';
class reset extends StatefulWidget {
  const reset({ Key? key }) : super(key: key);

  @override
  _resetState createState() => _resetState();
}

class _resetState extends State<reset> {
   bool isShowPassword = true;
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
              "Reset your password",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(height:height*0.15),
          Container(
            decoration: BoxDecoration(),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: isShowPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Old Password',
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
              obscureText: isShowPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New password',
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
              obscureText: isShowPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm password',
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
          SizedBox(height:height*0.08),
          Align(
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color(0xff70CCFF),
                      Color(0xff0070AE),
                    ])),
                height: height * 0.1,
                width: width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    child: const Text('Save'),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                          (route) => true);
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}