class Section{
  int? id;
  String? name;
  Section(this.name,this.id);
  Section.fromMap(Map <String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
  }
}