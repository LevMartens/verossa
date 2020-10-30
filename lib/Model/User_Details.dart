


class UserDetails {

  String firstName;
  String lastName;
  String email;
  String street;
  String place;
  String postCode;

  UserDetails.fromMap(Map<String, dynamic> data) {
firstName = data['FirstName'];
lastName = data['LastName'];
email = data['Email'];
street = data['Street'];
place = data['Place'];
postCode = data['PostCode'];

  }
}