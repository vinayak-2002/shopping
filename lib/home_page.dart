import 'package:flutter/material.dart';
import 'package:flutter_project3/sport_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_project3/clothe_page.dart';
import 'package:flutter_project3/bag_page.dart';
import 'package:flutter_project3/shoe_page.dart';
import 'package:flutter_project3/accessory_page.dart';
import 'package:flutter_project3/men_page.dart';



final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Product {
  late String image, name;

  Product({required this.image,required this.name,});
}

class Recommendation {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;
  late bool isUndo;

  Recommendation({required this.image,required this.title,required this.itemLeft,required this.isFavourite,required this.isUndo});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isLoading = true;

  List<Widget> ProductPage = [
    ClothesPage(),
    BagsPage(),
    ShoesPage(),
    AccessoriesPage(),
    SportsPage(),
    MensPage(),

  ];

  List<Product> productList = [];

  @override
  void initState(){
    super.initState();
    initProductList();
    initItemList();
    _loadImage();
  }

  initProductList(){
    productList.clear();

    productList.add(Product(image: 'https://hulaglobal.com/wp-content/uploads/2022/08/Hula-global-fashion-summer-guide.jpg', name: 'Clothes'));

    productList.add(Product(image: 'https://www.brandless.co.in/cdn/shop/products/tote.jpg?v=1613222773', name: 'Bags'));

    productList.add(Product(image: 'https://www.jiomart.com/images/product/original/rvrgwpjvsp/bruton-trendy-sports-shoes-for-men-blue-product-images-rvrgwpjvsp-0-202209021256.jpg?im=Resize=(1000,1000)', name: 'Shoes'));

    productList.add(Product(image: 'https://cdn.britannica.com/35/222035-050-C68AD682/makeup-cosmetics.jpg?w=840&h=460&c=crop', name: 'Accessories '));

    productList.add(Product(image: 'https://rockytopsportsworld.com/wp-content/uploads/2019/07/sports-balls.jpg', name: 'Sports'));

    productList.add(Product(image: 'https://m.media-amazon.com/images/I/71+jpJX2+qL._AC_UY1100_.jpg', name: 'Men\'s'));

  }

  List<Recommendation> itemList = [];

  List<Recommendation> deletedList = [];

