import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Men {
  late String image, name;

  Men({required this.image,required this.name,});
}

class Suggestions {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;

  Suggestions({required this.image,required this.title,required this.itemLeft,required this.isFavourite});
}

class MensPage extends StatefulWidget {
  const  MensPage({super.key});

  @override
  State< MensPage> createState() => _MensPageState();
}

class _MensPageState extends State<MensPage> {

  bool _isLoading = true;

  List<Men> menList = [];

  @override
  void initState(){
    super.initState();
    initMenList();
    initItemList();
    _loadImage();
  }

  initMenList(){
    menList.clear();

    menList.add(Men(image: 'https://m.media-amazon.com/images/I/71+jpJX2+qL._AC_UY1100_.jpg', name: 'All'));

    menList.add(Men(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl97l1s_5Nu_hOfDwajeE0w0Hq9ewnUm2Ea5kt-JVzwSHF2lI91j3vwFRbCm81aDNkstQ&usqp=CAU', name: 'Outfits'));

    menList.add(Men(image: 'https://www.titan.co.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dw7646cf71/images/Titan/Catalog/90140QM03_1.jpg?sw=600&sh=600', name: 'Watches'));

    menList.add(Men(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_qpd1lae2ymykxCjGm4bzP2YE_QYMg8TW4Kn00e4bBcC5DJKETxMvXcnLE64Hm8hgDzY&usqp=CAU', name: 'Hats'));

    menList.add(Men(image: 'https://m.media-amazon.com/images/I/91y7HDF3QfL._AC_UY1100_.jpg', name: 'Wallets'));

    menList.add(Men(image: 'https://m.media-amazon.com/images/I/61KOrK1kdpL._AC_UY1100_.jpg', name: 'Belts'));

  }

  List<Suggestions> itemList = [];

  List<Suggestions> deletedList = [];

  initItemList(){
    itemList.clear();

    itemList.add(Suggestions(image: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/blazer/a/t/l/36-black-velvet-red-line-personality-plus-original-imahyvrkyegbrjmx.jpeg?q=90&crop=false', title: 'blazer', itemLeft: 1325, isFavourite: false));

    itemList.add(Suggestions(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjE3KEmyigQXLoNuYfNFvJ30oPOh9st5bS6g&s', title: 'Rolex Watch', itemLeft: 241, isFavourite: false));

    itemList.add(Suggestions(image: 'https://teakwoodleathers.com/cdn/shop/products/T_BT_753_BR_1_1080x.jpg?v=1666954708', title: 'Leather Belt', itemLeft: 897, isFavourite: false));

    itemList.add(Suggestions(image: 'https://assets.ajio.com/medias/sys_master/root/20230925/T2fU/6511ac4fddf7791519fec062/-473Wx593H-442260328-blue-MODEL.jpg', title: 'Muffler', itemLeft: 1009, isFavourite: false));

    itemList.add(Suggestions(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnG99mnEjC78CS1xzuxYiFLTvOX_pPwwHfmg&s', title: 'Driving Gloves', itemLeft: 363, isFavourite: false));

    itemList.add(Suggestions(image: 'https://static5.lenskart.com/media/catalog/product/pro/1/thumbnail/656x464/9df78eab33525d08d6e5fb8d27136e95//v/i/matte-black-grey-solid-full-rim-rectangle-square-vincent-chase-polarized-the-metal-edit-vc-s13116-c1-sunglasses_vincent-chase-vc-s13116-c1-sunglasses_g_7206_1_5july23.jpg', title: 'Goggles', itemLeft: 223, isFavourite: false));
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
              itemCount: menList.length,
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
                                menList[index].image,
                                fit: BoxFit.cover,
                              ),
                            ):
                            Image.network(
                              menList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(height: 5,),
                        Expanded(child: Text('${menList[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14),))
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
