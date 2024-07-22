import 'dart:math';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/Screens/Home%20Page.dart';
import 'package:shopping_application/Screens/MyOrderScreen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class OrderPlacingScreen extends StatefulWidget {
  final Map<dynamic,dynamic> product;


  const OrderPlacingScreen({Key? key, required this.product,}) : super(key: key);

  @override
  State<OrderPlacingScreen> createState() => _OrderPlacingScreenState();
}


class _OrderPlacingScreenState extends State<OrderPlacingScreen> {

  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: 'order_placing_screen');
  int _currentStep = 0;
  int Qnty = 1;
  int product_amd=000;
  int total_amd=0000;
  int offer_amd=00;
  int? initoff;
  String title = 'Confirm Your Order';
  StepperType stepperType = StepperType.vertical;
  final name_ctr = TextEditingController();
  final address_ctr = TextEditingController();
  final contact_ctr = TextEditingController();
  String _name='',_contact='',_address='';
  int selectedOption=1;
  bool clicked = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {

      product_amd =int.parse(widget.product!['Price'].replaceAll(RegExp(r'[^0-9]'),''));
      initoff= (int.parse(widget.product!['Price'].replaceAll(RegExp(r'[^0-9]'),''))*20/100).round();
      offer_amd=initoff!;
      total_amd=product_amd-offer_amd;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar( title: Text(title)),
      body:clicked ? const Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator()
        ),
      ): SingleChildScrollView(
        child: Stepper(
          type: stepperType,
          physics: const ScrollPhysics(),
          currentStep: _currentStep,
          onStepTapped: (step) => tapped(step),
          onStepContinue:  continued,
          onStepCancel: cancel,
          steps: <Step>[
            Step(
              title: const Text('Address'),
              content: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onTap:null,
                      controller: name_ctr,
                      decoration: const InputDecoration(labelText: 'Name',
                          enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: contact_ctr ,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: 'Add contacts detail',
                          enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1)
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: address_ctr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(labelText: 'Add Address',
                          enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,width: 1)
                          )),
                    ),
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep >= 0 ?
              StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text('Order Summery'),
              content:

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: ImageSlideshow(
                        indicatorBackgroundColor: Colors.white,
                        indicatorColor: Colors.redAccent,
                        height: 300,
                        autoPlayInterval: 3000,
                        indicatorRadius: 4,
                        isLoop: true,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.network(widget.product!['image'][0]),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8),
                          //   child: Image.network(widget.product!.image2),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8),
                          //   child: Image.network(widget.product!.image3),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8),
                          //   child: Image.network(widget.product!.image4),
                          // ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0),
                  Text(
                    widget.product!['Title'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Special Price',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '₹${widget.product!['Price']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 8.0),
                  widget.product!['Offer'] != '0' &&
                      widget.product!['Offer'] != null ?
                  Text(
                    widget.product!['Offer'],
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ):const Visibility(
                      visible: false,
                      child: Text('')),
                  const SizedBox(height: 8.0),

                  // Text(widget.product!.size.join(", ")),
                  // const SizedBox(height: 8.0),
                  const Text(
                    "Product Details:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 8.0),

                  Text(
                    " ${widget.product!['Product Details'] ??widget.product!['ProductDetails'] ?? 'Empty' }",
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Add Quantity'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          IconButton(onPressed: () {
                            if(Qnty != 1){
                              setState(() {
                                --Qnty;
                                product_amd =product_amd! - int.parse(widget.product!['Price'].replaceAll(RegExp(r'[^0-9]'),''));
                                offer_amd = offer_amd - initoff!;
                                total_amd=product_amd-offer_amd;
                              });
                            }
                          }, icon: const Icon(Icons.remove,color: Colors.blue)),

                          SizedBox(height: 20,
                              child: Text('$Qnty')),
                          IconButton(onPressed: () {

                            setState(() {
                              ++Qnty;
                              product_amd  =product_amd! + int.parse(widget.product!['Price'].replaceAll(RegExp(r'[^0-9]'),''));
                              offer_amd = offer_amd + initoff!;
                              total_amd=product_amd-offer_amd;
                            });
                          }, icon: const Icon(Icons.add,color: Colors.blue,)),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Price Details',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Price ($Qnty items)'),
                            Text("₹${product_amd!}")
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Discount'),
                            Text('- ₹$offer_amd')
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivary Charge'),
                            Text('Free Delivary'),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Amount',style: TextStyle(
                                fontWeight: FontWeight.bold
                            )),
                            Text("₹${product_amd!-offer_amd}",style: const TextStyle(
                                fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        // Text('You will save ₹$offer_amd on this order',
                        //   style:const TextStyle(color: Colors.green,fontWeight: FontWeight.w600) ,)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep >= 1 ?
              StepState.complete : StepState.disabled,
            ),
            Step(
              title:  Text('Payments'),
              content: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text('UPI'),
                        ),
                        subtitle: const Text('Pay by any UPI app',
                            style: TextStyle(color: Colors.grey)),
                        leading: Radio(
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Wallet / Postpaid'),
                        leading: Radio(
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text('Credit / Debit /ATM Card'),
                        ),
                        subtitle: const Text('Add and secure your card as per RBI guidelines',
                            style: TextStyle(color: Colors.grey)),
                        leading: Radio(
                          value: 3,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text('Net Banking'),
                        ),
                        subtitle: const Text('This instrument has low success, use UPI or cards for better experience',
                            style: TextStyle(color: Colors.grey)),
                        leading: Radio(
                          value: 4,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Cash on Delivery'),
                        leading: Radio(
                          value: 5,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              isActive:_currentStep >= 0,
              state: _currentStep >= 2 ?
              StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }


  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued() async {
    if( _currentStep ==0){
      if(name_ctr.text != '' &&
          contact_ctr.text != ''
          && address_ctr.text != ''){

        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
        RegExp regExp =  RegExp(patttern);
        if (!regExp.hasMatch(contact_ctr.text)) {
          _showSnackbar('Enter valid mobile number! Ex:6357777666');
        }else{
          _currentStep < 2 ? setState(() => _currentStep += 1): null;
        }
      }else{
        _showSnackbar('Enter all field!');
      }
    }else if(_currentStep==1){
      _currentStep < 2 ? setState(() => _currentStep += 1): null;
    }else if(_currentStep==2){
      if(selectedOption == 5){
        setState(() {
          clicked=true;
        });
        String s = Random().nextInt(100).toString();
        _uploadOrderInfo(s, 'Cash on Delivery');
      }else{
        try{
          var options = {
            'key': 'rzp_test_gJ5RDPpZrsYBvg',
            'amount': 100,
            'order':{
              'id':'order_${Random().nextInt(100)}',
              'entity':'order',
              'amount':100,
              'amount_paid':0,
              'amount_due':0,
              'currency':'INR',
              'receipt':'Receipt #20',
              'status':'created'
            },
            'name': 'Riyadvi Shopping',
            'description':widget.product!['Product Details'] ,
            'timeout':120,
            'currency':'INR',
            'prefill': {
              'contact': '8888888888',
              'email': 'test@razorpay.com'
            }
          };
          var  _razorpay =Razorpay();
          _razorpay.open(options);
          _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
          _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
          _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
        }catch(e){
          _showSnackbar(e.toString());
        }
      }
      _currentStep < 2 ? setState(() => _currentStep += 1): null;
    }
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
  _showSnackbar(String content){
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(
      content: Text(content),padding: const EdgeInsets.only(right: 0,left: 0),
      duration: const Duration(seconds: 2),));
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) async{
    _uploadOrderInfo(response.orderId,response.paymentId).then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const HomePage(),), (route) => false);
    },);
    _showSnackbar('payment transaction Failed');
    print('payment transection sucesssssssss');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _showSnackbar('payment transaction Failed');
    print('payement transection Failedddddddd');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _showSnackbar('payment transaction Failed');
    print('payement wallet transection Failedddddddd');
  }

  Future<void>_uploadOrderInfo(String? orderId, String? paymentId) async {
    String uid= auth.currentUser!.uid;

      await databaseReference.child('Users Data').child(uid).child('Orders').child(orderId!)
          .set({'Product title':widget.product!['Title'],
        'Product brand':'',
        'Product image':widget. product!['image'][0],
        'Product Description':widget.product!['ProductDetails']??widget.product!['Product Details'],
        'Amount':total_amd,
        'Quantity':Qnty,
        'Name':name_ctr.text,
        'Contact':contact_ctr.text,
        'Address':address_ctr.text,
        // 'MOMT':selectedOption == 5 ? 'Cash on Delivery':'Online',
        'Order Date':DateTime.now().toString(),
        'Order Id':orderId,
        'PaymentId':paymentId ==''?'Cash on Delivery':paymentId
      }).then((value) {
        _showSnackbar('Order placed');
        setState(() {
          clicked = false;
        });
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder:(context) =>  const MyOrderScreen()), (route) => false);
      },);


  }
}
