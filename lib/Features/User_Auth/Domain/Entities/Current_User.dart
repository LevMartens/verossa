import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CurrentUser extends Equatable {


  final Map<String, String> currentUserDetails;


  CurrentUser({
    @required this.currentUserDetails,
  });

  @override
  List<Object> get props => [currentUserDetails];
}