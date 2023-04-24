class MindModel {
  String? mind;
  String? author;

  MindModel({this.author, this.mind});

  factory MindModel.fromJson(Map<String, dynamic> json) {
    return MindModel(
        author: json["author"] ?? "Hech kim",
        mind: json["mind"] ?? "Hech nima demagan");
  }

  toJson() {
    return {"mind": mind, "author": author};
  }
}
