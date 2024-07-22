//  {
//         "_id": "64f19a45f2526bcb4cb9f680",
//         "title": "Backend Developer",
//         "location": "Seattle",
//         "company": "Facebook, Inc.",
//         "salary": "160k",
//         "contract": "Full time",
//         "modality": "Remote",
//         "status": "Open",
//         "imageUrl": "https://img.freepik.com/premium-vector/blue-social-media-logo_197792-1759.jpg",
//         "agentId": "64f0310e387a1bf97bdc9869",
//         "date": "2023-09-01T08:01:09.467Z",
//     },

import 'package:equatable/equatable.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobHomeModel extends Equatable {
  final String id;
  final String title;
  final String location;
  final String company;
  final String salary;
  final String contract;
  final String modality;
  final String status;
  final String imageUrl;
  final String agentId;
  final String date;
  final String description;

  const JobHomeModel(
    this.id,
    this.title,
    this.location,
    this.company,
    this.salary,
    this.contract,
    this.status,
    this.imageUrl,
    this.agentId,
    this.date,
    this.modality,
    this.description,
  );

  factory JobHomeModel.fromJson(Map<String, dynamic> json) {
    return JobHomeModel(
      json['_id'],
      json['title'],
      json['location'],
      json['company'],
      json['salary'],
      json['contract'],
      json['status'],
      json['imageUrl'],
      json['agentId'],
      timeago.format(DateTime.parse(json['date'])),
      json['modality'],
      json['description'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        location,
        company,
        salary,
        contract,
        status,
        imageUrl,
        agentId,
        date,
        modality,
        description,
      ];
}
