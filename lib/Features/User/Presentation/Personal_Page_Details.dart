import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';

class PersonalPageDetails extends StatefulWidget {
  @override
  _PersonalPageDetailsState createState() => _PersonalPageDetailsState();
}

class _PersonalPageDetailsState extends State<PersonalPageDetails> {

  bool apartmentIsNull = true;
  double containerHeight = 300;
  double apartmentHeight() {
    if (apartmentIsNull == false) {return 30;} else {return 0;}
  }
  double apartmentHeightForSizedBox() {
    if (apartmentIsNull == false) {return 8;} else {return 0;}
  }
  @override
  Widget build(BuildContext context) {

    Map<String,String> currentUserDetails = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    containerHeight = Provider.of<UserProvider>(context, listen: true).containerHeightForPersonalPage;
    String  _apartment = currentUserDetails['apartment'];
    if(_apartment == null) {apartmentIsNull = true;}
    String _address = currentUserDetails['address'];
    String _place = currentUserDetails['place'];
    String _postcode = currentUserDetails['postcode'];
    String _country = currentUserDetails['country'];
    String _state = currentUserDetails['state'];

    return Container(
      height: containerHeight,
      width: 400,
      color: Colors.transparent,
      child: Column(
      children: [
        SizedBox(height: apartmentHeightForSizedBox()),
        Container(
          height: apartmentHeight(),
          width: 300,
          child: Text(
            '$_apartment'
            , textAlign: TextAlign.left,
            style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 300,
          child: Text(
            '$_address'
            , textAlign: TextAlign.left,
            style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 300,
          child: Text(
            '$_place'
            , textAlign: TextAlign.left,
            style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 300,
          child: Text(
            '$_postcode'
            , textAlign: TextAlign.left,
            style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 300,
          child: Text(
            '$_country'
            , textAlign: TextAlign.left,
            style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 300,
          child: Text(
            '$_state'
            , textAlign: TextAlign.left,
            style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: TextButton(
            onPressed: () async {

                currentUserDetails['apartment'] = null;
                currentUserDetails['address'] = null;
                currentUserDetails['place'] = null;
                currentUserDetails['postcode'] = null;
                currentUserDetails['country'] = null;
                currentUserDetails['state'] = null;

                Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetails);
                Provider.of<UserProvider>(context, listen: false).setContainerHeightPersonalPage(580);
                Provider.of<UserProvider>(context, listen: false).setCurrentlyOnChangeDetailsTo(true);

            },
            child: Text(
              'CHANGE ADDRESS',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    ),
    );
  }
}
