// {
//     "_id": "64ee28639ea08fd7e1bbfae3",
//     "username": "Hung Long",
//     "email": "test2@gmail.com",
//     "isAdmin": false,
//     "isAgent": false,
//     "skills": [
//         "Flutter",
//         "Dart"
//     ],
//     "avatar": "https://plus.unsplash.com/premium_photo-1675034393500-dc5fe64b527a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
//     "createdAt": "2023-08-29T17:18:27.554Z",
//     "updatedAt": "2023-08-31T05:33:06.091Z",
//     "__v": 0
// }

import 'package:equatable/equatable.dart';

class UserProfileModel extends Equatable {
  final String username;
  final String email;
  final String avatar;
  final List<String> skills;
  final bool isAdmin;
  final bool isAgent;

  const UserProfileModel(
    this.username,
    this.email,
    this.avatar,
    this.skills,
    this.isAdmin,
    this.isAgent,
  );

  // get list of skills
  String get skill => skills.join(', ');

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      json['username'],
      json['email'],
      json['avatar'],
      List<String>.from(json['skills'] ?? []),
      json['isAdmin'],
      json['isAgent'],
    );
  }

  @override
  List<Object?> get props => [
        username,
        email,
        avatar,
        skills,
        isAdmin,
        isAgent,
      ];
}
