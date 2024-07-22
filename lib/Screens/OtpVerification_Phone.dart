import 'package:circle_progress_bar/circle_progress_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shopping_application/Screens/Home%20Page.dart';



class PinputExample extends StatefulWidget {

  final String? Number;
  final String? email;
  final int mobile;
  const PinputExample({Key? key,  this.Number,  this.email, required this.mobile}) : super(key: key);


  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  //String? _verificationCode;
  FirebaseAuth auth = FirebaseAuth.instance;
  var receivedID = '';
  bool pinIsIncorrect=false;
  bool clicked = false;

  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    //emailAuth!.config(remoteServerConfiguration);
    verifyUserPhoneNumber();
  }


  void verifyUserPhoneNumber() async {

      auth.verifyPhoneNumber(
        phoneNumber:'+91${widget.Number}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then(
                (value) {
              print('Logged In Successfully');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
            },
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          setState(() {
            pinIsIncorrect=true;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          receivedID = verificationId;
          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(
            content: Center(child: Text('we sent OTP, check your Inbox')),
            duration: Duration(seconds: 3),backgroundColor: Colors.blue,));
          //otpFieldVisibility = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          receivedID = verificationId;
          setState(() {});
        },
      );
  }

  Future<void> verifyOTPCode(BuildContext context) async {

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID,
        smsCode: pinController.text,
      );
      await auth
          .signInWithCredential(credential)
          .then((value) async {
        if(value.user!.uid != null){
          print("hhhhhhhhhh${value.credential}");
          print('Received Id--$receivedID');
          print('User Login In Successful------------------');
          String uid= auth.currentUser!.uid;
          await databaseReference.child('Users Data').child(uid).set({'Ph':widget.Number}).then((value) {
            print('user data updated sucess');
          },);
          setState(() {
            clicked=false;
          });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder:
                  (context) => const HomePage(),), (route) => false);
        }else
        {
          print('Received Id--$receivedID');
          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(
            content: Text('Something went wrong...'),
            duration: Duration(seconds: 3),backgroundColor: Colors.red,));

          setState(() {
            pinIsIncorrect=true;
          });
          print('User Login In Failed------------------');
        }
      });

  }


  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 433336,
      height: 46,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Scaffold(
      body:  clicked ? Center(
        child: SizedBox(
          height: 240,
          width: 240,
          child: CircleProgressBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            value:1.0,
            child: _dragonCircle(),
          ),
        ),
      ): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/riyadvilogo.png',
                    width: 60,
                    height: 60),
                const Text('Riyadvi_shopping',
                  style:TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20) ,)
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text('Verifying: +91${widget.Number}',
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                listenForMultipleSmsOnAndroid: true,
                // onSubmitted: (pin) async {
                //   try{
                //      await FirebaseAuth.instance.signInWithCredential
                //        (PhoneAuthProvider.credential(
                //          verificationId: _verificationCode!,
                //          smsCode: pin)).then((value){
                //            if(value.user != null){
                //              Navigator.of(context).
                //              push(MaterialPageRoute(builder: (context) => AllCategories(),));
                //            }
                //      });
                //   }catch(e){
                //     FocusScope.of(context).unfocus();
                //     ScaffoldMessenger.of(context).
                //     showSnackBar(const SnackBar(
                //         content: Text('Invalid OTP'),
                //         duration: Duration(seconds: 3),));
                //
                //   }
                // },
                defaultPinTheme: defaultPinTheme,
                length: 6,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {

                  print('Received ID:$pinIsIncorrect');
                  return null ;
                },
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   pinController.setText(value);
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                // onChanged: (value) {
                //   debugPrint('onChanged: $value');
                // },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              focusNode.unfocus();
              setState(() {
                clicked=true;
              });
              verifyOTPCode(context).onError((error, stackTrace) {
                setState(() {
                  clicked=false;
                });
                ScaffoldMessenger.of(context).
                showSnackBar( SnackBar(
                  content: Text(error!.toString()),
                  duration: const Duration(seconds: 3),));
              },);
              // if(pinIsIncorrect == true){
              //   ScaffoldMessenger.of(context).
              //   showSnackBar(const SnackBar(
              //     content: Text('Something went wrong...'),
              //     duration: Duration(seconds: 3),));
              // }
            },
            child: const Text('Validate'),
          ),
        ],
      ),
    );
  }

  Widget _dragonCircle() {
    const innerMargin = 4;
    const double strokeWidth = 2;
    const Color backgroundColor = Colors.greenAccent;

    final innerLayout = Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(innerMargin + strokeWidth),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/riyadvilogo.png'),
          const Text(
            'please wait',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    return innerLayout;
  }
}
