import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'navigator_page.dart';

var _formKey = GlobalKey<FormState>();

void _submit() {
  final isValid = _formKey.currentState?.validate();
  if (!isValid!) {
    return;
  }
  _formKey.currentState?.save();
}

 bool isLoading = false;

 bool _isVisible1 = false;

 bool _isVisible2 = false;

 bool _isSelected = false;

 bool _isVisible = false;

 bool _isSignedIn = false;

UserInfo _userInfo = UserInfo(name: 'vinayak', email: "thakurvinayak3579@gmail.com", password: 'viny@563', phone: 6230706173);

late String _email,_phone;

enum SampleItem { Itemone ,Itemtwo,Itemthree }

enum Gender { Gender1,Gender2}

class UserInfo{
  late String name,email,password;
  late int phone;

  UserInfo({required this.name,required this.email,required this.password,required this.phone});
}

List<UserInfo> infoList = [];

void initState(){
  initState();
  initDataList();
}

initDataList(){
  infoList.clear();

  infoList.add(UserInfo(name: 'vinayak', email: "thakurvinayak3579@gmail.com", password: 'viny@563', phone: 6230706173));
  infoList.add(UserInfo(name: 'abhishek', email: 'abhisheksingh422@gmail.com', password: 'abhi@8737', phone: 6286371682));
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopBag Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        fontFamily: 'Kanit'
      ),
      home:  SplashScreen(),
    );
  }
}



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'ShopBag')),
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ShopBag',style: TextStyle(color: Colors.deepPurple,fontFamily: 'Fontspring',fontSize: 40),),
                  Text('O N L I N E   S H O P',style: TextStyle(color: Colors.deepOrange,fontFamily: 'WhatsAppFont',fontSize: 10),)
                ],
              ),
              SizedBox(width: 10,),
              Image.asset(
                'assets/images/shopcart.png',
                color: Colors.deepOrange,
                fit: BoxFit.cover,
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 30),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              'We\'re thrilled to have you here and \nexcited that you\'re using our app' ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.deepOrange,fontSize: 20),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all( 10),
            alignment: Alignment.centerRight,
            child: Column(
              children: [
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage()));
                 },
                 child: Container(
                   alignment: Alignment.center,
                   height: 50,
                   width: 50,
                   decoration: BoxDecoration(
                     color: Colors.deepOrange,
                     borderRadius: BorderRadius.circular(25),
                   ),
                   child: Icon(Icons.arrow_forward,color: Colors.white,),
                 ),
               ),
                SizedBox(height: 10,),
                Text('Let\'s Explore',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Align(
             alignment: Alignment.center,
             child: SizedBox(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Column(
                     children: [
                       Text('ShopBag',style: TextStyle(color: Colors.deepPurple,fontFamily: 'Fontspring',fontSize: 40),),
                       Text('O N L I N E   S H O P',style: TextStyle(color: Colors.deepOrange,fontFamily: 'WhatsAppFont',fontSize: 10),)
                     ],
                   ),
                   SizedBox(width: 10,),
                   Image.asset(
                     'assets/images/shopcart.png',
                     color: Colors.deepOrange,
                     fit: BoxFit.cover,
                     height: 70,
                   ),
                 ],
               ),
             ),
           ),

           SizedBox(height: 60,),

           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
             },
             child: Container(
               width: 280,
               height: 50,
               decoration: BoxDecoration(
                 color: Colors.deepOrange,
                 borderRadius: BorderRadius.circular(25),
                 boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
               ),
               child: Center(
                 child: Text(
                   'Sign In',
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                       color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                 ),
               ),
             ),
           ),

           SizedBox(height: 50,),

           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
             },
             child: Container(
               width: 280,
               height: 50,
               decoration: BoxDecoration(
                 color: Colors.deepOrange,
                 borderRadius: BorderRadius.circular(25),
                 boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
               ),
               child: const Center(
                 child: Text(
                   'Sign Up',
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                       color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                 ),
               ),
             ),
           ),
         ],
       ),
   );
  }
}



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5,top: 40),
            alignment: Alignment.topLeft,
            color: Colors.deepOrange,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,color: Colors.white,)),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 710,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _SignInInputPage,
                  SizedBox(height: 60,),
                  _OtherSignInPage,

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _SignInInputPage => Container(
    padding: EdgeInsets.only(top: 60,left: 20,right: 15),
    child: Form(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Username / E-mail',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              SizedBox(width: 2,),
              Expanded(
                child: TextFormField(
                  onTap: (){
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  decoration: InputDecoration(
                    errorBorder: _isSignedIn?OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFB71C1C))
                    ):OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFB71C1C))
                    ),
                    // errorText: 'Invalid Email address',
                    prefixIcon:  SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          SizedBox(width: 5,),
                          Icon(Icons.person,size: 35,color:Colors.deepOrange,),
                          SizedBox(width: 3,),
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(color: Colors.deepOrange)
                      ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                    final regex = RegExp(pattern);

                    if(value!.isNotEmpty && !regex.hasMatch(value) || value != _userInfo.email){
                      return _isSignedIn? null:'Invalid Email address!';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
              ),
            ],
          ),

          SizedBox(height: 40,),

          Align(
              alignment: Alignment.centerLeft,
              child: Text('Password',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),

          Row(
            children: <Widget>[
              SizedBox(width: 2,),
              Expanded(
                child: TextFormField(
                  obscureText: _isVisible?false:true,
                  onTap: (){
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB71C1C))
                      ),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isVisible =!_isVisible;
                        });
                      },
                      child: _isVisible?Icon(Icons.visibility,color: Colors.deepOrange,size: 30,):
                      Icon(Icons.visibility_off_sharp,color: Colors.grey,size: 30,),
                    ),
                      prefixIcon:  SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Icon(Icons.person,size: 35,color:Colors.deepOrange,),
                            SizedBox(width: 3,),
                            Container(
                              height: 30,
                              width: 1,
                              color: Colors.deepOrange,
                            ),
                          ],
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: Colors.deepOrange)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: Colors.blueAccent)
                      )
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value){
                    FocusScope.of(context).unfocus();
                  },
                  validator: (String? value) {
                    const pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    final regex = RegExp(pattern);

                 if(value!.isNotEmpty && !regex.hasMatch(value) || value != _userInfo.password){
                   return _isSignedIn? null:'Invalid password!';
                 }
                  return null;
                  },
                  onSaved: (value) => _password = value!,
                ),
              ),
            ],
          ),

          SizedBox(height: 15,),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordPage()));
                  },
                  child: Text('Forget Password?',overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.deepOrange,),
                  ),
              ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState?.save();
                if(_email == _userInfo.email && _password == _userInfo.password){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashPage()));
                }else{
                  setState(() {
                    _isSignedIn = !_isSignedIn;
                  });
                }
              };

            },
            child: Container(
              width: 280,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
              ),
              child: Text(
                'Sign In',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget get _OtherSignInPage => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text('Other Sign in ways ',overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.deepOrange,),),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png',fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network('https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network('https://purepng.com/public/uploads/large/purepng.com-apple-logologobrand-logoiconslogos-251519938788qhgdl.png',fit: BoxFit.cover,),
            ),
          ),
        ],
      )
    ],
  );
}



