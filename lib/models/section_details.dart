
import 'dart:ui';

import 'package:flutter/material.dart';

class SectionDetails extends StatefulWidget {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;
  SectionDetails(this.sectionId,this.count,this.description,this.reference,this.content);
  SectionDetails.fromMap(Map <String,dynamic> map){
    this.sectionId = map['section_id'];
    this.count = map['count'];
    this.description = map['description'];
    this.reference = map['reference'];
    this.content = map['content'];
  }

  @override
  State<SectionDetails> createState() => _SectionDetailsState();
}

class _SectionDetailsState extends State<SectionDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.content!,textDirection: TextDirection.rtl,style: TextStyle(wordSpacing:2,height: 2,fontSize: 28,fontFamily:'Tajawal',color: Colors.teal),),
          //Align(alignment:Alignment.bottomCenter,child: Text(widget.description!,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 22,fontFamily:'Tajawal'))),
          Container(height:screenHeight/20,child: Align(alignment:Alignment.bottomCenter,child: Text(widget.reference!,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontFamily:'Tajawal')))),
        ],
      ),
    );
  }
}
