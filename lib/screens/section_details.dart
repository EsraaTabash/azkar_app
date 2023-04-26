
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/section_details.dart';

class SectionDetailsScreen extends StatefulWidget {
  int id;
  String title;
  SectionDetailsScreen({required this.id,required this.title});

  @override
  State<SectionDetailsScreen> createState() => _SectionDetailsScreenState();
}

class _SectionDetailsScreenState extends State<SectionDetailsScreen> {
  List<SectionDetails>sectionsDetails=[];

  @override
  void initState() {
    super.initState();
    loadSectionsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),),
      body:
      //Center(child: Text("${widget.id}")),
      Padding(
        padding: EdgeInsets.all(12),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: ListTile(
              title: Text(sectionsDetails[index].reference!,textDirection: TextDirection.rtl,),
              subtitle: Text(sectionsDetails[index].content!,textDirection: TextDirection.rtl,style: TextStyle(
                fontSize: 20
              ),),
            ),
          );
        }, separatorBuilder: (context,index){
          return Divider(
            height: 1,
            color: Colors.grey.withOpacity(.8),
          );
        }, itemCount: sectionsDetails.length),
      )
    );
  }
  loadSectionsDetails()async{
    sectionsDetails=[];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_details_db.json")
        .then((data){
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetails sectionDetailsObj = SectionDetails.fromMap(section);
        //log(sectionDetailsObj.content.toString());
       if(sectionDetailsObj.sectionId == widget.id){
         sectionsDetails.add(sectionDetailsObj);
       }
      });
      setState(() {});
    });
  }

}
