// {
//     "_id": "64f19a45f2526bcb4cb9f680",
//     "title": "Backend Developer",
//     "location": "Seattle",
//     "company": "Facebook, Inc.",
//     "description": "We are seeking an experienced Backend Developer to join our team. The ideal candidate should have expertise in server-side development, API design, and database management, and be passionate about building scalable and efficient backend systems. Additionally, candidates should have experience in microservices architecture and containerization technologies.",
//     "salary": "160k",
//     "period": "year",
//     "contract": "Full time",
//     "requirement": [
//         "4 years experience in backend development",
//         "Expertise in API design",
//         "Experience with microservices architecture",
//         "Knowledge of containerization technologies"
//     ],
//     "status": "Open",
//     "imageUrl": "https://img.freepik.com/premium-vector/blue-social-media-logo_197792-1759.jpg",
//     "agentId": "64f0310e387a1bf97bdc9869",
//     "date": "2023-09-01T08:01:09.467Z",
//     "createdAt": "2023-09-01T08:01:09.468Z",
//     "updatedAt": "2023-09-01T08:01:09.468Z",
//     "__v": 0
// },

import 'package:equatable/equatable.dart';

class JobModel extends Equatable {
  final String id;
  final String title;
  final String location;
  final String company;
  final String description;
  final String salary;
  final String period;
  final String contract;
  final List<String> requirement;
  final String status;
  final String imageUrl;
  final String agentId;
  final String date;

  const JobModel(
    this.id,
    this.title,
    this.location,
    this.company,
    this.description,
    this.salary,
    this.period,
    this.contract,
    this.requirement,
    this.status,
    this.imageUrl,
    this.agentId,
    this.date,
  );

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      json['_id'],
      json['title'],
      json['location'],
      json['company'],
      json['description'],
      json['salary'],
      json['period'],
      json['contract'],
      json['requirement'].cast<String>(),
      json['status'],
      json['imageUrl'],
      json['agentId'],
      json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'location': location,
      'company': company,
      'description': description,
      'salary': salary,
      'period': period,
      'contract': contract,
      'requirement': requirement,
      'status': status,
      'imageUrl': imageUrl,
      'agentId': agentId,
      'date': date,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        location,
        company,
        description,
        salary,
        period,
        contract,
        requirement,
        status,
        imageUrl,
        agentId,
        date,
      ];
}
