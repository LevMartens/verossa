import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NewsLetter extends Equatable {


  final String email;

  NewsLetter({
    @required this.email
  });

  @override
  List<Object> get props => [email];
}