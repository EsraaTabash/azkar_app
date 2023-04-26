class SectionDetails{
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
}