import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:shopping_application/Screens/CategoriesScreen.dart';
import 'package:shopping_application/Screens/MyOrderScreen.dart';
import 'package:shopping_application/Screens/ProductDetailScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'CartScreen.dart';
import 'MyWhishListScreen.dart';
import 'NotificationScreen.dart';
import 'PlaceHolders.dart';
import 'ProductListScreen.dart';
import 'ProfileScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final databaseReference = FirebaseDatabase.instance.ref();
  final auth=FirebaseAuth.instance;

  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  GlobalKey<ScaffoldState>? _scaffoldKey;
  List<Map<dynamic,dynamic>> products_info= [];
  List<Map<dynamic,dynamic>> wishlist_info= [];
  bool loadding=true;
  int badgeCount = 0;
  List<String>? _searchedData;
  final TextEditingController _searchController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> suggestions = ['shirts for men','sarees',
    'tshirts for women', 'sheos', 'jeans','kurties','lehengas',
    'tshirts for men','electronics',"toys for kids",
    'bikes','furniture','accessories','grocery','products for home','medicine',
    'mobiles','nutritions','sports','track pants'];

  @override
  void initState() {
    _getProductsInfo();
    checkIfFavorite();
    //_uploaddata();
    super.initState();
  }

  Future<void> checkIfFavorite() async {
    wishlist_info.clear();
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
        wishlist_info.add(value);
      });
      print(wishlist_info.length);

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


  void _searchProducts() {
    print('called00000');
    String data=_searchController.text.toLowerCase();
    // if( data == 'shirts for men' || data == 'shirts'||
    //     data == 'jeans'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => topoffers(),));
    // }else if(data == 'tshirts for women' || data == 'shirts for women'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => const WomenScreen(),));
    // }else if(data == 'sarees'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => const SareesScreen(),));
    // }else if(data == 'sheos'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  ShoesScreen(),));
    // }else if(data == 'jeans'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  topoffers(),));
    // }else if(data == 'kurties'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  KurtisScreen(),));
    // }else if(data == 'lehengas'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  LehengasScreen(),));
    // }
    // else if(data == 'electronics'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  ElectronicsScreen(),));
    // } else if(data == 'toys for kids'||data == 'toys'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  ToysScreen(),));
    // }
    // else if(data == 'bikes'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  BikesScreen(),));
    // } else if(data == 'furniture'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  FurnitureScreen(),));
    // } else if(data == 'accessories'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  AccessoriesScreen(),));
    // } else if(data == 'grocery'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  GroceryScreen(),));
    // } else if(data == 'products for home'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  HomeScreen(),));
    // } else if(data == 'medicine'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  HomeScreen(),));
    // }
    // else if(data == 'mobiles'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  MobileScreen(),));
    // } else if(data == 'nutritions'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  NutritionsScreen(),));
    // } else if(data == 'sports'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) =>  SportsScreen(),));
    // }
    // else if(data == 'track pants'){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => topoffers(),));
    // }else{
    //   ScaffoldMessenger.of(context).showSnackBar
    //     (const SnackBar(content:
    //   Text('This time we do not have Products For your search'),
    //     duration: Duration(seconds: 4),));
    // }
    // _searchedData = searchList
    //     .where((element) => element.key!.toLowerCase().contains(
    //           _searchController.text.toLowerCase(),
    //         ))
    //     .map((e) => ProductList.fromJson(json.decode(e.data!)))
    //     .toList();
    // setState(() {
    //   _isFromSearch = true;
    // });
  }
  Widget _mediumSpacing() {
    return const SizedBox(
      height: 16,
    );
  }
  _create_List( Size size){
    print('created');

    if( products_info != null){
      if(products_info != null){
      return  SliverToBoxAdapter(
        child:  Container(
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                          products_info: products_info,index: index,)));
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
                                                  const SizedBox(height: 5,),
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
                                                          isFavorite: isfav(wishlist_info, product)
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
                            ),
                          ) ,
      );
      
    }else {
      return const SliverToBoxAdapter(
        child: Center(
         child:  Text('No Data Found'),
        )
      );
    }
    }else{
      return SliverToBoxAdapter(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 0.72,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {

            return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child:  const SingleChildScrollView(
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
      );
    }
  }
  Future<void> _getProductsInfo() async {
    print('called');
    products_info.clear();
    final event=await databaseReference.child('All Products')
        .once(DatabaseEventType.value);
    if (event.snapshot.exists) {
      List<dynamic> values = event.snapshot.value as List<dynamic>;
      values.forEach((element) {
        products_info.add(element);
        print('-------------------------------');
      });
      if(mounted){
        setState(() {
          loadding=false;
        });
      }

  }else{
      if(mounted){
        setState(() {
          loadding=false;
        });
      }
      print('something went rong');
    }
  }
//   _uploaddata() async {
//     print('called');
//   await databaseReference.child('Products').
//   set('testing').then((value) {
//     print('completed------------------------------');
//   },);
// }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(

      child: Scaffold(

        bottomSheet: const BottomSheetContainer(),
        body: RefreshIndicator(

          onRefresh: () {

            return Future.delayed(const Duration(seconds: 3),(){
              print('refresh');
            });
          },
          child: CustomScrollView(
              slivers: <Widget>[
                 SliverToBoxAdapter(
                  child:SizedBox(
                    width: size.width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0,bottom: 5,left: 18),
                          child: Text('Riyadvi_shopping',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                          )),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyWhishListScreen()));
                            }, icon: const ImageIcon(
                              AssetImage('assets/icons/heart_Icon.png'),
                              color: Colors.red,
                              size: 20,
                            )),

                            IconButton(onPressed: () {

                            },
                                icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.purple,
                              size: 20,)),

                          ],
                        ),

                      ],
                    ),
                  ) ,
                ),
                 SliverAppBar(
                  floating: false,
                  pinned: true,
                   elevation: 0.0,
                   forceElevated: false,
                   titleSpacing: 10,
                   toolbarHeight: 65,
                   title: Padding(
                     padding: const EdgeInsets.only(bottom: 5.0,top: 5),
                     child: SizedBox(
                       height: 45,
                       child: AutoCompleteTextField<String>(
                         key: key,

                         clearOnSubmit: false,
                         suggestions: suggestions,
                         controller: _searchController,
                         decoration: InputDecoration(
                             hintText: 'Search by Category...',
                             contentPadding: const EdgeInsets.all(5),
                             border:  const OutlineInputBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(15)),
                                 borderSide: BorderSide(
                                     color: Colors.black12,
                                     width: 5,
                                 )),
                             suffixIcon: GestureDetector(
                                 onTap: () {
                                     _searchProducts();
                                 },
                                 child: const Icon( Icons.search))
                         ),
                         itemFilter: (String suggestion, String query) {
                           return suggestion.toLowerCase().startsWith(query.toLowerCase());
                         },
                         itemSorter: (String a, String b) {
                           return a.compareTo(b);
                         },
                         itemSubmitted: (String item) {
                           setState(() {
                             _searchController.text = item;
                           });
                         },
                         itemBuilder: (BuildContext context, String suggestion) {
                           return ListTile(
                             title: Text(suggestion),
                           );
                         },
                       ),
                     ),
                   ),
                  backgroundColor: Colors.white,
                ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const MenuStripe(),
                    _mediumSpacing(),
                    const OfferSlider(),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Products For You',
                               style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

                 SliverAppBar(
                  pinned: true,
                  toolbarHeight: 50,
                  titleSpacing: 0.0,
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                    shape: Border.all(width: 1,color: Colors.black12),
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
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage('assets/icons/sort.png'),
                                    size: 18,
                                    color: Colors.black54),
                                SizedBox(width: 3,),
                                Text('Sort',style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
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
                                    color: Colors.black54),
                                SizedBox(width: 3,),
                                Text('Category',style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
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
                                color: Colors.black54),

                                Text('Gender',style:TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
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
                                   color: Colors.black54 ),
                                SizedBox(width: 3,),
                                Text('Filter',style:TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),

                _create_List(size)

              ]
          ),
        ),

        // RefreshIndicator(
        //   onRefresh:  () {
        //     return Future.delayed(
        //       const Duration(seconds: 3),
        //           () {
        //         print('refreshed');
        //       },
        //     );
        //   },
        //   child: SingleChildScrollView(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //
        //             const MenuStripe(),
        //             _mediumSpacing(),
        //             const OfferSlider(),
        //             _mediumSpacing(),
        //
        //
        //             Column(
        //               children: [
        //                 Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(12.0),
        //                     //color: Colors.grey.shade300
        //                     image: const DecorationImage(
        //                         image: NetworkImage(
        //                             "https://media.istockphoto.com/id/1262617201/vector/butterflies-flying-from-the-indian-tricolour-flag-hoisted-by-a-person-an-indian-independence.jpg?s=612x612&w=0&k=20&c=ZDljC2ZPQ7e3GcghutWvbUD4-ByFpARs2ryVG23Ofrg="),
        //                         fit: BoxFit.cover),
        //                   ),
        //                   child:  const Padding(
        //                     padding: EdgeInsets.all(12.0),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text(
        //                           'Products For You',
        //                           style: TextStyle(
        //                               fontWeight: FontWeight.w700,
        //                               fontSize: 16.0,
        //                               color: Colors.black),
        //                         ),
        //                         Stack(
        //                             alignment: Alignment.center,
        //                             children: [
        //                               Icon(Icons.circle, color: Colors.blue, size: 30),
        //                               Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,),
        //                             ])
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 const SizedBox(
        //                   height: 16,
        //                 ),
        //
        //                 loadding == false? (products_info !=null ?
        //
        //                 Container(
        //                   color: Colors.grey.shade200,
        //                   child: GridView.builder(
        //                     physics: const NeverScrollableScrollPhysics(),
        //                     shrinkWrap: true,
        //                     gridDelegate:
        //                     const SliverGridDelegateWithFixedCrossAxisCount(
        //                       crossAxisCount: 2,
        //                       crossAxisSpacing: 2.0,
        //                       mainAxisSpacing: 2.0,
        //                       childAspectRatio: 0.50,
        //                     ),
        //                     itemCount: products_info.length,
        //                     itemBuilder: (context, index) {
        //                       final product = products_info[index];
        //                       return GestureDetector(
        //                         onTap: () {
        //                           Navigator.push(context, MaterialPageRoute(
        //                             builder: (context) => ProductDetailScreen()));
        //                         },
        //                         child: ClipRRect(
        //                           borderRadius: BorderRadius.circular(4.0),
        //                           child: Container(
        //                             color: Colors.white,
        //                             padding: const EdgeInsets.all(8),
        //                             child: Column(
        //                               children: [
        //
        //                                 Image.network(
        //                                   product['image'][0].toString(),
        //                                   fit: BoxFit.fill,
        //                                   height: 240,
        //                                   width:  size.width*0.45,
        //                                 ),
        //                                 const SizedBox(height: 8,),
        //                                 Text(
        //                                   product['Title'].toString(),
        //                                   maxLines: 2,
        //                                   overflow: TextOverflow.ellipsis,
        //                                   style: const TextStyle(
        //                                       color: Colors.black,
        //                                       fontSize: 14,
        //                                       fontWeight: FontWeight.w400),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.
        //                                   symmetric(horizontal: 5.0,vertical: 5),
        //                                   child: Column(
        //                                     children: [
        //                                       Row(
        //                                         children: [
        //                                           Text(
        //                                               '${product['Price']}',
        //                                               style:const TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize: 15,
        //                                                 fontWeight: FontWeight.bold,
        //                                               )
        //                                           ),
        //                                           const SizedBox(width: 10,),
        //
        //                                         ],
        //                                       ),
        //                                       SizedBox(height: 5,),
        //
        //                                       const SizedBox(
        //                                         width: 10,
        //                                       ),
        //                                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                         children: [
        //                                           const Text('Free Delivery',style: TextStyle(
        //                                               fontSize: 12
        //                                           )),
        //                                           FavoriteHeartIcon(
        //                                             size: 20,
        //                                             product: product,
        //
        //                                           ),
        //                                         ],
        //                                       ),
        //                                       // Use the toggleable heart icon here
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ):
        //                 const Center(
        //                   child: Text('No Products '),
        //                 )):
        //                 GridView.builder(
        //                   physics: const NeverScrollableScrollPhysics(),
        //                   shrinkWrap: true,
        //                   gridDelegate:
        //                   const SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     crossAxisSpacing: 2.0,
        //                     mainAxisSpacing: 2.0,
        //                     childAspectRatio: 0.72,
        //                   ),
        //                   itemCount: 6,
        //                   itemBuilder: (context, index) {
        //
        //                     return Shimmer.fromColors(
        //                         baseColor: Colors.grey.shade300,
        //                         highlightColor: Colors.grey.shade100,
        //                         enabled: true,
        //                         child:  const SingleChildScrollView(
        //                           physics: NeverScrollableScrollPhysics(),
        //                           child: Column(
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: [
        //                               BannerPlaceholder(height: 200, width: 200 ,),
        //                               TitlePlaceholder(width: 200),
        //                               SizedBox(height: 16.0),
        //                             ],
        //                           ),
        //                         ));
        //                   },
        //                 ),
        //
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //               ],
        //             ),
        //           ]
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}


