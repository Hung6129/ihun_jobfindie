// {
//     "_id": "667533cae7a28cf8cbabae7c",
//     "username": "Long Tran",
//     "email": "longtran@gmail.com",
//     "isAdmin": false,
//     "isAgent": false,
//     "skills": [
//         "Flutter",
//         "Swift",
//         "Firebase",
//         "Java",
//         "NodeJS",
//         "Python"
//     ],
//     "avatar": "https://bit.ly/4cWua0j",
//     "bio": "My name is Long Tran. I am a software engineer. I have been working in the software industry
//  for 5 years. I have experience in developing mobile applications using Flutter, Swift, and Java.
//  I also have experience in developing web applications using NodeJS and Python.
//  I am passionate about technology and always eager to learn new things.",
//     "location": "Ho Chi Minh City, Vietnam",
//     "resumeFileName": "",
//     "socialList": [],
//     "phoneNum":"0336965267"
// }

import 'package:equatable/equatable.dart';

class UserProfileModel extends Equatable {
  final String username;
  final String email;
  final String avatar;
  final List<String> skills;
  final bool isAdmin;
  final bool isAgent;
  final String bio;
  final String resumeFileName;
  final String resumeFileUrl;
  final List<String> socialList;
  final String location;
  final String phoneNum;

  const UserProfileModel(
    this.username,
    this.email,
    this.avatar,
    this.skills,
    this.isAdmin,
    this.isAgent,
    this.bio,
    this.resumeFileName,
    this.resumeFileUrl,
    this.socialList,
    this.location,
    this.phoneNum,
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
      json['bio'],
      json['resumeFileName'],
      json['resumeFileUrl'],
      List<String>.from(json['socialList'] ?? []),
      json['location'],
      json['phoneNum'],
    );
  }

  UserProfileModel copyWith({
    String? username,
    String? email,
    String? avatar,
    List<String>? skills,
    bool? isAdmin,
    bool? isAgent,
    String? bio,
    String? resumeFileName,
    String? resumeFileUrl,
    List<String>? socialList,
    String? location,
    String? phoneNum,
  }) {
    return UserProfileModel(
      username ?? this.username,
      email ?? this.email,
      avatar ?? this.avatar,
      skills ?? this.skills,
      isAdmin ?? this.isAdmin,
      isAgent ?? this.isAgent,
      bio ?? this.bio,
      resumeFileName ?? this.resumeFileName,
      resumeFileUrl ?? this.resumeFileUrl,
      socialList ?? this.socialList,
      location ?? this.location,
      phoneNum ?? this.phoneNum,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'avatar': avatar,
      'skills': skills,
      'isAdmin': isAdmin,
      'isAgent': isAgent,
      'bio': bio,
      'resumeFileName': resumeFileName,
      'resumeFileUrl': resumeFileUrl,
      'socialList': socialList,
      'location': location,
      'phoneNum': phoneNum,
    };
  }

  @override
  String toString() {
    return 'UserProfileModel(username: $username, email: $email, avatar: $avatar, skills: $skills, isAdmin: $isAdmin, isAgent: $isAgent, bio: $bio, resumeFileName: $resumeFileName, resumeFileUrl: $resumeFileUrl, socialList: $socialList, location: $location, phoneNum: $phoneNum)';
  }

  @override
  List<Object?> get props => [
        username,
        email,
        avatar,
        skills,
        isAdmin,
        isAgent,
        bio,
        resumeFileName,
        resumeFileUrl,
        socialList,
        location,
        phoneNum,
      ];
}
