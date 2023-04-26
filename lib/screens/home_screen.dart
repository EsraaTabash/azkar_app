import 'dart:convert';
import 'dart:developer';
import 'package:azkar_app/models/section.dart';
import 'package:azkar_app/screens/section_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Section>sections=[];

  @override
  void initState() {
    super.initState();
    loadSections();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أذكـــار المُســـلم",),
        centerTitle: true,
        elevation: 0 ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: sections.length,
            itemBuilder: (context,index)=> buildSectionItem(section :sections[index])
        )
          //(
          // children: [
          //   buildSectionItem(text: "أذكار الصبــاح"),
          //   buildSectionItem(text: "أذكار المســـاء"),
          //   buildSectionItem(text: "أذكار الصــلاة"),
          // ],
        //),
      ),
    );
  }
  Widget buildSectionItem({required Section section}){
    return InkWell(
      onTap: (){
        //log("clicked $text");
        //log("clicked ${section.id}");
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SectionDetailsScreen(id: section.id!,title: section.name!,)));
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 12),
        width: double.infinity,
        height: 100,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightGreenAccent,
              Colors.green,
              Colors.lightGreenAccent,
            ]
          )
        ),
        child: Center(
          child: Text(section.name.toString(),style: const TextStyle(color: Colors.white,fontSize: 18))
        ),
      ),
    );
  }

  loadSections()async{
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data){
      var response = json.decode(data);
      response.forEach((section) {
        Section sectionObj = Section.fromMap(section);
        //log(sectionObj.name.toString());
        sections.add(sectionObj);
      });
      setState(() {});
    });
  }
}