class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  bool _isSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,top: 40,right: 15),
              alignment: Alignment.topLeft,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,color: Colors.deepOrange,)),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                          color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 80,),
        
            Container(
              height: 150,
              width: 150,
              color: Colors.deepOrange.withOpacity(0.5),
            ),
        
            SizedBox(height: 30,),
        
            Container(alignment:Alignment.centerLeft,padding:EdgeInsets.only(left: 20,right: 20),child: Text('Enter Phone Or E-mail To Send Otp' ,style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 20),)),
        
            SizedBox(height: 15,),
        
            Row(
              children: <Widget>[
                SizedBox(width: 2,),
                Expanded(
                  child: Container(padding: EdgeInsets.only(left: 15,right: 15),
                    child: TextFormField(
                      onTap: (){
                        setState(() {
                          _isSelected = !_isSelected;
                        });
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(color: Colors.deepOrange)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(color: Colors.blueAccent)
                          )
                      ),
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onFieldSubmitted: (value){
                        FocusScope.of(context).unfocus();
                      },
                      onSaved: (value) => _phone = value!,
                    ),
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 50,),
        
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => otpPage()));
              },
              child: Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
                ),
                child: Center(
                  child: Text(
                    'Send',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class otpPage extends StatefulWidget {
  const otpPage({super.key});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,top: 40,right: 15),
              alignment: Alignment.topLeft,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,color: Colors.deepOrange,)),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                          color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 80,),
        
            Container(
              height: 150,
              width: 150,
              color: Colors.deepOrange.withOpacity(0.5),
            ),
        
            SizedBox(height: 30,),
        
            Container(alignment:Alignment.centerLeft,padding:EdgeInsets.only(left: 20,right: 20),child: Text('Enter The OTP' ,style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 20),)),
        
            SizedBox(height: 15,),
        
            OtpTextField(margin: EdgeInsets.only(left: 5,right: 5),
              fieldHeight: 60,
              fieldWidth: 55,
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(30),
              borderWidth: 1,
              borderColor: Colors.deepOrange,
              enabledBorderColor: Colors.deepOrange,
              numberOfFields: 4,
              onCodeChanged: (String code){
        
              },
              onSubmit: (String verificationCode){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Verification code'),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
              },
            ),
        
            SizedBox(height: 30,),
        
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
              },
              child: Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
                ),
                child: Center(
                  child: Text(
                    'Enter',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ),
            ),
        
            SizedBox(height: 30,),
        
            GestureDetector(
              onTap: (){
        
              },
              child: Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.deepOrange,width: 1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
                ),
                child: Center(
                  child: Text(
                    'Resend otp',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:40,left: 15,right: 15),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,color: Colors.deepOrange,)),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),
            //otp box here
            Container(alignment:Alignment.centerLeft,padding:EdgeInsets.only(left: 10,right: 10),child: Text('New Password',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 5,),
            Row(
              children: <Widget>[
                SizedBox(width: 2,),
                Expanded(
                  child: TextFormField(
                    obscureText: _isVisible1?false:true,
                    onTap: (){
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    },
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB71C1C))
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _isVisible1 =!_isVisible1;
                            });
                          },
                          child: _isVisible1?Icon(Icons.visibility,color: Colors.deepOrange,size: 30,):
                          Icon(Icons.visibility_off_sharp,color: Colors.grey,size: 30,),
                        ),
                        prefixIcon:  SizedBox(
                          width: 50,
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(Icons.lock_rounded,size: 30,color: Colors.deepOrange,),
                              SizedBox(width: 3,),
                              Container(
                                height: 30,
                                width: 1,
                                color: Colors.deepOrange,
                              ),
                            ],
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(color: Colors.deepOrange)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(color: Colors.blueAccent)
                        )
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).unfocus();
                    },
                    validator: (String? value) {
                      const pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      final regex = RegExp(pattern);

                      if(value!.isNotEmpty && !regex.hasMatch(value) ){
                        return _isSignedIn? null:'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),

            Container(alignment:Alignment.centerLeft,padding:EdgeInsets.only(left: 10,right: 10),child: Text('Confirm Password',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 5,),
            Row(
              children: <Widget>[
                SizedBox(width: 2,),
                Expanded(
                  child: TextFormField(
                    obscureText: _isVisible2?false:true,
                    onTap: (){
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    },
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB71C1C))
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _isVisible2 =!_isVisible2;
                            });
                          },
                          child: _isVisible2?Icon(Icons.visibility,color: Colors.deepOrange,size: 30,):
                          Icon(Icons.visibility_off_sharp,color: Colors.grey,size: 30,),
                        ),
                        prefixIcon:  SizedBox(
                          width: 50,
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(Icons.lock_rounded,size: 30,color: Colors.deepOrange,),
                              SizedBox(width: 3,),
                              Container(
                                height: 30,
                                width: 1,
                                color: Colors.deepOrange,
                              ),
                            ],
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(color: Colors.deepOrange)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(color: Colors.blueAccent)
                        )
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).unfocus();
                    },
                    validator: (String? value) {
                      const pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      final regex = RegExp(pattern);

                      if(value!.isNotEmpty && !regex.hasMatch(value)){
                        return _isSignedIn? null:'Invalid password!';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
              },
              child: Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
                ),
                child: Center(
                  child: Text(
                    'Change Password',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),

            GestureDetector(
              onTap: (){
                   Navigator.pop(context);
              },
              child: Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.deepOrange,width: 1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ),
            )
           ],
          ),
      ),
     );
  }
}



