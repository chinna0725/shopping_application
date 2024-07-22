import 'package:flutter/material.dart';
import 'LoginEmail.dart';
import 'OtpVerification_Phone.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  _LoginMobileState createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {

  final _phoneController = TextEditingController();
  final _countryCode ='+91';


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _onContinueButtonPressed() async {
    String mobileNumber = _phoneController.text.trim();
    if (mobileNumber.isEmpty) {
      _showSnackBar("Please enter a 10-digit mobile number.");
      return;
    }else if (mobileNumber.length != 10) {
      _showSnackBar("Please enter a valid 10-digit mobile number.");
      return;
    }else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PinputExample(Number:mobileNumber, mobile: 0,)));
    }

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('isLoggedIn', true);

    // Navigator.popUntil(context, (route) => route.isFirst);
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const AllCategories()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.blue,
            elevation: 0,
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
                        const Text("Enter your phone number to continue"),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          decoration: InputDecoration(
                              labelText: "Phone Number",
                              labelStyle: TextStyle(color: Colors.blue[900]),
                              border: const OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (value.length != 10) {
                              return 'Please enter a valid 10-digit phone number';
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
                                        const LoginEmail()));
                              },
                              child: const Text(
                                'Use Email-ID',
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
                            text: "By continuing, you agree to Riyadvi_Shopping's ",
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: MaterialButton(
                        onPressed: _onContinueButtonPressed,
                        color: Colors.orange,
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
