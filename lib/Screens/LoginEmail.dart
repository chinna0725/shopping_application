import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//import 'package:riyadvi_shopping/Services/API_handler.dart';
import 'LoginMobile.dart';


class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> with WidgetsBindingObserver {
  final _emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // bool? _success;
  // String? _userEmail;
  // String? _userID;

  @override
  void didChangeDependencies() {
    //APIHandler.getAllProducts();
    super.didChangeDependencies();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future signInWithEmailandLink(userEmail)async{
    var _userEmail=userEmail;
    return await _auth.sendSignInLinkToEmail(
        email: _userEmail,
        actionCodeSettings: ActionCodeSettings(
          url: "https://riyadvishopping.page.link/oym1/",
          handleCodeInApp: true,
          androidPackageName:"com.example.riyadvi_shopping",
          androidMinimumVersion: "1",
        )
    ).then((value){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
              Text("Click the varification link that we sent to your email"),
              duration: Duration(seconds: 5)));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    try {
      FirebaseDynamicLinks.instance.onLink;
      final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance
          .getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        print(deepLink.userInfo);
      }
    } catch (e) {
      print(e);
    }
    // void handleLink(Uri link, userEmail) async {
    //   if (link != null) {
    //     print(userEmail);
    //     final UserCredential user = await FirebaseAuth.instance
    //         .signInWithEmailLink(
    //       email: userEmail,
    //       emailLink: link.toString(),
    //     );
    //     if (user != null) {
    //       print(user.credential);
    //     }
    //   } else {
    //     print("link is null");
    //   }
    // }
  }


  // var acs = ActionCodeSettings(
  //   // URL you want to redirect back to. The domain (www.example.com) for this
  //   // URL must be whitelisted in the Firebase Console.
  //     url: 'https://www.example.com/finishSignUp?cartId=1234',
  //     // This must be true
  //     handleCodeInApp: true,
  //     iOSBundleId: 'com.example.ios',
  //     androidPackageName: 'com.example.android',
  //     // installIfNotAvailable
  //     androidInstallApp: true,
  //     // minimumVersion
  //     androidMinimumVersion: '1');


//   var emailAuth = 'someemail@domain.com';
//   FirebaseAuth.instance.sendSignInLinkToEmail(
//   email: emailAuth, actionCodeSettings: acs)
//       .catchError((onError) => print('Error sending email verification $onError'))
//       .then((value) => print('Successfully sent email verification'));
// });


  // Future<UserCredential> _signInWithEmailAndLink() async {
  //   _userEmail = _emailController.text;
  //   return await _auth.signInWithEmailLink(
  //     email: _userEmail!,
  //     emailLink: '',
  //     // url: 'https://flutterauth.page.link/',
  //     // handleCodeInApp: true,
  //     // iOSBundleID: 'com.google.firebase.flutterauth',
  //     // androidPackageName: 'com.google.firebase.flutterauth',
  //     // androidInstallIfNotAvailable: true,
  //     // androidMinimumVersion: "1",
  //   );
  // }

  Future<void> _onContinueButtonPressed() async {
    String email = _emailController.text.trim();
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty) {
      _showSnackBar("Please enter your email address.");
      return;
    }else if (!emailRegExp.hasMatch(email)) {
      _showSnackBar("Please enter a valid email address");
      return;
    }else{
      signInWithEmailandLink(email);
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
            title: const Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Riyadvi_Shopping",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            centerTitle: true,
          ),
          body: Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            elevation: 15.0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Login for better experience",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text("Enter your Email ID to continue"),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.blue[900]),
                              border: const OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const LoginMobile()));
                              },
                              child: const Text(
                                'Use Phone Number',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text.rich(
                          TextSpan(
                            text: "By continuing,you agree to Riyadvi_Shopping's ",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            children: [
                              TextSpan(
                                text: "Terms of use",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: MaterialButton(
                        onPressed: _onContinueButtonPressed,
                        color: Colors.orange,
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}


