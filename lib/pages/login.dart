import 'package:ecommerceflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading=true;
    });
    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    if(isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future<FirebaseUser> handleSignIn() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    Fluttertoast.showToast(msg: "Signed In as: ${user.displayName}");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset("images/loginbackground.jpg", fit: BoxFit.cover, width: double.infinity,),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset("images/logo.png"),
            width: 550.0,
            height: 200.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          icon: Icon(Icons.email),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
            child: FlatButton(
              color: Colors.red.shade900,
              onPressed: (){
                handleSignIn();
              },
              child: Text("Sign-in / Sign-up with Google", style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
    );
  }
}


