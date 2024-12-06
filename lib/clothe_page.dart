import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Clothe {
  late String image, name;

  Clothe({required this.image,required this.name,});
}

class Suggestion {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;
  late bool isUndo;

  Suggestion({required this.image,required this.title,required this.itemLeft,required this.isFavourite,required this.isUndo});
}

class ClothesPage extends StatefulWidget {
  const ClothesPage({super.key});

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {

  bool _isLoading = true;

  List<Clothe> clotheList = [];

  @override
  void initState(){
    super.initState();
    initClotheList();
    initItemList();
    _loadImage();
  }

  initClotheList(){
    clotheList.clear();

    clotheList.add(Clothe(image: 'https://hulaglobal.com/wp-content/uploads/2022/08/Hula-global-fashion-summer-guide.jpg', name: 'All'));

    clotheList.add(Clothe(image: 'https://www.jiomart.com/images/product/original/rv3zngnfyp/eyebogler-mens-round-neck-regular-fit-full-length-sleeve-t-shirt-product-images-rv3zngnfyp-0-202402111505.jpg?im=Resize=(500,630)', name: 'T-Shirt'));

    clotheList.add(Clothe(image: 'https://www.jaipuriadaah.com/cdn/shop/files/DSC_4106copy_600x.jpg?v=1719489929', name: 'Blouses'));

    clotheList.add(Clothe(image: 'https://thesparkshop.in/wp-content/uploads/2022/10/new-spring-double-pocket-mens-fashion-shirt-brand-men-long-sleeved-solid-shirts-slim-fit-casual-men-shirt-social-extra-image-2.jpg', name: 'Shirt'));

    clotheList.add(Clothe(image: 'https://assets.ajio.com/medias/sys_master/root/20240129/pJX1/65b6d6a616fd2c6e6ac558cc/-1117Wx1400H-467016973-black-MODEL.jpg', name: 'Pants'));

    clotheList.add(Clothe(image: 'https://www.underarmour.in/media/catalog/product/cache/fe00ef9a43201311b84f219ced64b808/1/3/1382528-432-XS-120241107164627065.jpg', name: 'Leggings'));

  }

  List<Suggestion> itemList = [];

  List<Suggestion> deletedList = [];

  initItemList(){
    itemList.clear();

    itemList.add(Suggestion(image: 'https://fordlafemme.com/wp-content/uploads/2023/03/luxury-feminine-classy-outfit-inspiration-ideas.jpg', title: 'Classy Dress', itemLeft: 103, isFavourite: false, isUndo: false));

    itemList.add(Suggestion(image: 'https://www.jiomart.com/images/product/original/rv3zngnfyp/eyebogler-mens-round-neck-regular-fit-full-length-sleeve-t-shirt-product-images-rv3zngnfyp-0-202402111505.jpg?im=Resize=(500,630)', title: 'T-Shirt', itemLeft: 205, isFavourite: false, isUndo: false));

    itemList.add(Suggestion(image: 'https://contents.mediadecathlon.com/p2510297/4c762bd8f03774388f8caaaf70a9dd03/p2510297.jpg?format=auto&quality=70&f=2520x0', title: 'Sports', itemLeft: 45, isFavourite: false, isUndo: false));

    itemList.add(Suggestion(image: 'https://nobero.com/cdn/shop/files/og.jpg?v=1722234051', title: 'T-Shirt', itemLeft: 189, isFavourite: false, isUndo: false));

    itemList.add(Suggestion(image: 'https://assets.ajio.com/medias/sys_master/root/20240129/pJX1/65b6d6a616fd2c6e6ac558cc/-1117Wx1400H-467016973-black-MODEL.jpg', title: 'Pant', itemLeft: 37, isFavourite: false, isUndo: false));

    itemList.add(Suggestion(image: 'https://ae-pic-a1.aliexpress-media.com/kf/S6675214eeab448c0a686fcd538971fc91/New-Men-Gym-T-shirt-High-elasticity-bodybuilding-fitness-quick-dry-short-sleeve-men-s-sports.jpg_640x640Q90.jpg_.webp', title: 'Gym wears', itemLeft: 145, isFavourite: false, isUndo: false));
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
              _Suggestion1,
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
              itemCount: clotheList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage()));
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
                            child:_isLoading?Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white.withOpacity(0.2),
                              child: Image.network(
                                clotheList[index].image,
                                fit: BoxFit.cover,
                              ),
                            ):
                            Image.network(
                              clotheList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(height: 5,),
                        Expanded(child: Text('${clotheList[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14),))
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    ),
  );

  Widget get _Suggestion1 => Column(
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
                            key: ValueKey(clotheList[Index].image),
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
