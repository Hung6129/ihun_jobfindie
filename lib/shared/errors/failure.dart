import 'package:equatable/equatable.dart';

/// This typedef is used to define a function that returns a FutureEither
abstract class Failure extends Equatable {
  final String message;
  final String statusCode;
  const Failure(
    this.message,
    this.statusCode,
  );

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(String message, String statusCode)
      : super(message, statusCode);
}
