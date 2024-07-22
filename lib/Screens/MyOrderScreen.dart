import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref();
  List<Map<dynamic,dynamic>> orderInfoList=[];
  bool active = false;
  String exTitle = "show more";

  Future<dynamic> _getOrderInfo()async {

    String uid= auth.currentUser!.uid;
    final event=await databaseReference.child('Users Data')
        .child(uid).child('Orders').once(DatabaseEventType.value);
    if (event.snapshot.exists) {

      Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {

        Map<dynamic, dynamic> d = value as Map<dynamic, dynamic>;

        setState(() {
          orderInfoList.add(d);
        });
      });
      print(orderInfoList.length);
      print('finished=============================================');
      return orderInfoList;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getOrderInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your Orders')),
        body: orderInfoList.isEmpty?  Center(
          child: Column(
            children: [
              Image.network(
                  'https://www.iconbunny.com/icons/media/catalog/product/1/0/1036.13-cancel-order-icon-iconbunny.jpg'),

              const Text(
                "You have no orders",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),

              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,

                ),
                onPressed: () {

                  for (var element in orderInfoList) {
                    print(element['Amount']);
                  }

                },
                child: const Text(
                  'Start Shopping',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: orderInfoList.length,
          itemBuilder: (context, index) {
            final product = orderInfoList[index];
            return

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.network(product['Product image']),
                        ),

                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Text(
                    //   product['Product brand'],
                    //   style: const TextStyle(
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 13),
                    // ),
                    const SizedBox(height: 10.0),
                    Text(
                      product['Product title'],
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),

                    SizedBox(

                      child: ExpansionPanelList(
                        elevation: 0,
                        expansionCallback: (panelIndex, isExpanded) {
                          active = !active;
                          if(exTitle=="show more")
                            exTitle="show less";
                          else
                            exTitle="show more";
                          setState(() {
                          });
                        },
                        children: [
                          ExpansionPanel(headerBuilder: (context, isExpanded) {
                            return  Text(exTitle,
                              style: const TextStyle(
                                color: Colors.black,
                              ),);
                          },

                              //
                              // 'Product brand':widget.product.brand,
                              // 'Product image':widget.product.image,
                              // 'Product brand':widget.product.description,
                              // 'Amount':total_amd,
                              // 'Quantity':Qnty,
                              // 'Name':name_ctr.text,
                              // 'Contact':contact_ctr.text,
                              // 'Address':address_ctr.text,
                              // // 'MOMT':selectedOption == 5 ? 'Cash on Delivery':'Online',
                              // 'Order Date':DateTime.now().toString(),
                              // 'Order Id':orderId,
                              // 'PaymentId':paymentId ==''?'Cash on Delivery':paymentId
                              body:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Order Details',
                                    style:  TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  Text(
                                    'Name: ${product['Name']} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Contact: ${product['Contact']} ',
                                    style: const TextStyle(
                                      fontSize: 15,),
                                  ),
                                  Text(
                                    'Address: ${product['Address']} items',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Quantity: ${product['Quantity']} items',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  Text(
                                    'Total Amount: ${product['Amount']} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  Text(
                                    'Order Id: ${product['Order Id']} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Payment Id: ${product['PaymentId']} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Order Date: ${product['Order Date']} ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              isExpanded: active,
                              canTapOnHeader: true)
                        ],
                      ),
                    ),
                    // const SizedBox(height: 8.0),
                    // Text(
                    //   '₹${widget.product.price}',
                    //   style: const TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16),
                    // ),
                    // const SizedBox(height: 8.0),
                    // Text(
                    //   widget.product.gender,
                    //   style: const TextStyle(
                    //       color: Colors.green,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 14),
                    // ),
                    // const SizedBox(height: 8.0),
                    // Text(widget.product.size.join(", ")),
                    // const SizedBox(height: 8.0),
                    // const Text(
                    //   "Description:",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15),
                    // ),
                    // const SizedBox(height: 8.0),
                    // Text(
                    //   widget.product.description,
                    //   style: const TextStyle(
                    //       fontSize: 13,
                    //       color: Colors.black54,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),

                  ],
                ),
              );

            //   GestureDetector(
            // onTap: () {
            //
            // },
            // child: ClipRRect(
            // borderRadius: BorderRadius.circular(4.0),
            // child: Container(
            // color: Colors.white,
            // padding: const EdgeInsets.all(8),
            // child: Row(
            // children: [
            // Image.network(
            // product['Product image'],
            // fit: BoxFit.fill,
            // height: 130,
            // ),
            // const SizedBox(
            // height: 8,
            // ),
            // Column(
            //   children: [
            //     SizedBox(
            //       height: 100,
            //       width: 200,
            //       child: Text(
            //       product['Product title'],
            //        maxLines: 5,
            //        softWrap: true,
            //       overflow: TextOverflow.visible,
            //       style: const TextStyle(
            //       color: Colors.black,
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     Row(
            //       children: [
            //         Text('Quantity:',style: TextStyle(
            //             fontWeight: FontWeight.bold
            //         ),),
            //         Text(
            //           product['Quantity'].toString(),
            //           // maxLines: 5,
            //           // softWrap: true,
            //           overflow: TextOverflow.visible,
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         SizedBox(width: 40,),
            //         Text('Amount:',style: TextStyle(
            //           fontWeight: FontWeight.bold
            //         ),),
            //         Text(
            //           product['Amount'].toString(),
            //           // maxLines: 5,
            //           // softWrap: true,
            //           overflow: TextOverflow.visible,
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // // Row(
            // //   mainAxisAlignment:
            // //   MainAxisAlignment.spaceBetween,
            // //   children: [
            // //     Text(
            // //       'Price:₹${product.price}',
            // //       style: const TextStyle(
            // //         color: Colors.green,
            // //         fontSize: 15,
            // //         fontWeight: FontWeight.bold,
            // //       ),
            // //     ),
            // //     FavoriteHeartIcon(
            // //       size: 20,
            // //       product: product,
            // //     ),
            // //     // Use the toggleable heart icon here
            // //   ],
            // // ),
            // ],
            // ),
            // ),
            // ),
            // );
          },
        )
    );
  }
}
