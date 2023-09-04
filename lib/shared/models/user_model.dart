import 'package:equatable/equatable.dart';

// {
//     "_id": "64f1b511439237b4e854438d",
//     "username": "Huyen tran",
//     "email": "test5@gmail.com",
//     "isAdmin": false,
//     "isAgent": false,
//     "skills": [
//         false
//     ],
//     "avatar": "bit.ly/3sHmdty",
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZjFiNTExNDM5MjM3YjRlODU0NDM4ZCIsImlzQWRtaW4iOmZhbHNlLCJpc0FnZW50IjpmYWxzZSwiaWF0IjoxNjkzNjUyNzg1LCJleHAiOjE2OTU0NjcxODV9.x5SX9XBqB13hm2pT5yZVxkT1TK-gXgHi3BirLFEp_3Y"
// }
class UserModel extends Equatable {
  final String id;
  final String token;
  final String avatar;

  const UserModel(
    this.id,
    this.token,
    this.avatar,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['_id'],
      json['token'],
      json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'token': token,
      'avatar': avatar,
    };
  }

  @override
  List<Object?> get props => [
        id,
        token,
        avatar,
      ];
}
