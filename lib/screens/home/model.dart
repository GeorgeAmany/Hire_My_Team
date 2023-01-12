class JobDetails {
  JobDetails({
    required this.companies,
    required this.jobs,
  });

  late final List<String> companies;
  late final List<String> jobs;

  JobDetails.fromJson(Map<String, dynamic> json) {
    companies = List.castFrom<dynamic, String>(json['companies']);
    jobs = List.castFrom<dynamic, String>(json['jobs']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['companies'] = companies;
    _data['jobs'] = jobs;
    return _data;
  }
}
