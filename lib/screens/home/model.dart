class JobDetailsModel {
  JobDetailsModel({
    required this.companies,
    required this.jobs,
    required this.description,
  });

  late final List<String> companies;
  late final List<String> jobs;
  late final List<String> description;

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    companies = List.castFrom<dynamic, String>(json['companies']);
    jobs = List.castFrom<dynamic, String>(json['jobs']);
    description = List.castFrom<dynamic, String>(json['description']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['companies'] = companies;
    _data['jobs'] = jobs;
    _data['description'] = description;
    return _data;
  }
}
