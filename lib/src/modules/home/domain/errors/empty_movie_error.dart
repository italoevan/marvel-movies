import 'package:equatable/equatable.dart';
import 'package:gen/src/shared/domain/errors/failure.dart';

class EmptyMovieError extends Failure implements Equatable {
  EmptyMovieError({required super.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => null;
}
