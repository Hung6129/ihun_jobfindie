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
class UserPostModel extends Equatable {
  final String id;
  final String token;
  final String refreshToken;
  final String userName;
  final String email;

  const UserPostModel(
    this.id,
    this.token,
    this.refreshToken,
    this.userName,
    this.email,
  );

  factory UserPostModel.fromJson(Map<String, dynamic> json) {
    return UserPostModel(
      json['_id'],
      json['token'],
      json['refreshToken'],
      json['username'],
      json['email'],
    );
  }

  @override
  String toString() =>
      'UserPostModel(id: $id, token: $token, refreshToken: $refreshToken, userName: $userName, email: $email)';

  @override
  List<Object?> get props => [id, token, refreshToken, userName, email];
}
