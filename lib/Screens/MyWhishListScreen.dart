import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'ProductDetailScreen.dart';

class MyWhishListScreen extends StatefulWidget {
  const MyWhishListScreen({Key? key}) : super(key: key);

  @override
  State<MyWhishListScreen> createState() => _MyWhishListScreenState();
}

class _MyWhishListScreenState extends State<MyWhishListScreen> {

  final databaseReferance= FirebaseDatabase.instance.ref();
  final auth = FirebaseAuth.instance;
  List<Map<dynamic,dynamic>> allWishList=[];
 
  late String uid;
  bool loading = true;

  Future<void> removeFromWishList(Map<dynamic,dynamic> product) async {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orange,
          content: Text(
            'Product removed from wishlist!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      );


    String uid = auth.currentUser!.uid;
    final event = await databaseReferance
        .child('Users Data')
        .child(uid)
        .child('WishList')
        .once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        Map<dynamic, dynamic> d = value as Map<dynamic, dynamic>;

        if(value['image'][0] == product['image'][0]){
          databaseReferance
              .child('Users Data')
              .child(uid)
              .child('WishList')
              .child(key).remove();
        }
      });
    }
  }

  Future<List<Map<dynamic,dynamic>>> getWishlistItems() async {
print('valledddddddddddddddd');

    final event=await databaseReferance.child('Users Data').
    child(uid).child('WishList').once(DatabaseEventType.value);


    if (event.snapshot.exists) {
      allWishList.clear();
      Map<dynamic,dynamic> values = event.snapshot.value as Map<dynamic,dynamic>;
       values.forEach((key,value) {
         Map<dynamic, dynamic> d = value as Map<dynamic, dynamic>;
         setState(() {
           allWishList.add(d);
         });
         print('compleddddddddddddddddddddddddddddddddddddddddddddddddddddd');
       });
    }else{
      print('something went rong');
    }
    setState(() {
      loading = false;
    });
      return allWishList;
  }

  @override
  void initState() {
    uid= auth.currentUser!.uid;
    getWishlistItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: 50.0,
          width: 130.0,
        ),
      ),
      body:
      allWishList != null? GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 0.50,
                ),
                itemCount: allWishList.length,
                itemBuilder: (context, index) {
                  final product = allWishList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                            products_info: allWishList,
                            index: index,fromSim: true),));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.network(
                              product['image'][0].toString(),
                              fit: BoxFit.fill,
                              height: 240,
                              width:  size.width*0.45,
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              product['Title'].toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.
                              symmetric(horizontal: 5.0,vertical: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${product['Price']}',
                                          style:const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      const SizedBox(width: 10,),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Free Delivery',style: TextStyle(
                                          fontSize: 12
                                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {

                            setState(() {
                              allWishList.removeAt(index);
                            });
                            removeFromWishList(product);
                            // print(widget.isFavorite);
                          },
                          child: const Icon(
                           Icons.favorite ,
                            color:  Colors.red
                            ,size: 20,
                          ),
                        ),
                      ),
                                    ],
                                  ),
                                  // Use the toggleable heart icon here
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ): loading == false && allWishList == null ?
      Center(
                child: Column(
                  children: [
                    Image.network('https://img.freepik.com/premium-vector/heart-with-plus-positive-sign-wishlist-charity-element_598264-338.jpg'),
                    const Text(
                      'Wishlist is Empty !',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ],
                ),
              ):const Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}

