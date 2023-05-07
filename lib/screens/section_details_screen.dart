
import 'dart:convert';
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
  int currentPageIndex = 0;
  PageController pc = PageController();

  @override
  void initState() {
    super.initState();
    loadSectionsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style:TextStyle(fontFamily: 'Tajawal'),),),
      body:
      //Center(child: Text("${widget.id}")),
      Padding(
        padding: EdgeInsets.all(12),
        child:
        // ListView.separated(
        //     physics: BouncingScrollPhysics(),
        //     itemBuilder: (context,index){
        //   return Container(
        //     padding: EdgeInsetsDirectional.all(5),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey.withOpacity(.5),
        //           spreadRadius: 5,
        //           blurRadius: 7,
        //           offset: Offset(0,3)
        //         )
        //       ]
        //     ),
        //     child: ListTile(
        //       subtitle: Text("${sectionsDetails[index].content!} \n ${sectionsDetails[index].reference!}" ,textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'Tajawal',fontSize: 20
        //
        //       ),),
        //     ),
        //   );
        // }, separatorBuilder: (context,index){
        //   return Divider(
        //     height: 1,
        //     color: Colors.grey.withOpacity(.8),
        //   );
        // }, itemCount: sectionsDetails.length),
        PageView(
        controller: pc,
        onPageChanged: (v){
        currentPageIndex = v;
        setState(() {});},
        children:[
          ...sectionsDetails.map((e) {
            return SectionDetails(e.sectionId, e.count, e.description, e.reference, e.content);
      }).toList()
        ],
      )
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

