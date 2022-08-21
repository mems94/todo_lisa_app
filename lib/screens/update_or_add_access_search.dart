import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakleko/components/show_popup_menu.dart';
import 'package:lakleko/constants/constants.dart';
import 'package:lakleko/models/lisa_access_item.dart';
import 'package:lakleko/models/lisa_login_model.dart';
import 'package:lakleko/screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:lakleko/utils/date_formatted.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateOrAddAccessSearch extends StatefulWidget {
  final LisaAccessItem accessForDb;
  final int id;
  final String actionTitle;
  UpdateOrAddAccessSearch(this.id, this.actionTitle, [this.accessForDb]);
  @override
  _UpdateOrAddAccessSearchState createState() =>
      _UpdateOrAddAccessSearchState();
}

class _UpdateOrAddAccessSearchState extends State<UpdateOrAddAccessSearch> {
  String todoDetails;
  String dateCreated;
  TextEditingController todoDetailsController = TextEditingController();
  bool stateId = false;
  var res;

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String notification) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xFF426E6D),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            notification,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }

  void initialisationData() {
    if (widget.id.isNegative) {
      todoDetailsController.text = '';
    } else {
      stateId = true;
//      var accessItem =
//          Provider.of<LisaLoginModel>(context).listAccess[widget.id];
      var accessItem = widget.accessForDb;
      todoDetailsController.text = accessItem.todoDetails;
    }
  }

  @override
  Widget build(BuildContext context) {
    initialisationData();
    return Scaffold(
      backgroundColor: Color(0xFF426E6D),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF426E6D),
            height: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        stateId
                            ? widget.accessForDb.todoDetails
                            : 'nouveau todo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CircleAvatar(
                    foregroundColor: Color(0xFF426E6D),
                    backgroundColor: Colors.white,
                    child: showPopupMenu(context),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 15.0,
              ),
              decoration: kBoxDecorationForFirstContainer.copyWith(
                color: Colors.white,
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      decoration: kInputDecorationListviewAddUpdate.copyWith(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Icon(
                            Icons.web,
                            color: Colors.grey.shade400,
                            size: 30.0,
                          ),
                        ),
                      ),
                      onChanged: (String site) {
                        todoDetails = site;
                      },
                      controller: todoDetailsController,
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 25.0),
                  //   child: TextField(
                  //     decoration: kInputDecorationListviewAddUpdate.copyWith(
                  //       hintText: 'Enter site URL : https://',
                  //       prefixIcon: Padding(
                  //         padding: EdgeInsets.only(
                  //           right: 15.0,
                  //         ),
                  //         child: Icon(
                  //           Icons.launch,
                  //           color: Colors.grey.shade400,
                  //           size: 30.0,
                  //         ),
                  //       ),
                  //     ),
                  //     onChanged: (String url) {
                  //       siteUrl = url;
                  //     },
                  //     controller: siteUrlController,
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 25.0),
                  //   child: TextField(
                  //     decoration: kInputDecorationListviewAddUpdate.copyWith(
                  //       hintText: 'Enter username',
                  //       prefixIcon: Padding(
                  //         padding: EdgeInsets.only(right: 15.0),
                  //         child: Icon(
                  //           Icons.person,
                  //           color: Colors.grey.shade400,
                  //           size: 30.0,
                  //         ),
                  //       ),
                  //     ),
                  //     onChanged: (String user) {
                  //       username = user;
                  //     },
                  //     controller: usernameController,
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 25.0),
                  //   child: TextField(
                  //     decoration: kInputDecorationListviewAddUpdate.copyWith(
                  //       hintText: 'Enter password',
                  //       prefixIcon: Padding(
                  //         padding: EdgeInsets.only(right: 15.0),
                  //         child: Icon(
                  //           Icons.vpn_key,
                  //           color: Colors.grey.shade400,
                  //           size: 30.0,
                  //         ),
                  //       ),
                  //     ),
                  //     onChanged: (String pass) {
                  //       password = pass;
                  //     },
                  //     controller: passwordController,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Builder(
                      builder: (context) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                color: Color(0xFF426E6D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                child: Text(
                                  '${widget.actionTitle.toUpperCase()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  if (widget.id.isNegative) {
                                    LisaAccessItem lisaAccessItem =
                                        LisaAccessItem.fromMap(
                                      {
                                        "todoStatus": 0,
                                        "todoDetails": todoDetails,
                                        "dateCreated": dateFormatted(),
                                      },
                                    );
                                    var addAccess = Provider.of<LisaLoginModel>(
                                        context,
                                        listen: false);
                                    res = await addAccess
                                        .addAccessItem(lisaAccessItem);
                                    print('Add access result : $res');
                                    _showToast("To do ajouté");
                                  } else {
                                    LisaAccessItem lisaAccessItem =
                                        LisaAccessItem.fromMap(
                                      {
                                        "id": widget.accessForDb.id,
                                        "todoDetails":
                                            todoDetailsController.text,
                                        "dateCreated": dateFormatted(),
                                      },
                                    );

                                    var updateAccess =
                                        Provider.of<LisaLoginModel>(context,
                                            listen: false);
                                    res = await updateAccess
                                        .updateAccessItem(lisaAccessItem);
                                    print('Úpdate todo result: $res');
                                    _showToast("Todo mis à jour");
                                  }

                                  if (res != null) {
                                    var snackbar = SnackBar(
                                      content: Text(
                                        stateId
                                            ? 'Access info updated'
                                            : 'Access added to database',
                                      ),
                                    );
                                    todoDetailsController.clear();
                                    Scaffold.of(context).showSnackBar(snackbar);
                                  }
//                                  backAccessList();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Dashboard();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: OutlineButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                  ),
                                  child: Text(
                                    'ANNULER',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void backAccessList() {
    Navigator.pop(context, true);
  }
}
