import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Shoe {
  late String image, name;


  Shoe({required this.image,required this.name,});
}

class Suggestions {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;

  Suggestions({required this.image,required this.title,required this.itemLeft,required this.isFavourite});
}

class ShoesPage extends StatefulWidget {
  const ShoesPage({super.key});

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {

  bool _isLoading = true;

  List<Shoe> shoeList = [];

  @override
  void initState(){
    super.initState();
    initShoeList();
    initItemList();
    _loadImage();
  }

  initShoeList(){
    shoeList.clear();

    shoeList.add(Shoe(image: 'https://www.jiomart.com/images/product/original/rvrgwpjvsp/bruton-trendy-sports-shoes-for-men-blue-product-images-rvrgwpjvsp-0-202209021256.jpg?im=Resize=(1000,1000)', name: 'All'));

    shoeList.add(Shoe(image: 'https://www.ajantashoes.com/pub/media/catalog/product/cache/0ee050c3ffc3555709b9bb6062f4d7e9/e/g/eg1001.jpg', name: 'Sports '));

    shoeList.add(Shoe(image: 'https://apisap.fabindia.com/medias/20164748-01.jpg?context=bWFzdGVyfGltYWdlc3wxNTA2MzR8aW1hZ2UvanBlZ3xhR1ExTDJnNVlTOHpNVEUxTWprMU9USTFPRFkxTkM4eU1ERTJORGMwT0Y4d01TNXFjR2N8M2E3ZjlhMDRlODk1OTE1ZjVlNGI2ZWM2OWU4NmJkYjcxNTdlZDZjNDc0ZTU2ZDRhZDgxM2RhMjA5OWFiYTM1Mw', name: 'Leather '));

    shoeList.add(Shoe(image: 'https://hitz.co.in/cdn/shop/files/9357-BLACK.jpg?v=1700726284', name: 'Sandals'));

    shoeList.add(Shoe(image: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/slipper-flip-flop/v/q/d/7-blosm-brandvilla-neon-orange-original-imagxyvfhwxbns3c.jpeg?q=90&crop=false', name: 'Slippers'));

    shoeList.add(Shoe(image: 'https://images-cdn.ubuy.co.in/635bc1e3491b375d3338c674-casual-shoes-spring-summer-boy.jpg', name: 'Casuals'));

  }

  List<Suggestions> itemList = [];

  List<Suggestions> deletedList = [];

  initItemList(){
    itemList.clear();

    itemList.add(Suggestions(image: 'https://4.imimg.com/data4/OO/YC/ANDROID-56758178/product.jpeg', title: 'Nick Shoe', itemLeft: 25, isFavourite: false));

    itemList.add(Suggestions(image: 'https://1ststepin.com/wp-content/uploads/2021/04/woodland-shoe-g-40777cma-2.jpg', title: 'WoodLand Shoe', itemLeft: 403, isFavourite: false));

    itemList.add(Suggestions(image: 'https://assets.adidas.com/images/w_600,f_auto,q_auto/b55f5c9bfed64040930562dba1b37341_9366/STEP_N_PACE_SHOES_Blue_IQ9155_01_standard.jpg', title: 'Adidas Shoe', itemLeft: 415, isFavourite: false));

    itemList.add(Suggestions(image: 'https://www.campusshoes.com/cdn/shop/files/FORRST_22G_1156_D.GRY_BLK_2.jpg?v=1704526836', title: 'Campus Shoe', itemLeft: 890, isFavourite: false));

    itemList.add(Suggestions(image: 'https://hitz.co.in/cdn/shop/files/9357-BLACK.jpg?v=1700726284', title: 'Sandal', itemLeft: 34, isFavourite: false));

    itemList.add(Suggestions(image: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/slipper-flip-flop/v/q/d/7-blosm-brandvilla-neon-orange-original-imagxyvfhwxbns3c.jpeg?q=90&crop=false', title: 'Slipper', itemLeft: 43, isFavourite: false));
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
              itemCount: shoeList.length,
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
                                shoeList[index].image,
                                fit: BoxFit.cover,
                              ),
                            ):
                            Image.network(
                              shoeList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(height: 5,),
                        Expanded(child: Text('${shoeList[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14),))
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

                  final snackBar = itemList[Index].isFavourite?const SnackBar(
                    content: Text('Added item to favourite!'),
                    duration: Duration(seconds: 1),
                  ):const SnackBar(
                    content: Text('Removed item from favourite!'),
                    duration: Duration(seconds: 1),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: itemList[Index].isFavourite?const Icon(
                  Icons.favorite, color: Colors.red,
                  size: 25,):const Icon(
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
