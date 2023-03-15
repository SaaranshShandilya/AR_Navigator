import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import '../models/Museum.dart';
final dio = Dio();

class MuseumDescription extends StatefulWidget {
  MuseumDescription({Key? key, required this.id}) : super(key: key);
  final String id;
  static String routeName = "/description";
  @override
  _MuseumDescription createState() => _MuseumDescription();
}

class _MuseumDescription extends State<MuseumDescription>{
  
  @override
  Widget build(BuildContext context){
    print(widget.id);
    return Scaffold(
      
    );
  }
}