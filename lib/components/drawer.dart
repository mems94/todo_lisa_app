import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lakleko/screens/login_screen.dart';
import 'package:lakleko/screens/settings.dart';
import 'package:lakleko/screens/update_or_add_access.dart';
import 'package:lakleko/utils/sign_out.dart';

class LisaDrawer extends StatefulWidget {
  const LisaDrawer({
    Key key,
  }) : super(key: key);

  @override
  _LisaDrawerState createState() => _LisaDrawerState();
}

class _LisaDrawerState extends State<LisaDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF426E6D),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Lisa todo application vous permet de gerer vos todos',
                  softWrap: true,
                  style: TextStyle(
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.grey.shade400,
            ),
            title: Text(
              'Ajouter un todo',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              print('Ajouter un todo');
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateOrAddAccess(-1, 'Add');
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.archive,
              color: Colors.grey.shade400,
            ),
            title: Text(
              'Archives',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              print('Voir archives');
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateOrAddAccess(-1, 'Add');
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey.shade400,
            ),
            title: Text(
              'Parametres',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Settings();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.grey.shade400,
            ),
            title: Text(
              'Deconnexion',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              signOut();
              print('User logout');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
