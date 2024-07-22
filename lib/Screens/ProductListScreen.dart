import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/Screens/ProductDetailScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'Home Page.dart';
import 'MyWhishListScreen.dart';
import 'PlaceHolders.dart';


class ProductListScreen extends StatefulWidget {
 final String listName;
 final int from;
   const ProductListScreen({Key? key, required this.listName, required this.from }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Map<dynamic,dynamic>> products_info= [];
  final databaseReference = FirebaseDatabase.instance.ref();
  final auth=FirebaseAuth.instance;
  List<Map<dynamic,dynamic>> allWishList=[];
  bool loadding=true;
  int? selectedOption;
  late String uid;

  @override
  void initState() {
    uid= auth.currentUser!.uid;
   _getProductsInfo();
   checkIfFavorite();
    super.initState();
  }

  Future<void> checkIfFavorite() async {
    allWishList.clear();
    String uid = auth.currentUser!.uid;
    final event = await databaseReference
        .child('Users Data')
        .child(uid)
        .child('WishList')
        .once(DatabaseEventType.value);

    print('checking called=======================================================================================================================================');
    if (event.snapshot.exists) {
      Map<dynamic,dynamic> items= event.snapshot.value as Map<dynamic,dynamic>;

      items.forEach((key, value) {
        allWishList.add(value);
      });
      print(allWishList.length);

    }
  }

  bool isfav( List<Map<dynamic,dynamic>> wishlist_info,Map<dynamic,dynamic> product ){

    for (var item in wishlist_info) {
      if (item['image'][0] == product['image'][0]) {
        return true;
      }
    }
    return false;
  }

  Future<void> _getProductsInfo([int? selectedOption ]) async {

    products_info.clear();
    final event=await databaseReference.child('All Products')
        .once(DatabaseEventType.value);
    if (event.snapshot.exists) {

      List<dynamic> values = event.snapshot.value as List<dynamic>;
      values.forEach((element) {
        if(widget.listName == element['category']){
          products_info.add(element);
        }else if(widget.listName == element['sub category']){
          products_info.add(element);
        }
      });
      setState(() {
        loadding=false;
      });
    }else{
      setState(() {
        loadding=false;
      });
      print('something wentrong');
    }
  }


  _filterProducts([int? selectedOption ]){

    if(selectedOption == 1){
      print('-------called');
      products_info.sort((a, b) {

        String a1= a['Price'].replaceAll(RegExp(","), '');
        String b1= b['Price'].replaceAll(RegExp(","), '');
        int productA =int.parse(a1.replaceAll(RegExp("₹"), ''));
        int productB =int.parse(b1.replaceAll(RegExp("₹"), ''));
        int priceA = productA;
        int priceB = productB;
        // Change the sign to sort in descending order (high to low)
        return priceB.compareTo(priceA);
      });
      setState(() {});
    }
    else if(selectedOption ==2){
      print('-------called2');
      products_info.sort((a, b) {

        String a1= a['Price'].replaceAll(RegExp(","), '');
        String b1= b['Price'].replaceAll(RegExp(","), '');
        int productA =int.parse(a1.replaceAll(RegExp("₹"), ''));
        int productB =int.parse(b1.replaceAll(RegExp("₹"), ''));
        int priceA = productA!;
        int priceB = productB!;
        // Change the sign to sort in descending order (high to low)
        return priceA.compareTo(priceB);

      });
      setState(() {});
    }
    else if(selectedOption ==3){
      products_info.sort((a, b) {
        String a1= a['Offer'].replaceAll(RegExp(","), '');
        String b1= b['Offer'].replaceAll(RegExp(","), '');
        int productA =int.parse(a['Offer'].replaceAll(RegExp("₹"), ''));
        int productB =int.parse(b['Offer'].replaceAll(RegExp("₹"), ''));
        int priceA = productA;
        int priceB = productB;
        // Change the sign to sort in descending order (high to low)
        return priceA.compareTo(priceB);
      },);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leadingWidth: 38,
        elevation: 0.5,
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(widget.listName,style: const TextStyle(
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

        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(
            Icons.search_outlined,
            color: Colors.blue,)),


          IconButton(onPressed: () {

          }, icon: const ImageIcon(
            AssetImage('assets/icons/heart_Icon.png'),
            color: Colors.red,
            size: 20,
          )),

          IconButton(onPressed: () {

          }, icon: const Icon(Icons.shopping_cart,
            color: Colors.purple,
            size: 20,)),
        ],
      ),

      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 50,
            titleSpacing: 0.0,
            elevation: 0.0,
            leadingWidth: 0.0,
            backgroundColor: Colors.white,
            shape: Border.all(width: 1,color: Colors.grey.shade400),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            right: BorderSide(color: Colors.black12)
                        )
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(),
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Sort', style: TextStyle(fontSize: 18)),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(Icons.close),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.black12,
                                      height: 2,
                                    ),
                                    RadioListTile<int>(
                                      title: const Text('Relevance'),
                                      value: 0,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = 0;
                                          print("Button value: $value");
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    RadioListTile<int>(
                                      title: const Text('Price (High to Low)'),
                                      value: 1,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value;
                                          _filterProducts(1);
                                          Navigator.pop(context);
                                          print("Button value: $selectedOption");
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    RadioListTile<int>(
                                      title: const Text('Price (Low to High)'),
                                      value: 2,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value;
                                          _filterProducts(selectedOption);
                                          Navigator.pop(context);
                                          print("Button value: $selectedOption");
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    RadioListTile<int>(
                                      title: const Text('Discount'),
                                      value: 3,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value;
                                          _filterProducts(selectedOption);
                                          Navigator.pop(context);
                                          print("Button value: $selectedOption");
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(AssetImage('assets/icons/sort.png'),
                              size: 16,
                              color: Colors.black),
                          SizedBox(width: 3,),
                          Text('Sort',style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.black12)
                        )
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage('assets/icons/category.png'),
                            size: 18,
                            color: Colors.black),
                        SizedBox(width: 3,),
                        Text('Category',style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.black12)
                        )
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage('assets/icons/category.png'),
                            size: 18,
                            color: Colors.black),

                        Text('Gender',style:TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                        )),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_list,
                            size: 18,
                            color: Colors.black ),
                        SizedBox(width: 3,),
                        Text('Filter',style:TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: loadding == false? (products_info !=null ?
            Container(
              color: Colors.grey.shade200,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 0.50,
                ),
                itemCount: products_info.length,
                itemBuilder: (context, index) {
                  final product = products_info[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                            products_info: products_info,
                            index: index),));
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
                                      FavoriteHeartIcon(
                                        size: 20,
                                        product: product,
                                        isFavorite: isfav(allWishList, product)
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
              ),
            ):
            const Center(
              child: Text('No Products',
                  style:TextStyle(
                      color: Colors.black
                  ) ),
            )):
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 0.72,
              ),
              itemCount:6,
              itemBuilder: (context, index) {

                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child:   const SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          BannerPlaceholder(height: 200, width: 200 ,),
                          TitlePlaceholder(width: 200),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
