import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shopping_application/Screens/OrderPlacingScreen.dart';
import 'package:photo_view/photo_view.dart';
import 'CartScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  final List<Map<dynamic,dynamic>> products_info;
  final bool? fromSim;
  final int index;

  const ProductDetailScreen({Key? key, required this.products_info, required this.index, this.fromSim}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  Future<void> addToWishlist() async {

  }


  Future<void> addToCart() async {

  }

  List<Widget> _imageList() {
    List<dynamic> _images = widget.products_info![widget.index!]['image'];
    List<Widget> imageWidgets = [];

    for (int i = 0; i < _images.length; i++) {
      imageWidgets.add(
        Padding(
          padding: const EdgeInsets.all(8),
          child: PhotoView(
            imageProvider: NetworkImage(_images[i]),
            backgroundDecoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    return imageWidgets;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leadingWidth: 38,
        elevation: 0.5,
        title: const Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Text('Product Details',style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          )),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.arrow_back_ios_rounded,
            color:Colors.black ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                    children: _imageList(),
                  ),
                ),
              ),

              const SizedBox(height: 10.0),
              Text(
                widget.products_info![widget.index!]['Title'],
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
                '₹${widget.products_info![widget.index!]['Price']}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 8.0),
              widget.products_info![widget.index!]['Offer'] != '0' &&
                  widget.products_info![widget.index!]['Offer'] != null ?
              Text(
                widget.products_info![widget.index!]['Offer'],
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
                " ${widget.products_info![widget.index!]['Product Details'] ??widget.products_info![widget.index!]['ProductDetails'] ?? 'Empty' }",
                // "${widget.products_info![widget.index!]['Product Details'][1]}\n"
                // "${widget.products_info![widget.index!]['Product Details'][2]}\n"
                // "${widget.products_info![widget.index!]['Product Details'][3]}\n"
                // "${widget.products_info![widget.index!]['Product Details'][4]}\n"
                // "${widget.products_info![widget.index!]['Product Details'][5]}\n"
                // "${widget.products_info![widget.index!]['Product Details'][6]}\n"
                // "${widget.products_info![widget.index!]['Product Details'][7]}\n",
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   widget.products_info![widget.index!]['Product Details']['Kurta Fabric'],
              //   style: const TextStyle(
              //       fontSize: 13,
              //       color: Colors.black54,
              //       fontWeight: FontWeight.bold),
              // ),




              // const SizedBox(height: 18.0),
              // Row(
              //   children: [
              //     Card(
              //       child: TextButton(
              //         onPressed: () {
              //           _showBottomSheet(context);
              //         },
              //         style: ButtonStyle(
              //           foregroundColor:
              //               MaterialStateProperty.all<Color>(Colors.black),
              //         ),
              //         child: const Text(
              //           'Available Offers',
              //           style: TextStyle(fontSize: 16),
              //         ),
              //       ),
              //     ),
              //     Card(
              //       child: TextButton(
              //         onPressed: () {
              //           scratchDialog(context);
              //         },
              //         style: ButtonStyle(
              //           foregroundColor:
              //               MaterialStateProperty.all<Color>(Colors.black),
              //         ),
              //         child: const Text(
              //           'Coupons',
              //           style: TextStyle(fontSize: 16),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await addToCart();
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.orange,
                              content: Center(
                                child: Column(
                                  children: [
                                    const Text(
                                      'Product added to cart!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      child: const Text(
                                        'Go To Cart',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                const CartScreen()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        widget.products_info![widget.index!]['Offer'] !='0' ? Colors.green : Colors.orange,
                      ),
                      child: Text(
                        widget.products_info![widget.index!]['Offer'] != '0' ? 'Product Added' : 'Add to Cart',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) =>OrderPlacingScreen(product: widget.products_info![widget.index!]),));
                        // try{
                        //   var options = {
                        //     'key': 'rzp_test_gJ5RDPpZrsYBvg',
                        //     'amount': 100,
                        //     'order':{
                        //       'id':'order_${Random().nextInt(100)}',
                        //       'entity':'order',
                        //       'amount':100,
                        //       'amount_paid':0,
                        //       'amount_due':0,
                        //       'courrency':'INR',
                        //       'receipt':'Receipt #20',
                        //       'status':'created'
                        //     },
                        //     'name': 'Riyadvi Shopping',
                        //     'description': widget.product.description,
                        //     'timeout':120,
                        //     'currency':'INR',
                        //     'prefill': {
                        //       'contact': '8888888888',
                        //       'email': 'test@razorpay.com'
                        //     }
                        //   };
                        //
                        //   var  _razorpay =Razorpay();
                        //
                        //   _razorpay.open(options);
                        //
                        //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
                        //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
                        //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
                        //
                        // }catch(e){
                        //   showAlertDialog(context, e.toString());
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12.0),
              //     image: const DecorationImage(
              //         image: NetworkImage(
              //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3BujfUSNxyBdrNZ6l229V_HqC0EGmqV_1vA&usqp=CAU"),
              //         fit: BoxFit.cover),
              //   ),
              //   // child: Padding(
              //   //   padding: const EdgeInsets.all(8.0),
              //   //   child: Row(
              //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //     children: [
              //   //       const Text(
              //   //         'Featured on Flipkart',
              //   //         style: TextStyle(
              //   //             fontWeight: FontWeight.w700,
              //   //             fontSize: 16.0,
              //   //             color: Colors.black),
              //   //       ),
              //   //       InkWell(
              //   //         onTap: () {},
              //   //         child: Container(
              //   //           height: 40,
              //   //           width: 80,
              //   //           decoration: BoxDecoration(
              //   //             color: Colors.yellow,
              //   //             borderRadius: BorderRadius.circular(12.0),
              //   //           ),
              //   //           child: const Center(
              //   //             child: Text(
              //   //               'View All',
              //   //               style: TextStyle(fontWeight: FontWeight.w500),
              //   //             ),
              //   //           ),
              //   //         ),
              //   //       )
              //   //     ],
              //   //   ),
              //   // ),
              // ),
              // const GroceryOfferSlider(),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: widget.fromSim==true ? false:true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS02DJlJLkYiNZ-VGuLU_5aAzoZNpoKfcBxYw&usqp=CAU"),
                        fit: BoxFit.cover),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Similar Products',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     height: 40,
                        //     width: 80,
                        //     decoration: BoxDecoration(
                        //       color: Colors.yellow,
                        //       borderRadius: BorderRadius.circular(12.0),
                        //     ),
                        //     child: const Center(
                        //       child: Text(
                        //         'View All',
                        //         style: TextStyle(fontWeight: FontWeight.w500),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Visibility(
                visible: widget.fromSim==true ? false:true,
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                    products_info: widget.products_info!,index: widget.index,
                                    fromSim:true
                                )),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Container(
                            color: Colors.white,
                            width: 100,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.network(
                                  widget.products_info![index]['image'][0] ??
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                                  fit: BoxFit.fill,
                                  height: 100,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.products_info[index]['Title'] ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹${widget.products_info?[index]['Price'] ?? ""}",
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.products_info?.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
