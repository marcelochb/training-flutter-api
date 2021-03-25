class CardListItemModel {
  String name;
  String type;
  String rarity;
  String text;
  String artist;
  String imageUrl;
  String id;

  CardListItemModel(
      {this.name = '',
      this.id = '',
      this.type = '',
      this.rarity = '',
      this.text = '',
      this.artist = '',
      this.imageUrl = ''});

  CardListItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    rarity = json['rarity'];
    text = json['text'];
    artist = json['artist'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['rarity'] = this.rarity;
    data['text'] = this.text;
    data['artist'] = this.artist;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
