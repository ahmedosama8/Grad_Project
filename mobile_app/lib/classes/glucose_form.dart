import 'dart:convert';

List<Gluform> gluformFromJson(String str) =>
    List<Gluform>.from(json.decode(str).map((x) => Gluform.fromJson(x)));

String gluformToJson(List<Gluform> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gluform {
  int glucoseId;
  DateTime examinationDate;
  String comments;
  int rbc;
  int rbs;

  Gluform({
    required this.glucoseId,
    required this.examinationDate,
    required this.comments,
    required this.rbc,
    required this.rbs,
  });

  factory Gluform.fromJson(Map<String, dynamic> json) => Gluform(
        glucoseId: json["glucose_id"],
        examinationDate: DateTime.parse(json["examination_Date"]),
        comments: json["comments"],
        rbc: json["rbc"],
        rbs: json["rbs"],
      );

  Map<String, dynamic> toJson() => {
        "glucose_id": glucoseId,
        "examination_Date":
            "${examinationDate.year.toString().padLeft(4, '0')}-${examinationDate.month.toString().padLeft(2, '0')}-${examinationDate.day.toString().padLeft(2, '0')}",
        "comments": comments,
        "rbc": rbc,
        "rbs": rbs,
      };
}
