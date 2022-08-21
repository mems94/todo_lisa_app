import 'package:flutter/material.dart';
import 'package:lakleko/models/lisa_access_item.dart';
import 'package:lakleko/models/lisa_login_model.dart';
import 'package:lakleko/screens/view_info_access.dart';
import 'package:provider/provider.dart';

class AccessList extends StatefulWidget {
  @override
  _AccessListState createState() => _AccessListState();
}

class _AccessListState extends State<AccessList> {
  bool accessTodoStatus;
  int newTodoStatus;

  @override
  Widget build(BuildContext context) {
    return Consumer<LisaLoginModel>(
      builder: (context, lisaLoginModel, child) {
        return ListView.custom(
          childrenDelegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            final access = Provider.of<LisaLoginModel>(context, listen: true)
                .listAccess[index];
            //Status checkbox
            if (access.todoStatus == 1) {
              accessTodoStatus = true;
            } else {
              accessTodoStatus = false;
            }
            return Card(
              elevation: 0,
              margin: EdgeInsets.only(bottom: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                // leading: Checkbox(
                //   // checkColor: Color(0xFF426E6D),
                //   onChanged: (bool value) async {
                //     bool newValue = await Provider.of<LisaLoginModel>(context,
                //             listen: false)
                //         .inverseStatus();
                //     print("newValue");
                //     print(newValue);
                //     print('Checkbox status from base : ');
                //     print(access.todoStatus);
                //     //status todo
                //     setState(() {
                //       if (newValue == true) {
                //         newTodoStatus = 1;
                //       } else {
                //         newTodoStatus = 0;
                //       }
                //     });
                //     LisaAccessItem newLisaAccessItem = LisaAccessItem.fromMap(
                //       {
                //         "todoStatus": newTodoStatus,
                //         "todoDetails": access.todoDetails,
                //         "dateCreated": access.dateCreated,
                //       },
                //     );
                //     Provider.of<LisaLoginModel>(context, listen: false)
                //         .todoStatusChange(newLisaAccessItem);
                //   },
                //   value: accessTodoStatus,
                // ),
                title: Text(access.todoDetails ?? 'nothing'),
                subtitle: Text(
                  access.dateCreated ?? 'nothing',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ViewInfoAccess(
                      accessForDB: access,
                      indexForList: index,
                    );
                  }));
                },
              ),
            );
          }, childCount: lisaLoginModel.listAccessCount),
        );
      },
    );
  }
}
