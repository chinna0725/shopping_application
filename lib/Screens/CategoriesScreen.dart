import 'package:flutter/material.dart';
import 'package:shopping_application/Screens/ProductDetailScreen.dart';
import 'package:shopping_application/Screens/ProductListScreen.dart';



class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  var womenEthnic_key1 = GlobalKey();
  var womenWester_key1 = GlobalKey();
  var Men_key1 = GlobalKey();
  var Kids_key1 = GlobalKey();
  var homeKitchen_key1 = GlobalKey();
  var beauty_key1 = GlobalKey();
  var jewelleryAccessories_key1 = GlobalKey();
  var bagsFootwear_key1 = GlobalKey();
  var mobileAccessories_key1 = GlobalKey();
  var Electronics_key1 = GlobalKey();

  var womenEthnic_key2 = GlobalKey();
  var womenWester_key2 = GlobalKey();
  var Men_key2 = GlobalKey();
  var Kids_key2 = GlobalKey();
  var homeKitchen_key2 = GlobalKey();
  var beauty_key2 = GlobalKey();
  var jewelleryAccessories_key2 = GlobalKey();
  var bagsFootwear_key2 = GlobalKey();
  var mobileAccessories_key2 = GlobalKey();
  var Electronics_key2 = GlobalKey();

  var _mainIsSelected =1;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leadingWidth: 35,
        elevation: 0.5,
        title: const Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Text('CATEGORIES',style: TextStyle(
            color: Colors.black,
            fontSize: 16
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

          }, icon: const Icon(Icons.search_outlined,color: Colors.blue,)),


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
      body: Row(
        children: [
          Container(
            width: size.width * 0.25,
            height: size.height,
            color: Colors.blueGrey.shade50,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      
                      setState(() {
                        _mainIsSelected=1;
                      });
                      Scrollable.ensureVisible(womenEthnic_key2.currentContext!);
                      
                    },
                    child: Container(
                      height: 100,
                      key: womenEthnic_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                        color:_mainIsSelected ==1? Colors.white70 :null,
                          border: const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        imageUrl: 'assets/images/women_ethnic.jpg',
                        itemLabel: 'Women Ethnic',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=2;
                      });
                      Scrollable.ensureVisible(womenWester_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: womenWester_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==2? Colors.white70 :null,
                          border:const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        imageUrl:'assets/images/women_western.webp',
                        itemLabel:'Women Western',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=3;
                      });
                      Scrollable.ensureVisible(Men_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: Men_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==3? Colors.white70 :null,
                          border: const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        imageUrl: 'assets/images/men.jpg',
                        itemLabel: 'Men',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=4;
                      });
                      Scrollable.ensureVisible(Kids_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: Kids_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==4? Colors.white70 :null,
                          border:const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        imageUrl: 'assets/images/kids.jpg',
                        itemLabel: 'Kids',
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=5;
                      });
                      Scrollable.ensureVisible(homeKitchen_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: homeKitchen_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==5? Colors.white70 :null,
                          border: const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        itemLabel: 'Home & Kitchen',
                        imageUrl: 'assets/images/home.jpg',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=6;
                      });
                      Scrollable.ensureVisible(bagsFootwear_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: bagsFootwear_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==6? Colors.white70 :null,
                          border: const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        itemLabel: 'Bags & Footwear',
                        imageUrl: 'assets/images/Bags & Footwear.jpg',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=7;
                      });
                      Scrollable.ensureVisible(jewelleryAccessories_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: jewelleryAccessories_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==7? Colors.white70 :null,
                          border: const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        itemLabel: 'Jewellery & Accs',
                        imageUrl: 'assets/images/Jewellery & Accessories.jpg',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=8;
                      });
                      Scrollable.ensureVisible(beauty_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: beauty_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==8? Colors.white70 :null,
                          border: const Border(
                              bottom: BorderSide(
                                  color: Colors.black26
                              )
                          )),
                      child: const MenuStripeItem(
                        itemLabel: 'Beauty & Health',
                        imageUrl: 'assets/images/Beauty & Health.jpg',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=9;
                      });
                      Scrollable.ensureVisible(mobileAccessories_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: mobileAccessories_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                          color:_mainIsSelected ==9? Colors.white70 :null,
                        border: const Border(
                            bottom: BorderSide(
                                color: Colors.black26
                            )
                        )),
                      child: const MenuStripeItem(
                        itemLabel: 'Mobiles',
                        imageUrl: 'assets/images/mobiles.jpg',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _mainIsSelected=10;
                      });
                      Scrollable.ensureVisible(Electronics_key2.currentContext!);
                    },
                    child: Container(
                      height: 100,
                      key: Electronics_key1,
                      width: size.width * 0.25,
                      decoration:  BoxDecoration(
                        color:_mainIsSelected ==10? Colors.white70 :null,
                        border: const Border(
                            bottom: BorderSide(
                                color: Colors.black26
                            )
                        ),
                      ),
                      child: const MenuStripeItem(
                        itemLabel: 'Electronics',
                        imageUrl: 'assets/images/Electronics.png',
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width*0.75,
            height: size.height,

            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Women Ethnic',
                          key: womenEthnic_key2,
                          style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                      )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:200,

                    child: GridView.count(
                        crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProductListScreen(
                                      listName: 'Women Ethnic',
                                      from: 1),));

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      image:AssetImage('assets/images/subcategory/all_womenEthnics.jpg')
                                      ,alignment: Alignment.center,
                                      fit: BoxFit.fitHeight,) ,
                                    //border: Border.all(color:Colors.blue.shade900 )
                                ),
                              ),
                              const Text(
                                "All",
                                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProductListScreen(
                                      listName: 'sarees',
                                      from: 2),));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      image:AssetImage('assets/images/subcategory/SilkSarees.jpg')
                                      ,alignment: Alignment.center,
                                      fit: BoxFit.fitHeight,) ,
                                ),
                              ),
                              const Text(
                                "Sarees",
                                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (context) => const ProductListScreen(
                      //               listName: 'Cotton Silk Sarees',
                      //               from: 2),));
                      //   },
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         height: 45,
                      //         width: 45,
                      //         decoration: const BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             image:DecorationImage(
                      //               image:AssetImage('assets/images/subcategory/cotton silk sarees.jpg')
                      //               ,alignment: Alignment.center,
                      //               fit: BoxFit.fitHeight,) ,
                      //             ),
                      //       ),
                      //       const Text(
                      //         "Cotton Silk Sarees",
                      //         style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   )
                      // ),
                      // InkWell(
                      //     onTap: () {
                      //       Navigator.of(context).push(
                      //           MaterialPageRoute(
                      //             builder: (context) => const ProductListScreen(
                      //                 listName: 'Anarkali Kurtis',
                      //                 from: 2),));
                      //     },
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Container(
                      //           height: 45,
                      //           width: 45,
                      //           decoration: const BoxDecoration(
                      //               shape: BoxShape.circle,
                      //               image:DecorationImage(
                      //                 image:AssetImage('assets/images/subcategory/Anarkali Kurtis.jpg')
                      //                 ,alignment: Alignment.center,
                      //                 fit: BoxFit.fitHeight,) ,
                      //               ),
                      //         ),
                      //         const Text(
                      //           "Anarkali Kurtis",
                      //           style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                      //         ),
                      //       ],
                      //     )
                      // ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProductListScreen(
                                      listName: 'kurtis',
                                      from: 2),));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      image:AssetImage('assets/images/subcategory/Cotton Kurtis.jpg')
                                      ,alignment: Alignment.center,
                                      fit: BoxFit.fitHeight,) ,
                                  ),
                              ),
                              const Text(
                                "Kurtis",
                                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProductListScreen(
                                      listName: 'Blouses',
                                      from: 2),));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      image:AssetImage('assets/images/subcategory/Blouses.jpg')
                                      ,alignment: Alignment.center,
                                      fit: BoxFit.fitHeight,) ,
                                  ),
                              ),
                              const Text(
                                "Blouses",
                                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProductListScreen(
                                      listName: 'Dupattas',
                                      from: 2),));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      image:AssetImage('assets/images/subcategory/Dupattas.jpg')
                                      ,alignment: Alignment.center,
                                      fit: BoxFit.fitHeight,) ,
                                    ),
                              ),
                              const Text(
                                "Dupattas",
                                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProductListScreen(
                                      listName: 'Lehangas',
                                      from: 2),));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      image:AssetImage('assets/images/subcategory/Lehengas.jpg')
                                      ,alignment: Alignment.center,
                                      fit: BoxFit.fitHeight,) ,
                                    ),
                              ),
                              const Text(
                                "Lehengas",
                                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                      ),
                    ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Women Western',
                          key:womenWester_key2,
                          style:     const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,

                    //color: Colors.black38,
                    child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Women Western',
                                        from: 1),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/all_womenWestern.png')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "All",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Tops',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Tops.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Tops",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Dresses',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage("assets/images/subcategory/Dresses.jpg",)
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Dresses",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Sweaters',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage("assets/images/subcategory/women_sweaters.jpg",)
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Women Sweaters",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                      ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Men',
                          key:Men_key2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,

                    child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Men',
                                        from: 1),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/all_men.png')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "All",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Tshirts',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/men_Tshirts.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "T-Shirts",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Shirts',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/men_shirts.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Shirts",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Track Pants',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/men_TrackPants.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Track Pants",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Jeans',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/men_Jeans.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Jeans",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),

                      ],),
                  ),


                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Kids',
                          key:Kids_key2,
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,

                    child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Kids',
                                        from: 1),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/all_kids.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                               ),
                                ),
                                const Text(
                                  "All",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Dresses_Kids',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Dresses_kids.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                ),
                                ),
                                const Text(
                                  "Dresses",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Rompers',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Rompers.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Rompers",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Toys',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Soft_Toys.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Soft Toys",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Footwear',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Footwear kids.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                    ),
                                ),
                                const Text(
                                  "Footwear",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Stationery',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Stationery.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Stationery",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Watches',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Watches kids.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Watches",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Bags & Backpacks',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Bags_Backpacks kids.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Bags & Backpacks",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'All Baby Care',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/All_Baby_Care.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "All Baby Care",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),


                      ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Home & Kitchen',
                          key:homeKitchen_key2,
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400,

                    child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Home & Kitchen',
                                        from: 1),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/all_home.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "All",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Bedsheets',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Bedsheets.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                    ),
                                ),
                                const Text(
                                  "Bedsheets",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Doormats',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Doormats.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                   ),
                                ),
                                const Text(
                                  "Doormats",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Curtains & Sheers',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Curtains_Sheers.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Curtains & Sheers",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Cushions & Cushion Covers',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Cushions_CushionCovers.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Cushions & Covers",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Mattress Protectors',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Mattress_Protectors.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                    ),
                                ),
                                const Text(
                                  "Mattress Protectors",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Stickers',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Stickers.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Stickers",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Clocks',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Clocks.png')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Clocks",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Showpieces',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Showpieces.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                ),
                                ),
                                const Text(
                                  "Showpieces",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'All Home Decor',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/AllHomeDecor.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "All Home Decor",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Kitchen Storage',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Kitchen_Storage.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Kitchen & Storage",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Cookware & Bakeware',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Cookware_Bakeware.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Cookware & Bakeware",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),

                      ],),
                  ),
               //   Beauty & Health



                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Bags & Footwear',
                          key:bagsFootwear_key2,
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,

                    child: GridView.count(
                      crossAxisCount: 3,

                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Handbags',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Handbags.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                   ),
                                ),
                                const Text(
                                  "Handbags",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Clutches',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Clutches.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                   ),
                                ),
                                const Text(
                                  "Clutches",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Slingbags',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Slingbags.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Slingbags",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Women Backpacks',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/WomenBackpacks.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Women Backpacks",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Men Backpacks',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/MenBackpacks.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                 ),
                                ),
                                const Text(
                                  "Men Backpacks",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Men Wallets',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/MenWallets.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Men Wallets",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Sports Shoes',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/SportsShoes.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Sports Shoes",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),

                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:(context) => const ProductListScreen(
                                        listName: 'Casual Shoes',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/CasualShoes.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Casual Shoes",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Formal Shoes',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/FormalShoes.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Formal Shoes",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Sandals',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Sandals.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Sandals",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Flats',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Flats.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Flats",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Bellies',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Bellies.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,),
                                     ),
                                ),
                                const Text(
                                  "Bellies",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Juttis',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Juttis.webp')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Juttis",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                      ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Jewellery & Accs',
                          key:jewelleryAccessories_key2,
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,

                    child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Jewellery Set',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/JewellerySet.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Jewellery Set",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Earrings',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Earrings.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,),
                                      ),
                                ),
                                const Text(
                                  "Earrings",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Mangalsutras',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Mangalsutras.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Mangalsutras",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Studs',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Studs.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Studs",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Bangles',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Bangles.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Bangles",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Necklaces',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Necklaces.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Necklaces",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),


                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Rings',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:const DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Rings.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      border: Border.all(color:Colors.blue.shade900 )),
                                ),
                                const Text(
                                  "Rings",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Anklets',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Anklets.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                    ),
                                ),
                                const Text(
                                  "Anklets",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Women Watches',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/WomenWatches.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Women Watches",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Hair Accessories',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/HairAccessories.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Hair Accessories",
                                  style: TextStyle(fontSize:10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Sunglasses',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Sunglasses.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Sunglasses",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Socks',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Socks.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Socks",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),

                      ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Beauty & Health',
                          key:beauty_key2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 310,

                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Face',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Face.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Face",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Eyes',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Eyes.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                    ),
                                ),
                                const Text(
                                  "Eyes",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Lips',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Lips.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                    ),
                                ),
                                const Text(
                                  "Lips",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Nails',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Nails.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Nails",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Sanitizers',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Sanitizers.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Sanitizers",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Oral Care',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/OralCare.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Oral Care",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Feminine Hygiene',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/FeminineHygiene.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                  ),
                                ),
                                const Text(
                                  "Feminine Hygiene",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Deodorants',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Deodorants.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Deodorants",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),


                      ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Mobile & Accessories',
                          key: mobileAccessories_key2,
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,

                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Mobile',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Mobile.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                     ),
                                ),
                                const Text(
                                  "Mobile",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Mobile Holders',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/MobileHolders.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Mobile Holders",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Mobile cases & covers',
                                        from: 2),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Mobilecasesandcovers.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "Mobile cases & covers",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                      ],),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Electronics',
                          key: Electronics_key2,
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )),
                      const Expanded(
                        child: Divider(
                          indent: 8.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,

                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProductListScreen(
                                        listName: 'Electronics',
                                        from: 1),));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:DecorationImage(
                                        image:AssetImage('assets/images/subcategory/Electronics.jpg')
                                        ,alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,) ,
                                      ),
                                ),
                                const Text(
                                  "All Electronics",
                                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ),
                      ],),
                  ),
                ],
              ),
            ),
          )
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 45,

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:DecorationImage(image: AssetImage(imageUrl!),alignment: Alignment.center,
                fit: BoxFit.fitHeight,) ,
              //border: Border.all(color:Colors.blue.shade900 )
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          itemLabel ?? "Top Offers",
          style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}