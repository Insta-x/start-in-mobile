class AddedCourse {
  String? model;
  int? pk;
  Fields? fields;

  AddedCourse({this.model, this.pk, this.fields});

  AddedCourse.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  String? courseName;
  String? courseUrl;
  String? thumbnail;

  Fields({this.courseName, this.courseUrl, this.thumbnail});

  Fields.fromJson(Map<String, dynamic> json) {
    courseName = json['course_name'];
    courseUrl = json['course_url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_name'] = this.courseName;
    data['course_url'] = this.courseUrl;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}