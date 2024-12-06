import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Bag {
  late String image, name;

  Bag({required this.image,required this.name,});
}

class Suggestion {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;

  Suggestion({required this.image,required this.title,required this.itemLeft,required this.isFavourite});
}

class BagsPage extends StatefulWidget {
  const BagsPage({super.key});

  @override
  State<BagsPage> createState() => _BagsPageState();
}

class _BagsPageState extends State<BagsPage> {

  bool _isLoading = true;

  List<Bag> bagList = [];

  @override
  void initState(){
    super.initState();
    initBagList();
    initItemList();
    _loadImage();
  }

  initBagList(){
    bagList.clear();

    bagList.add(Bag(image: 'https://www.brandless.co.in/cdn/shop/products/tote.jpg?v=1613222773', name: 'All'));

    bagList.add(Bag(image: 'https://m.media-amazon.com/images/I/71vz71m5usL._AC_UY1000_.jpg', name: 'HandBag'));

    bagList.add(Bag(image: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/bag/i/i/d/43-school-bags-for-boys-and-girls-coaching-bag-tuition-bag-original-imahfcvutcqdsz35.jpeg?q=90&crop=false', name: 'BackPack'));

    bagList.add(Bag(image: 'https://4.imimg.com/data4/XO/UJ/MY-20998809/luggage-travel-bag.jpg', name: 'Travel Bags'));

    bagList.add(Bag(image: 'https://safaribags.com/cdn/shop/files/3_cc1902b1-49f1-4e2f-b70b-e6666a480dff.jpg?v=1688114256', name: 'Laptop Bags'));

    bagList.add(Bag(image: 'https://admin.mochishoes.com/product/66-430/660/66-430-11-10-1.jpg', name: 'Casual Bags'));

  }

  List<Suggestion> itemList = [];

  List<Suggestion> deletedList = [];

  initItemList(){
    itemList.clear();

    itemList.add(Suggestion(image: 'https://www.kalkstore.com/cdn/shop/articles/KL_WEB_BLOG_PORTADA_4420x2400_df689793-0c08-4d64-8872-7b415597a5ac.jpg?v=1654701916&width=1500', title: 'HandBag', itemLeft: 205, isFavourite: false));

    itemList.add(Suggestion(image: 'https://cdn.thewirecutter.com/wp-content/media/2022/09/backpacks-2048px-9904.jpg?auto=webp&quality=75&width=1024', title: 'BackPack', itemLeft: 103, isFavourite: false));

    itemList.add(Suggestion(image: 'https://rukminim2.flixcart.com/image/850/1000/kxtaxzk0/duffel-bag/j/u/e/stylish-trolley-bag-for-traveling-travel-duffel-luggage-bag-t3-original-imaga7f4hehnpttx.jpeg?q=90&crop=false', title: 'Travel Bags', itemLeft: 45, isFavourite: false));

    itemList.add(Suggestion(image: 'https://massimiliano.in/wp-content/uploads/2020/10/0W8A9922-1.jpg', title: 'Laptop Bags', itemLeft: 189, isFavourite: false));

    itemList.add(Suggestion(image: 'https://www.fastrack.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dwab0969a9/images/Fastrack/Catalog/F241BPMED05BL1_1.jpg?sw=600&sh=600', title: 'Casual Bags', itemLeft: 37, isFavourite: false));

    itemList.add(Suggestion(image: 'https://gokyo.in/cdn/shop/files/mmexport1721886594246.jpg?v=1721913764', title: 'Trekking Bags', itemLeft: 145, isFavourite: false));
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
              _CustomAppBar,
              _Types,
              _Recommendation,
            ],
          ),
        ),
      ),
      drawer: _MenuDrawer,
    );
  }

  Widget get _CustomAppBar => Container(
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
            _MenuDrawer;
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

  Widget get _Types => Container(
    height: 170,
    padding: EdgeInsets.only(left: 15,right: 15,top: 10),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Types',style: TextStyle(color: Colors.deepOrange,fontSize: 28,fontWeight: FontWeight.bold),),
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
              itemCount: bagList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage()));
                  },
                  child: SizedBox(
                    width: 100,
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
                                  bagList[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ):
                              Image.network(
                                bagList[index].image,
                                fit: BoxFit.cover,
                              ),
                          ),

                        ),
                        SizedBox(height: 5,),
                        Expanded(child: Text('${bagList[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14),))
                      ],
                    ),
                  ),
                );
              }
              ),
        )
      ],
    ),
  );

  Widget get _Recommendation => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      SizedBox(height: 10,),

      GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4,mainAxisSpacing: 8,childAspectRatio: 0.9),
        itemBuilder: (BuildContext context, int Index) {
          return Stack(
            children: [
              Container(
                width: 360,
                margin: EdgeInsets.all(5),
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
                            deletedList.add(itemList.removeAt(Index));

                            setState(() {

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

  Widget get _MenuDrawer =>Drawer(
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
