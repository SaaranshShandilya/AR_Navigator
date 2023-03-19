import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:frontend/components/custom_surfix_icon.dart';
import 'package:frontend/screens/museum_registration.dart';
import 'package:frontend/screens/owner_registration.dart';
import 'package:frontend/screens/sign_in/components/sign_form.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
import 'package:frontend/screens/write_review.dart';
import 'package:frontend/models/Desc.dart';

final dio = Dio();

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? id;
  String? name;

  void save() async{
    var params ={
      "email":email,
      "password":password,
    };
    Response response = await dio.post('https://cf64-2401-4900-1c52-2b33-f87d-8874-da4f-7372.in.ngrok.io/api/museumOwner/login',
    data: jsonEncode(params));
    print(response.data['userData']['museum']['id']);
    setState(() {
      id = response.data['userData']['museum']['id'];
      name =response.data['userData']['museum']['museumName'];
    });
    // print('nasnasjn ios r${response.data['id']}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body:ListView(
        padding:EdgeInsets.only(left: 10, right: 10, top:20),
        children: [
          Container(
            margin: EdgeInsets.only(top:40),
            alignment: Alignment.center,
            child: Column(children: [
              Text('Welcome', style:TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600)),
              Text('Sign in to your museum', style:TextStyle(color: Color(0xff1ce0e2), fontSize: 15, fontWeight: FontWeight.w400))
              ])
          ),
          SizedBox(height:100),
          Form(
            key:_formKey,
            child:Column(
              children:[
                TextFormField(
                  style:TextStyle(color:Colors.white),
                  // obscureText: true,
                  onSaved:(newValue)=>email = newValue,
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Email Id",
                    filled:true,
                    fillColor: Color(0xff1a1a1a),
                    labelStyle: TextStyle(color:Color(0xfffa256a)),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: Icon(Icons.mail)

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: TextFormField(
                  style:TextStyle(color:Colors.white),
                  obscureText: true,
                  onSaved:(newValue)=>email = newValue,
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled:true,
                    fillColor: Color(0xff1a1a1a),
                    labelStyle: TextStyle(color:Color(0xfffa256a)),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: Icon(Icons.lock)
                  ),
                ),
                ),
                SizedBox(height:50),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Owner()));
                  },
                  child:Container(
                  child:Text("New here? Sign up as an owner now", style:TextStyle(color:Color(0xfffa256a,),fontSize:15 ))
                ),
                ),
                SizedBox(height:30),
                GestureDetector(
                  onTap: (){
                    save();
                    
                  },
                  child:Container(
                    margin:EdgeInsets.only(top:20, left:8, right: 8),
                  padding:EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:Color(0xfffa256a),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child:Text('Submit', style: TextStyle(color:Colors.white, fontSize: 16),)
                  )
                )
              ]
            )
          )

        ],
      )
    );
  }
}