


class UserDetails {

  String firstName;
  String lastName;
  String email;
  String street;
  String place;
  String postcode;
  String apartment;
  String country;
  String state;


  UserDetails.fromMap(Map<String, dynamic> data) {
firstName = data['FirstName'];
lastName = data['LastName'];
email = data['Email'];
street = data['Street'];
place = data['Place'];
postcode = data['Postcode'];
apartment = data['Apartment'];
country = data['Country'];
state = data['State'];
  }
}