class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SampleItem? selectedItem;

  Gender? selectedGender;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5,top: 40),
            alignment: Alignment.topLeft,
            color: Colors.deepOrange,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,color: Colors.white,)),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 710,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _SignUpInputPage,
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _SignUpInputPage => Container(
    padding: EdgeInsets.only(top: 60,left: 20,right: 15),
    alignment: Alignment.center,
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Username',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 5,),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange,width: 1),
          ),
          child: const Row(
            children: <Widget>[
              SizedBox(width: 2,),
              Icon(Icons.person,size: 35,color: Colors.deepOrange,),
              VerticalDivider(
                width: 5,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),

              SizedBox(width: 5,),

              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20,),

        Align(
            alignment: Alignment.centerLeft,
            child: Text('E-mail',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 5,),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange,width: 1),
          ),
          child: const Row(
            children: <Widget>[
              SizedBox(width: 2,),
              Icon(Icons.email_rounded,size: 35,color: Colors.deepOrange,),
              VerticalDivider(
                width: 5,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 5,),
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Example@gmail.com',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20,),

        Align(
            alignment: Alignment.centerLeft,
            child: Text('Phone',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 5,),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange,width: 1),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 2,),
              Icon(Icons.phone,size: 35,color: Colors.deepOrange,),
              VerticalDivider(
                width: 5,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),

              CountryCodePicker(
                padding: EdgeInsets.only(bottom: 0,top: 5),
                onChanged: print,
                showFlag:false,
                initialSelection: 'IN',
                favorite: ['+91','IN'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
              ),

              VerticalDivider(
                width: 0,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),

              SizedBox(width: 5,),

              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20,),

        Align(
            alignment: Alignment.centerLeft,
            child: Text('Password',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 5,),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange,width: 1),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Icon(Icons.lock_rounded,size: 30,color: Colors.deepOrange,),
              const VerticalDivider(
                width: 10,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),
              Expanded(
                child: _isVisible1?const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ):
                const TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(width: 5,),

              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  setState(() {
                    _isVisible1 =!_isVisible1;
                  });
                },
                child: _isVisible1?Icon(Icons.visibility,color: Colors.deepOrange,size: 30,):
                Icon(Icons.visibility_off_sharp,color: Colors.grey,size: 30,),
              ),
              SizedBox(width: 5,)
            ],
          ),
        ),

        SizedBox(height: 20,),

        const Align(
            alignment: Alignment.centerLeft,
            child: Text('Confirm Password',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 5,),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange,width: 1),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Icon(Icons.lock_rounded,size: 30,color: Colors.deepOrange,),
              const VerticalDivider(
                width: 10,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),
              Expanded(
                child: _isVisible2?const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ):
                const TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  setState(() {
                    _isVisible2 =!_isVisible2;
                  });
                },
                child: _isVisible2?Icon(Icons.visibility,color: Colors.deepOrange,size: 30,):
                Icon(Icons.visibility_off_sharp,color: Colors.grey,size: 30,),
              ),
              SizedBox(width: 5,)
            ],
          ),
        ),

        SizedBox(height: 20,),

        const Align(
            alignment: Alignment.centerLeft,
            child: Text('Location',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 5,),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange,width: 1),
          ),
          child: const Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Icon(Icons.location_pin,size: 30,color: Colors.deepOrange,),
              VerticalDivider(
                width: 10,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Colors.deepOrange,
              ),
              Expanded(
                child:
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 5,),
            ],
          ),
        ),

        SizedBox(height: 20,),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Gender',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),
              
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange,width: 1),
                    ),
                    child: Row(
                      children: <Widget>[

                        PopupMenuButton<Gender>(
                          icon: Icon(Icons.arrow_drop_down_outlined,size: 30,color: Colors.deepOrange,),
                          initialValue: selectedGender,
                          onSelected: (Gender item) {
                            setState(() {
                              selectedGender= item ;
                            });
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<Gender>>[
                            const PopupMenuItem<Gender>(
                              value: Gender.Gender1,
                              child: Text('Male'),
                            ),
                            const PopupMenuItem<Gender>(
                              value: Gender.Gender2,
                              child: Text('Female'),
                            ),
                          ],
                        ),

                        VerticalDivider(
                          width: 0,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: Colors.deepOrange,
                        ),

                        SizedBox(width: 10,),

                        Expanded(
                          child: Text(selectedGender == null?'your gender':selectedGender==Gender.Gender2?'female':'Male',
                                style:selectedGender ==null? TextStyle(color: Colors.grey,fontSize: 15):TextStyle(color: Colors.black,fontSize: 15),
                          ),
                        ),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 20,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Date of Birth',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),)),

                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange,width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 5,),
                        GestureDetector(
                            onTap: (){
                              _selectDate(context);
                            },
                            child: Icon(Icons.date_range_rounded,size: 30,color: Colors.deepOrange,)),
                        VerticalDivider(
                          width: 10,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: Colors.deepOrange,
                        ),
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'DD/MM/YY',
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),

                        SizedBox(width: 5,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 30,),

        GestureDetector(
          onTap: (){

          },
          child: Container(
            width: 280,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3,offset: Offset(2,2)),],
            ),
            child: Center(
              child: Text(
                'Sign Up',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
              ),
            ),
          ),
        ),
      ],
    ),
  );
 }