class MessageModel {
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  MessageModel({this.sender, this.text, this.seen, this.createdon});

  //map to object
  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
    seen = map["seen"];
    createdon = map["createdon"];
  }

  //object to map
  Map<String, dynamic> toMap() {
    return {
      "sender": sender,
      "text": text,
      "seen": seen,
      "createdon": createdon,
    };
  }
}