  initItemList(){
    itemList.clear();

    itemList.add(Recommendation(image: 'https://thebanyantee.com/cdn/shop/files/Baby-Blue-T-shirt_13e30dcd-30f4-43fd-96b0-dde16de0c8b6.jpg?v=1721381182&width=1920', title: 'T-Shirt', itemLeft: 205, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://www.kushals.com/cdn/shop/files/antique-necklace-ruby-green-gold-antique-necklace-162050-37891440803996.jpg?v=1711698394', title: 'Butterfly Necklace', itemLeft: 103, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://m.media-amazon.com/images/I/71vz71m5usL._AC_UY1000_.jpg', title: 'HandBag', itemLeft: 45, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://pinkshop.in/wp-content/uploads/2021/05/heel-sandals-for-woman.jpeg', title: 'Heel', itemLeft: 189, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://theperfumeworld.co.uk/cdn/shop/files/sauvage_homepage_tile_684x684_b8c47959-3a78-4638-98e8-06fc2f4fbaf3.webp?v=1679670504&width=1500', title: 'Perfume', itemLeft: 37, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://mesmerizeindia.com/cdn/shop/files/Balance7ChakraTagBlackNecklace.jpg?v=1723899657&width=1500', title: 'Men Necklace', itemLeft: 145, isFavourite: false, isUndo: false));
  }

  _loadImage() async{
    await
    Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.yellow[50],
      key:  _scaffoldKey,
       body: SingleChildScrollView(
         child: SizedBox(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               _customAppBar,
               _categories,
               _recommendation,
             ],
           ),
         ),
       ),
      drawer: _menuDrawer,
    );
  }

  Widget get _customAppBar => Container(
    padding: EdgeInsets.only(top: 50),
    alignment: Alignment.topLeft,
    height: 180,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            'assets/images/appbar_wallpaper.png',
        ),
        fit: BoxFit.cover,
      ),
      boxShadow: [new BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: (){
            // menu drawer
            _menuDrawer;
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            margin: EdgeInsets.only(left:10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                      'assets/images/dp1.png',
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left:10),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/dp1.png',
                ),
                fit: BoxFit.cover,
              )
          ),
        ),

        SizedBox(width: 5,),

        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20),
                   borderSide: BorderSide(color: Colors.grey,width: 1,),
                 ),
                 prefixIcon: Icon(Icons.search_rounded,color: Colors.grey,size: 30,),
                   contentPadding: EdgeInsets.only(bottom: 12,right: 10),
                 hintText: 'Search',
                 hintStyle: const TextStyle(
                   color: Colors.grey,
                   fontSize: 20
                 )
               ),
            ),
          ),
        ),
        SizedBox(width: 10,)
      ],
    ),
  );

  Widget get _categories => Container(
    height: 170,
    padding: EdgeInsets.only(left: 15,right: 15,top: 10),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Categories',style: TextStyle(color: Colors.deepOrange,fontSize: 28,fontWeight: FontWeight.bold),),
            Spacer(),
            Container(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    // some page
                  },
                  child: const Row(
                    children: [
                      Text('View All',style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
                      Icon(Icons.arrow_forward,color: Colors.deepOrange,size: 15,)
                    ],
                  ),
                )),
          ],
        ),

        SizedBox(height: 20,),

        Expanded(
          child: ListView.builder(
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductPage[index]));
                  },
                  child: SizedBox(
                    width: 90,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15,left: 15),
                          height: 60,
                          width: 60,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [new BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: _isLoading?Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white.withOpacity(0.2),
                                child: Image.network(
                                  productList[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ):
                              Image.network(
                                productList[index].image,
                                fit: BoxFit.cover,
                              ),
                          ),

                      ),
                        SizedBox(height: 5,),
                        Expanded(child: Text('${productList[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14),))
                                    ],
                                  ),
                  ),
                );
          }),
        )
      ],
    ),
  );
  
  Widget get _recommendation => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.0),
        child: Text('Recommendations',style: TextStyle(color: Colors.deepOrange,fontSize: 28,fontWeight: FontWeight.bold),),
      ),

      SizedBox(height: 10,),

      GridView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 5,),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 0,mainAxisSpacing: 10,childAspectRatio: 0.9),
          itemBuilder: (BuildContext context, int Index) {
            return Stack(
              children: [
               Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [new BoxShadow(color: Colors.grey,offset: Offset(-0.5, 3),blurRadius: 3)]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 260,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                            child: _isLoading?Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white.withOpacity(0.2),
                              child: Image.network(
                                itemList[Index].image,
                                fit: BoxFit.cover,
                              ),
                            ):
                            Image.network(
                              itemList[Index].image,
                              fit: BoxFit.cover,
                            ),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(itemList[Index].title, style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('${itemList[Index].itemLeft}', style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),),
                      ),
                      Spacer(flex: 1,),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: (){

                            setState(() {
                              deletedList.add(itemList.removeAt(Index));

                            });

                            final snackBar = SnackBar(
                              content: const Text('Add item to Wishlist!'),
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  setState(() {
                                    // itemList[Index].isUndo = !itemList[Index].isUndo;
                                  });
                                  itemList.insert(Index,deletedList.removeLast());
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                            ),
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                          ),
                        ),
                      )
                     ]
                  ),
                ),
                Positioned(right: 0, top: 0, child: IconButton(
                    onPressed: () {
                      setState(() {
                           itemList[Index].isFavourite = !itemList[Index].isFavourite;
                      });

                      final snackBar = itemList[Index].isFavourite?SnackBar(
                        content: const Text('Added item to favourite!'),
                        duration: Duration(seconds: 1),
                      ):SnackBar(
                        content: const Text('Removed item from favourite!'),
                        duration: Duration(seconds: 1),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: itemList[Index].isFavourite?Icon(
                      Icons.favorite, color: Colors.red,
                      size: 25,):Icon(
                      Icons.favorite_outline, color: Colors.red,
                      size: 25,),
                ),
                ),
              ],
            );
          },),
    ],
  );

  Widget get _menuDrawer =>Drawer(
    shadowColor: Colors.grey,
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Vinayak Thakur"),
          accountEmail: Text("thakurvinayak3579@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              "V",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home), title: Text("Home"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings), title: Text("Settings"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contacts), title: Text("Contact Us"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

