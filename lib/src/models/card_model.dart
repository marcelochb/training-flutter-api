import 'package:pocket/src/models/foreignNames_model.dart';

class ModelOfCard {
  String name;
  String type;
  String rarity;
  String text;
  String artist;
  String imageUrl;
  String id;
  List<ModelOfForeignNames> foreignNames;

  ModelOfCard(
      {this.name = '',
      this.id = '',
      this.type = '',
      this.rarity = '',
      this.text = '',
      this.artist = '',
      this.imageUrl = '',
      this.foreignNames});

  ModelOfCard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    rarity = json['rarity'];
    text = json['text'];
    artist = json['artist'];
    imageUrl = json['imageUrl'];
    if (json['foreignNames'] != null) {
      foreignNames = [].cast<ModelOfForeignNames>();
      json['foreignNames'].forEach((v) {
        final _foreignName = ModelOfForeignNames.fromJson(v);
        foreignNames.add(_foreignName);
      });
    }
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
    if (this.foreignNames != null) {
      data['foreignNames'] = this.foreignNames.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
