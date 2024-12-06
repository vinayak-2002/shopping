import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Accessorie {
  late String image, name;

  Accessorie({required this.image,required this.name,});
}

class Suggestions {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;

  Suggestions({required this.image,required this.title,required this.itemLeft,required this.isFavourite});
}

class AccessoriesPage extends StatefulWidget {
  const AccessoriesPage({super.key});

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {

  bool _isLoading = true;

  List<Accessorie> accessorieList = [];

  @override
  void initState(){
    super.initState();
    initAccessoryList();
    initItemList();
    _loadImage();
  }

  initAccessoryList(){
    accessorieList.clear();

    accessorieList.add(Accessorie(image: 'https://cdn.britannica.com/35/222035-050-C68AD682/makeup-cosmetics.jpg?w=840&h=460&c=crop', name: 'All'));

    accessorieList.add(Accessorie(image: 'https://d1ebdenobygu5e.cloudfront.net/media/catalog/product/2/1/21_17.jpg', name: 'Hair Cream '));

    accessorieList.add(Accessorie(image: 'https://www.dotandkey.com/cdn/shop/files/1-Strawberry-M_143decfa-fa4e-4a9c-bdde-9cb60e364f55.jpg?v=1727421241', name: 'Moisturizer'));

    accessorieList.add(Accessorie(image: 'https://theskinstory.in/cdn/shop/files/1_101b2734-5b84-4ccd-97c3-ea15e483f1f0.jpg?v=1704451340', name: 'Shampoo'));

    accessorieList.add(Accessorie(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk6vAY34PJ-a9ewdAzba2UHt9okG631VNgDw&s', name: 'Nail Paints'));

    accessorieList.add(Accessorie(image: 'https://www.o3plus.com/cdn/shop/products/product_copy_1_8.jpg?v=1686655279', name: 'Face serum'));

  }

  List<Suggestions> itemList = [];

  List<Suggestions> deletedList = [];

  initItemList(){
    itemList.clear();

    itemList.add(Suggestions(image: 'https://images.bblunt.com/catalog/product/1/_/1_1_63.jpg?format=auto&height=600', title: 'Hair Mask', itemLeft: 125, isFavourite: false));

    itemList.add(Suggestions(image: 'https://m.media-amazon.com/images/I/614hAynqKNL.jpg', title: 'Conditioner', itemLeft: 783, isFavourite: false));

    itemList.add(Suggestions(image: 'https://m.media-amazon.com/images/I/51TZbjsQ-mL.jpg', title: 'Hair Cream', itemLeft: 873, isFavourite: false));

    itemList.add(Suggestions(image: 'https://aqualogica.in/cdn/shop/files/1_8d797483-8cdc-4d99-9a42-49972639c3cd.jpg?v=1719466573&width=1445', title: 'Moisturizer', itemLeft: 237, isFavourite: false));

    itemList.add(Suggestions(image: 'https://shop.recodestudios.com/cdn/shop/files/8C07914E-B9EE-44E2-872F-020AC47B9085.jpg?v=1722386944&width=1946', title: 'Face Serum', itemLeft: 134, isFavourite: false));

    itemList.add(Suggestions(image: 'https://m.media-amazon.com/images/I/61+hry7xIuL.jpg', title: 'Hair Serum', itemLeft: 423, isFavourite: false));
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
              itemCount: accessorieList.length,
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
                                accessorieList[index].image,
                                fit: BoxFit.cover,
                              ),
                            ):
                            Image.network(
                              accessorieList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(height: 5,),
                        Expanded(child: Text('${accessorieList[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14),))
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
