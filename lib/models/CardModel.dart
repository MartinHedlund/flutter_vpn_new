class CardModel {
  late String? title;
  late String img;
  late String? descrtiption;

  CardModel({
    this.title,
    required this.img,
    this.descrtiption,
  });

  @override
  toString() {
    return '''-----------------
    Title: ${title!}
    IMG: $img
    Desc: ${descrtiption!}
-----------------''';
  }

  CardModel.fromJson(Map<String, Object?> json)
      : this(
          img: json['img'] == null ? '' : json['img'] as String,
          title: json['title']! as String,
          descrtiption: json['descrtiption']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      if (title != null) 'title': title,
      if (img != null) 'img': img,
      if (descrtiption != null) 'descrtiption': descrtiption,
    };
  }
}