class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const HomePage()));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Colors.blue,

                ),
                Text('Home',style: TextStyle(
                  color: Colors.black87,
                    fontWeight: FontWeight.w100
                ),)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoriesScreen()),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.grid_view,
                  color: Colors.black45,

                ),
                Text('Categories',style: TextStyle(
                    color: Colors.black45,fontWeight: FontWeight.w100
                ),)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyOrderScreen()),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_box_outlined,
                  color: Colors.black45,
                ),
                Text('My Orders',style: TextStyle(
                    color: Colors.black45,fontWeight: FontWeight.w100
                ),)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.live_help_outlined,
                  color: Colors.black26,
                ),
                Text('Help',style: TextStyle(
                    color: Colors.black45,fontWeight: FontWeight.w100
                ),)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black26,
                ),
                Text('Account',style: TextStyle(
                    color: Colors.black45,fontWeight: FontWeight.w100
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MenuStripe extends StatelessWidget {
  const MenuStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: const BoxDecoration(color: Colors.white),
      child: GridView.count(
        padding: const EdgeInsets.only(top: 5,bottom: 5),
        crossAxisCount: 1,
        childAspectRatio: 0.7,
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                border: Border.all(width: 1,color: Colors.blue.shade900)),
                child:  Center(
                  child: Icon(
                    Icons.apps_rounded,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              const Text(
                'All Categories',
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => 
                      const ProductListScreen(listName: 'Women Ethnic', from: 1,)));
            },
            child: const MenuStripeItem(
              imageUrl: 'assets/images/women_ethnic.jpg',
              itemLabel: 'Women Ethnic',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Women Western',
                    from: 1,

                  )));
            },
            child: const MenuStripeItem(
              imageUrl: 'assets/images/women_western.webp',
              itemLabel: 'Women Western',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Men', from: 1,
                  )));
            },
            child: const MenuStripeItem(
              imageUrl: 'assets/images/men.jpg',
              itemLabel: 'Men',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Kids', from: 1,
                  )));
            },
            child: const MenuStripeItem(
              imageUrl: 'assets/images/kids.jpg',
              itemLabel: 'Kids',
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Home & Kitchen',
                    from: 1,
                  )));
            },
            child: const MenuStripeItem(
              itemLabel: 'Home & Kitchen',
              imageUrl: 'assets/images/home.jpg',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Bags & Footwear',
                    from: 1,

                  )));
            },
            child: const MenuStripeItem(
              itemLabel: 'Bags & Footwear',
              imageUrl: 'assets/images/Bags & Footwear.jpg',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Jewellery & Accessories',
                    from: 1,
                  )));
            },
            child: const MenuStripeItem(
              itemLabel: 'Jewellery & Accs',
              imageUrl: 'assets/images/Jewellery & Accessories.jpg',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Beauty & Health', from: 1,


                  )));
            },
            child: const MenuStripeItem(
              itemLabel: 'Beauty & Health',
              imageUrl: 'assets/images/Beauty & Health.jpg',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Mobile & Accessories', from: 1,
                  )));
            },
            child: const MenuStripeItem(
              itemLabel: 'Mobiles',
              imageUrl: 'assets/images/mobiles.jpg',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen(
                    listName: 'Electronics', from: 1,

                  )));
            },
            child: const MenuStripeItem(
              itemLabel: 'Electronics',
              imageUrl: 'assets/images/Electronics.png',
            ),
          ),
        ],
      ),
    );
  }
}

