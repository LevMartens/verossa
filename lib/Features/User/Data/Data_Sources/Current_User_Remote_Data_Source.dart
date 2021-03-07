import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Features/User/Data/Models/Current_User_Model.dart';

abstract class CurrentUserRemoteDataSource {
  Future<CurrentUserModel> getCurrentUserDetails(String uid);
  Future<User> getUser();
  Future<void> saveCurrentUserDetails(Map<String,String> map, String uid);
}




class CurrentUserRemoteDataSourceImpl implements CurrentUserRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  CurrentUserRemoteDataSourceImpl({@required this.firestore, @required this.auth});




  @override
  Future<User> getUser()  {
    final User user = auth.currentUser;
    if (user != null) {
      return Future.value(user);
    } else {
      throw CacheException();
    }

  }

  @override
  Future<void> saveCurrentUserDetails(Map<String, String> map, String uid) async {
    Map<String,dynamic> linkedHashMap = map.map((a, b) => MapEntry(a.toString(), b as dynamic));
    firestore.collection("UserData").doc(uid).set(linkedHashMap);

  }

  @override
  Future<CurrentUserModel> getCurrentUserDetails(String uid) async {
    final userDetails = await firestore.collection('UserData').doc(uid).get();

    Map<String,String> fsCurrentUserDetails;

    if (userDetails != null) {
      fsCurrentUserDetails = Map<String, String>.from(userDetails.data());
      return Future.value(CurrentUserModel.fromFireStore(fsCurrentUserDetails));
    } else {
      throw CacheException();
    }
  }
}