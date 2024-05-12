import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/nav.items.dart';
import '../provider/provider.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({Key? key, required this.onNavItemTap}) : super(key: key);

  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, UiProvider uiProvider, child) {
        final backgroundColor = uiProvider.isDark ? CustomColor.bgLight2 : Colors.white;
        final textColor = uiProvider.isDark ? Colors.white : Colors.black;

        return Drawer(
          backgroundColor: backgroundColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Youssef Koubaa', // Replace with your name
                  style: TextStyle(color: textColor),
                ),
                accountEmail: Text(
                  'jozefkoubaa@gmail.com', // Replace with your email
                  style: TextStyle(color: textColor),
                ),
                currentAccountPicture:   CircleAvatar(
                backgroundImage: AssetImage('assets/youssef.png'),
              ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 179, 142, 184),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < navIcons.length; i++)
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                        leading: Icon(navIcons[i], color: CustomColor.scaffoldBg),
                        title: Text(
                          navTitles[i],
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          onNavItemTap(i);
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