class MenuStripeItem extends StatelessWidget {
  final String? imageUrl;
  final String? itemLabel;

  const MenuStripeItem({super.key, this.imageUrl, this.itemLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:DecorationImage(image: AssetImage(imageUrl!),alignment: Alignment.center,
              fit: BoxFit.fitHeight,) ,
              border: Border.all(color:Colors.blue.shade900 )),

        ),
        Text(
          itemLabel ?? "Top Offers",
          style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
    fontSize: 10.0),
        ),
      ],
    );
  }
}

class OfferSlider extends StatelessWidget {
  const OfferSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.6,
        scrollDirection: Axis.horizontal,
        children: const [
          OfferSliderItem(),
          OfferSliderItem1(
              imageUrl:
              "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/d6c2c00726dda91d.png?q=20"),
          OfferSliderItem(),
          OfferSliderItem1(
            imageUrl:
            "https://gumlet.assettype.com/afaqs%2F2022-06%2Fa43ee35b-18cb-4c7f-ac17-63c14a79207f%2FAlia_Bhatt_Flipkart_Fashion_EOSS.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
          ),
        ],
      ),
    );
  }
}

class OfferSliderItem extends StatelessWidget {
  final String? imageUrl;
  final String? offerLabel;
  final String? offerPercentage;

  const OfferSliderItem(
      {super.key, this.imageUrl, this.offerLabel, this.offerPercentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(
                  imageUrl ??
                      "https://images.unsplash.com/photo-1522198734915-76c764a8454d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: Image.asset(
                        'assets/images/loader.webp',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offerLabel ??
                    "Computers Bestsellers \n Laptops,Printers,Monitors",
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 30,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Center(
                    child: Text(
                      offerPercentage ?? "30-70% OFF",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                  color: Colors.yellow,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "No Cost EMI Durability Certified",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class OfferSliderItem1 extends StatelessWidget {
  final String? imageUrl;

  const OfferSliderItem1({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                    imageUrl ??
                        "https://images.unsplash.com/photo-1522198734915-76c764a8454d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}


class FavoriteHeartIcon extends StatefulWidget {
  final double size;
  final Map<dynamic, dynamic> product;
  final bool isFavorite;

  const FavoriteHeartIcon({
    Key? key,
    required this.size,
    required this.product,
    required this.isFavorite,
  }) : super(key: key);

  @override
  _FavoriteHeartIconState createState() => _FavoriteHeartIconState();
}

class _FavoriteHeartIconState extends State<FavoriteHeartIcon> {
  bool isFavorite = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    checkIsFav();
    super.initState();
  }

  checkIsFav() {
    if (mounted) {
      setState(() {
        isFavorite = widget.isFavorite;
      });
    }
  }

  Future<void> addToWishList() async {
    String uid = auth.currentUser!.uid;
    await databaseReference
        .child('Users Data')
        .child(uid)
        .child('WishList')
        .push()
        .set(widget.product);

    if (!isFavorite) {
      setState(() {
        isFavorite = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: Center(
            child: Column(
              children: [
                const Text(
                  'Product added to whish list!',
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
                    'Go To My Wishlist',
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
                            const MyWhishListScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      );

      // Update isFavorite without setState
      // Show a success message (SnackBar) if needed.
    }
  }

  Future<void> removeFromWishList() async {

    if (isFavorite) {
      setState(() {
        isFavorite = false;
      });
       // Update isFavorite without setState
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
    }

    String uid = auth.currentUser!.uid;
    final event = await databaseReference
        .child('Users Data')
        .child(uid)
        .child('WishList')
        .once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        Map<dynamic, dynamic> d = value as Map<dynamic, dynamic>;

        if(value['image'][0] == widget.product['image'][0]){
          databaseReference
              .child('Users Data')
              .child(uid)
              .child('WishList')
              .child(key).remove();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
         // print(widget.isFavorite);
          if (!isFavorite) {
            addToWishList();
          } else {
            removeFromWishList();
          }
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
          color: isFavorite ? Colors.red : Colors.grey,
          size: widget.size,
        ),
      ),
    );
  }
}



// class FavoriteHeartIcon extends StatefulWidget {
//   final double size;
//   final Map<dynamic, dynamic> product;
//
//   const FavoriteHeartIcon({
//     super.key,
//     required this.size,
//     required this.product,
//   });
//
//   @override
//   _FavoriteHeartIconState createState() => _FavoriteHeartIconState();
// }
//
// class _FavoriteHeartIconState extends State<FavoriteHeartIcon> {
//   bool isFavorite = false;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final databaseReference = FirebaseDatabase.instance.ref();
//
//
//
//   Future<void> addToCart() async {
//
//     String uid= auth.currentUser!.uid;
//     await databaseReference.child('Users Data').child(uid).child('WishList').push()
//         .set(widget.product);
//
//   }
//
//   Future<void> removeItem()async {
//    print('removed');
//    setState(() {
//      isFavorite = false;
//    });
//   }
//
//   Future<List<Map<dynamic,dynamic>>> getWishlistItems() async {
//     String uid= auth.currentUser!.uid;
//     final event=await databaseReference.child('Users Data').
//     child(uid).child('WishList').once(DatabaseEventType.value);
//
//
//     if (event.snapshot.exists) {
//
//       Map<dynamic,dynamic> values = event.snapshot.value as Map<dynamic,dynamic>;
//       values.forEach((key,value) {
//         Map<dynamic, dynamic> d = value as Map<dynamic, dynamic>;
//
//         if(widget.product == value){
//           setState(() {
//             isFavorite = true;
//           });
//         }
//
//       });
//
//     }else{
//       print('something went rong');
//     }
//     return [];
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () async {
//
//           if (!isFavorite) {
//             await addToCart().whenComplete(() {
//
//
//               if (mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: Colors.orange,
//                     content: Center(
//                       child: Column(
//                         children: [
//                           const Text(
//                             'Product added to whish list!',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           TextButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                             ),
//                             child: const Text(
//                               'Go To My Wishlist',
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder:
//                                           (BuildContext context) =>
//                                       const MyWhishListScreen()));
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             },);
//
//           } else {
//
//             removeItem();
//           }
//         },
//         child: Icon(
//           isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
//           color: isFavorite ? Colors.red : Colors.grey,
//           size: widget.size,
//         ),
//       ),
//     );
//   }
// }