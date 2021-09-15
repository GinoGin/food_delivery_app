import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/home_screen.dart';



class LoginScreen extends StatefulWidget {
  
  

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  String _email="";
  String _password="";


  

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap:()=> FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Stack(
                  children: [
                    Image.asset(bgimg,
                    height: height*0.35,
                    width: width,
                    fit: BoxFit.cover,),
                    Container(
                      height: height*0.36,
                      width: width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                          Colors.transparent,
                          Colors.white,
                        ])
                      ),
                    )
                  ],
                ),
                Center(child: Text(appName, style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),)),
                Center(child: Text(slogan)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    child: Text(' $loginString', style: TextStyle(fontSize: 23),),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.lightGreenAccent,Colors.white]),
                    ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: TextFormField(
                      onSaved: (value){
                        _email=value!;
                       
                      },
                      validator: (email){
                        if (email!.isEmpty) return "Please enter valid email";
                        else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                          return "It's not a valid email";
                        }
                        print("validator: $email");
                        return null;
                                                
                      },
                      
                      keyboardType: TextInputType.emailAddress,
                      
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Colors.lightGreen,),
                        labelText: "Email Address" ,
                        labelStyle: TextStyle(color: Colors.lightGreen),
                        
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: TextFormField(
                      onSaved: (value){
                        _password=value!;
                      },
                      
                      validator: (password){
                        if(password!.isEmpty) return "Please enter password";
                        else if(password.length<8) return 'minimum length should be 8 characters';
                        else if(password.length>15) return 'maximum length should be 15 characters';
                        
                        else{ 
                          print("Validator: $password");
                          return null;}
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open,color: Colors.lightGreen,),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.lightGreen),
                
                      ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                   child: FlatButton(onPressed: (){}, 
                  child: Text('Forget Password ?',style:TextStyle(color: Colors.red),),
                ),
                ),
                Center(
                  child:SizedBox
                  (
                    height: height*0.06,
                    width: width-40,
                  
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.lightGreen,
                      onPressed: (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                           
                            print("valid");
                            if(_email=="gino@gmail.com" && _password=="gino1234"){
                              print("you are logged in");
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            }
                            else print("invalid email and password");
                            
                          }
                          else print("not Valid");
                          
                      },
                       child: Text('Login to account',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),
                      ),),
                      ),) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      FlatButton(onPressed: (){}, 
                      child: Text("Create Account", style: TextStyle(color: Colors.green,fontSize: 17.0),),),
                    ],
                  )
                  
                
              ],
            ),
          ),
        ),
      ),
    );
      
}
}