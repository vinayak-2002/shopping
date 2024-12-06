import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.yellow[50],
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              child: Column(
                children: [
                  _profileBuilder,
                  _aboutUserBuilder,
                  Divider(thickness: 1.5,color: Colors.deepOrange,),
                  _pageBuilder,

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:5,vertical: 30.0),
              child: Column(
                children: [
                  Icon(Icons.logout_rounded,color: Colors.deepOrange,size: 30,),
                  Text('Logout',style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }

  Widget get _profileBuilder =>  Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('assets/images/dp1.png'),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(height: 5,),
        Text('Hello Aditya ',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
        SizedBox(height: 30,)
      ],
    ),
  );

  Widget get _aboutUserBuilder => Column(
    children: [
      Row(
        children: [
          Icon(Icons.email_rounded,color: Colors.deepOrange,size: 22,),
          SizedBox(width: 5,),
          Text('E-mail',style: TextStyle(color: Colors.deepOrange,fontSize: 14),),
          SizedBox(width: 44,),
          Expanded(child: Text('adityathakur123@gmail.com',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
        ],
      ),

      SizedBox(height: 20,),

      Row(
        children: [
          Icon(Icons.phone,color: Colors.deepOrange,size: 22,),
          SizedBox(width: 5,),
          Text('Phone',style: TextStyle(color: Colors.deepOrange,fontSize: 14),),
          SizedBox(width: 45,),
          Expanded(child: Text('0127623973838',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
        ],
      ),
      SizedBox(height: 20,),

      Row(
        children: [
          Icon(Icons.pin_drop,color: Colors.deepOrange,size: 22,),
          SizedBox(width: 5,),
          Text('Location',style: TextStyle(color: Colors.deepOrange,fontSize: 14),),
          SizedBox(width: 30,),
          Text('K-12, julia street-Qena-Egypt',style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),),
        ],
      ),
      SizedBox(height: 20,),

      Row(
        children: [
          Icon(Icons.male,color: Colors.deepOrange,size: 22,),
          SizedBox(width: 5,),
          Text('Gender',style: TextStyle(color: Colors.deepOrange,fontSize: 14),),
          SizedBox(width: 40,),
          Expanded(child: Text('Male',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
        ],
      ),
      SizedBox(height: 20,),

      Row(
        children: [
          Icon(Icons.calendar_today_rounded,color: Colors.deepOrange,size: 22,),
          SizedBox(width: 5,),
          Text('Age',style: TextStyle(color: Colors.deepOrange,fontSize: 14),),
          SizedBox(width: 60,),
          Expanded(child: Text('22',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
        ],
      ),
      SizedBox(height: 20,),
    ],
  );

  Widget get _pageBuilder => Column(
    children: [


      InkWell(
        onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartPage()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.shopping_cart_rounded,color: Colors.deepOrange,size: 22,),
              SizedBox(width: 5,),
              Expanded(child: Text('My Cart',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),

      InkWell(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.article_outlined,color: Colors.deepOrange,size: 22,),
              SizedBox(width: 5,),
              Expanded(child: Text('Orders Managment',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),


      InkWell(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.settings,color: Colors.deepOrange,size: 22,),
              SizedBox(width: 5,),
              Expanded(child: Text('Setting & Privacy',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),


      InkWell(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.favorite,color: Colors.deepOrange,size: 22,),
              SizedBox(width: 5,),
              Expanded(child: Text('Favourites',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),


      InkWell(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.attach_money,color: Colors.deepOrange,size: 22,),
              SizedBox(width: 5,),
              Expanded(child: Text('My Sales',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),


      InkWell(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.help,color: Colors.deepOrange,size: 22,),
              SizedBox(width: 5,),
              Expanded(child: Text('Help & Support',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),

    ],
  );
}

class Recommendation {
  late String image, title;
  late int itemLeft ;
  late bool isFavourite;
  late bool isUndo;

  Recommendation({required this.image,required this.title,required this.itemLeft,required this.isFavourite,required this.isUndo});
}

class MyCartPage extends StatefulWidget {
  const MyCartPage({ super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

  bool _isLoading = true;

  List<int> count = [1,1,1,1,1,1,];

  List<bool> isRemoved = [true,true,true,true,true,true,];

  List<Recommendation> itemList = [];

  @override
  void initState(){
    super.initState();
    initItemList();
    _loadImage();
  }

  initItemList(){
    itemList.clear();

    itemList.add(Recommendation(image: 'https://thebanyantee.com/cdn/shop/files/Baby-Blue-T-shirt_13e30dcd-30f4-43fd-96b0-dde16de0c8b6.jpg?v=1721381182&width=1920', title: 'T-Shirt', itemLeft: 205, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://www.kushals.com/cdn/shop/files/antique-necklace-ruby-green-gold-antique-necklace-162050-37891440803996.jpg?v=1711698394', title: 'Butterfly Necklace', itemLeft: 103, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://m.media-amazon.com/images/I/71vz71m5usL._AC_UY1000_.jpg', title: 'HandBag', itemLeft: 45, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://pinkshop.in/wp-content/uploads/2021/05/heel-sandals-for-woman.jpeg', title: 'Heel', itemLeft: 189, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://theperfumeworld.co.uk/cdn/shop/files/sauvage_homepage_tile_684x684_b8c47959-3a78-4638-98e8-06fc2f4fbaf3.webp?v=1679670504&width=1500', title: 'Perfume', itemLeft: 37, isFavourite: false, isUndo: false));

    itemList.add(Recommendation(image: 'https://mesmerizeindia.com/cdn/shop/files/Balance7ChakraTagBlackNecklace.jpg?v=1723899657&width=1500', title: 'Men Necklace', itemLeft: 145, isFavourite: false, isUndo: false));
  }

  int delivery = 45;

  int sum = 0;

  int discount = 5;

  myFunction(sum){
  int index = 0;
    while(index<=itemList.length-1){
      sum += itemList[index].itemLeft;
      index++;
    }
    return sum ;
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_rounded,color: Colors.deepOrange,size: 25,),
                    SizedBox(width: 5,),
                    Text('My Cart',style: TextStyle(color: Colors.deepOrange,fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
        
              const SizedBox(height: 40,),
        
               ListView.builder(
                    itemCount: itemList.length,
                    shrinkWrap: true,
                    cacheExtent: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index){
                        return isRemoved[index]?Container(
                          height: 95,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 110,child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                  child: _isLoading?Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Image.network(itemList[index].image,fit: BoxFit.cover,)):Image.network(itemList[index].image,fit: BoxFit.cover,))),

                              SizedBox(width: 10,),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(itemList[index].title,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),),
                                    Text('${itemList[index].itemLeft}', style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            if(count[index]>1){
                                               count[index]--;

                                               final snackBar = SnackBar(
                                                 content: Text('One Item removed from ${itemList[index].title}'),
                                                 duration: Duration(seconds: 1),
                                               );

                                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            }else{
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  content: Text('Do you want to remove this item?',style: TextStyle(fontSize: 15),),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (){
                                                              // isRemoved[index] = !isRemoved[index];
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            width: 60,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Colors.red,
                                                                borderRadius: BorderRadius.circular(13)
                                                            ),
                                                            child: Text('No',style: TextStyle(color: Colors.white,),),
                                                          ),
                                                        ),

                                                        GestureDetector(
                                                          onTap: (){
                                                            setState(() {
                                                              isRemoved[index] = !isRemoved[index];

                                                              const snackBar = SnackBar(
                                                                content: Text('Item Removed'),
                                                                duration: Duration(seconds: 1),
                                                              );

                                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            width: 60,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Colors.blue,
                                                                borderRadius: BorderRadius.circular(13)
                                                            ),
                                                            child: Text('Yes',style: TextStyle(color: Colors.white,),),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                );
                                              });
                                            }

                                          });
                                        },
                                        child: Icon(Icons.remove_circle,color: Colors.deepOrange,size: 25,)),

                                    SizedBox(width: 2,),

                                    Text('${count[index]}',style: TextStyle(color: Colors.deepOrange,fontSize: 20),),

                                    SizedBox(width: 2,),

                                    GestureDetector(
                                        onTap: (){
                                          setState(() {
                                              count[index]++;

                                            final snackBar = SnackBar(
                                                content: Text('One Item added to ${itemList[index].title}'),
                                                duration: Duration(seconds: 1),
                                              );

                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          });
                                        },
                                        child: Icon(Icons.add_circle,color: Colors.deepOrange,size: 25,)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5,)
                            ],
                          ),
                        ):SizedBox(width: 0,height: 0,);
                }),
        
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.deepOrange,width: 1,),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.deepOrange,width: 1,),
                          ),
                          hintText: 'Enter Promo code if you have',
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 15, fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.only(left: 20,),
                          suffixIcon: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              alignment: Alignment.center,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                              ),
                              child: Icon(Icons.done_rounded,color: Colors.white,size: 25,),
                            ),
                          )
                        ),

                      ),
                    ),
        
                    SizedBox(height: 20,),
        
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Product Price',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),),
                              Text('${myFunction(sum)}\$',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)
                            ],
                          ),
        
                          SizedBox(height: 10,),
        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),),
                              Text('${delivery}\$',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)
                            ],
                          ),
        
                          SizedBox(height: 10,),
        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),),
                              Text('$discount\$',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold),)
                            ],
                          ),
        
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90,),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(left: 40,top: 20,right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
          boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, -3),blurRadius: 2)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Total Price',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('${myFunction(sum) + delivery - discount}\$',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutPage()));
              },
              child: Container(
                width: 180,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Checkout',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.yellow[50],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_rounded,color: Colors.deepOrange,size: 25,),
                    SizedBox(width: 5,),
                    Text('Checkout',style: TextStyle(color: Colors.deepOrange,fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              const SizedBox(height: 40,),

              Text('Address',style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),),

              Align(alignment:Alignment.centerRight,child: Text('Add New',style: TextStyle(color: Colors.deepOrange,fontSize: 18,),)),

              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      height: 95,
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top:5 ,bottom: 15),
                      padding: EdgeInsets.only(top: 2,left: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Icon(Icons.check_circle_outlined,color: Colors.deepOrange,size: 28,),
                              Icon(Icons.mode_edit_outlined,color: Colors.deepOrange,size: 25,)
                            ],
                          ),

                          SizedBox(height: 20,),

                          Padding(padding: EdgeInsets.only(left: 15),child: Expanded(child: Text('K-12, julia street-Qena-Egypt',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 16,fontWeight: FontWeight.bold),))),
                        ],
                      ),
                      );

                  }),

              Text('Payment',style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),),

              Align(alignment:Alignment.centerRight,child: Text('Add New',style: TextStyle(color: Colors.deepOrange,fontSize: 18,),)),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            child: ClipRRect(borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),child: Image.network('https://dza2kd7rioahk.cloudfront.net/content/image_ee9f0fe005.webp',fit: BoxFit.cover,)),
                          ),
                          Text('Viscard',style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text('_________2345',style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
                          Icon(Icons.check_circle_outlined,color: Colors.deepOrange,size: 28,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, 3),blurRadius: 2)],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            child: ClipRRect(borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),child: Image.network('https://logos-world.net/wp-content/uploads/2020/09/MasterCard-Logo-1996-2016.png',fit: BoxFit.cover,)),
                          ),
                          Text('MasterCard',style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text('_________2345',style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
                          Icon(Icons.circle_outlined,color: Colors.deepOrange,size: 28,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 90,),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 80,
        padding: EdgeInsets.only(left: 40,top: 20,right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
          boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0, -3),blurRadius: 2)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Total Price',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('45\$',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutPage()));
              },
              child: Container(
                width: 180,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Confirm',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

