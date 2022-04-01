import 'package:flutter/material.dart';

import '../../ui/ui.dart';
import '../../widgets/widgets.dart';
import '../../screens/screens.dart';

class ComponentesScreen extends StatelessWidget {
  const ComponentesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      drawer: SideMenuWidget(),
      body: ListView(
        children: [
          ListTile(
            title: Text('SnackBar'),
            leading: Icon(
              Icons.notifications_outlined,
              color: secondaryColor,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: primaryColor,
            ),
            onTap: () {
              Navigator.push(context, routeSlideTransition(SnackBarScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Alert Dialog'),
            leading: Icon(
              Icons.error_outline,
              color: secondaryColor,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: primaryColor,
            ),
            onTap: () {
              Navigator.push(
                  context, routeSlideTransition(AlertDialogScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Slider'),
            leading: Icon(
              Icons.linear_scale_outlined,
              color: secondaryColor,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: primaryColor,
            ),
            onTap: () {
              Navigator.push(context, routeSlideTransition(SliderScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Avatar'),
            leading: Icon(
              Icons.account_circle_outlined,
              color: secondaryColor,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: primaryColor,
            ),
            onTap: () {
              Navigator.push(context, routeSlideTransition(AvatarScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Infinite scroll'),
            leading: Icon(
              Icons.list_outlined,
              color: secondaryColor,
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: primaryColor,
            ),
            onTap: () {
              Navigator.push(
                  context, routeSlideTransition(InfiniteScrollScreen()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
