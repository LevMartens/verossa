import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';


class ContactTextFormFields extends StatefulWidget {
  @override
  _ContactTextFormFieldsState createState() => _ContactTextFormFieldsState();
}

class _ContactTextFormFieldsState extends State<ContactTextFormFields> {
  final textControllerForShipEmail = TextEditingController();
  final textControllerForShipFistName = TextEditingController();
  final textControllerForShipLastName = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Map<String,String> currentUserDetailsMap = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
        child: Row(
          children: [
            Text('Contact', style: TextStyle(fontWeight: FontWeight.w300),),
            Spacer(),
            GestureDetector(
              onTap: () {
                currentUserDetailsMap['address'] = null;
                currentUserDetailsMap['email'] = null;
                Provider.of<CheckOutProvider>(context, listen: false).setAllFormsAreCompleted(false);
                Provider.of<CheckOutProvider>(context, listen: false).setContainerHeightWhenUserLoggedInAndFormShowing(800);
                Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetailsMap);
                Provider.of<CheckOutProvider>(context, listen: false).notifyCheckOutListeners();
              },
              child: currentUserDetailsMap['email'] != null ? Text('Change') : Container(),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
        child: GestureDetector(
          child: currentUserDetailsMap['email'] != null ? Text('${currentUserDetailsMap['firstName']} ${currentUserDetailsMap['lastName']} / ${currentUserDetailsMap['email']}') : Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      maxLines: 1,
                      controller: textControllerForShipFistName,
                      autofillHints: [AutofillHints.givenName],
                      decoration: const InputDecoration(
                        hintText: 'First name',
                        hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      maxLines: 1,
                      controller: textControllerForShipLastName,
                      autofillHints: [AutofillHints.familyName],
                      decoration: const InputDecoration(
                        hintText: 'Last name',
                        hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      maxLines: 1,
                      controller: textControllerForShipEmail,
                      autofillHints: [AutofillHints.email],
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
    );
  }
}
