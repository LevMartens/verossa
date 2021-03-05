import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:verossa/Features/News_Letter_Form/Domain/Use_Cases/Set_Email_To_Mailing_List.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/User_Auth/Domain/Entities/Current_User.dart';
import 'package:verossa/Features/User_Auth/Domain/Use_Cases/Get_Current_User_Details.dart';
import 'package:verossa/Features/User_Auth/Domain/Use_Cases/Get_User.dart';
import 'package:verossa/Features/User_Auth/Domain/Use_Cases/Set_Current_User_Details.dart';




class UserProvider extends ChangeNotifier {
  final GetUser getUser;
  final GetCurrentUserDetails getCurrentUserDetails;
  final SetCurrentUserDetails setCurrentUserDetails;
  final InputConverter inputConverter;
  final FirebaseAuth auth;

  User currentUser;
  Map<String,String> currentUserDetailsMap = {};
  bool currentlyOnResetPassword = false;
  bool currentlyOnChangeDetails = false;
  double containerHeightForPersonalPage = 580;

  UserProvider({
    @required GetUser getUser,
    @required GetCurrentUserDetails getCurrentUserDetails,
    @required SetCurrentUserDetails setCurrentUserDetails,
    @required this.auth,
    @required this.inputConverter,
  })  : assert(getUser != null),
        assert(inputConverter != null),
        assert(getCurrentUserDetails != null),
        assert(setCurrentUserDetails != null),
        assert(auth != null),
        getUser = getUser,
        getCurrentUserDetails = getCurrentUserDetails,
        setCurrentUserDetails = setCurrentUserDetails;

  void resetPassword(String email) {
    auth.sendPasswordResetEmail(email: email);
  }
  void setContainerHeightPersonalPage(double height) {
   containerHeightForPersonalPage = height;
  }

  Future<String> loginUser(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        getCurrentUserDetailsFromFB();
       return 'Great Success';
      } else {
      return 'Failed to login';}
    } catch (e){
      return '$e';
      }
  }

  void setCurrentlyOnResetPasswordTo(bool bool) {
    currentlyOnResetPassword = bool;
    notifyListeners();
  }
  void setCurrentlyOnChangeDetailsTo(bool bool) {
    currentlyOnChangeDetails = bool;
    notifyListeners();
  }

  Future<void> getUserFromFB() async  {
    currentUser = auth.currentUser;
  if (currentUser == null) {
    print('No User Logged In');
  } else {
    getCurrentUserDetailsFromFB();
  }
  }

  Future<void> getCurrentUserDetailsFromFB() async {
    final failureOrUserDetails = await getCurrentUserDetails(Params(uid: currentUser.uid));
    final newUserDetails = failureOrUserDetails.fold((failure) => {}, (map) => map.currentUserDetails);

    if (newUserDetails == {}) {
      print('Error: Fetching User data from FS');
    } else {
      currentUserDetailsMap = newUserDetails;
    }
    notifyListeners();

  }

  Future<void> setCurrentUserDetailsToFB(Map<String,String> newUserDetailsMap) async  {
     setCurrentUserDetails(Params(map: newUserDetailsMap, uid: currentUser.uid));
  }

  Future<String> createNewUser(String email, String password, String firstName, String lastName) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        currentUser = auth.currentUser;

        currentUserDetailsMap = {
          'firstName': firstName,
          'lastName': lastName,
          'fullName': '$firstName $lastName',
          'email': email,
        };

        await setCurrentUserDetailsToFB(currentUserDetailsMap);
        notifyListeners();

        return 'Great Success';
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<String> logOutUser() async {
    await auth.signOut();
    getUserFromFB();

    if (currentUser == null) {
      currentUserDetailsMap = {};
      return 'Great Success';
    } else {return 'Something went wrong';}

  }

  void temporaryChangeInUserDetails(Map<String,String> temporaryDetailsMap) {

    currentUserDetailsMap = temporaryDetailsMap;
    notifyListeners();
  }

  Future<Map<String,String>> returnCurrentUserDetailsMap() async {

    return currentUserDetailsMap;
  }


}