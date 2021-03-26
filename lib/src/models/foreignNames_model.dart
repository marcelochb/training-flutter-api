class ModelOfForeignNames {
  String name;
  String text;
  String type;
  String flavor;
  String imageUrl;
  String language;
  int multiverseid;

  ModelOfForeignNames(
      {this.name,
      this.text,
      this.type,
      this.flavor,
      this.imageUrl,
      this.language,
      this.multiverseid});

  ModelOfForeignNames.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    type = json['type'];
    flavor = json['flavor'];
    imageUrl = json['imageUrl'];
    language = json['language'];
    multiverseid = json['multiverseid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['text'] = this.text;
    data['type'] = this.type;
    data['flavor'] = this.flavor;
    data['imageUrl'] = this.imageUrl;
    data['language'] = this.language;
    data['multiverseid'] = this.multiverseid;
    return data;
  }
}
