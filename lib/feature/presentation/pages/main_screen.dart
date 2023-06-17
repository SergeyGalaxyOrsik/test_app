import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/presentation/pages/account_screen.dart';
import 'package:test_app/feature/presentation/pages/bascket_screen.dart';
import 'package:test_app/feature/presentation/pages/home_screen.dart';
import 'package:test_app/feature/presentation/pages/search_screen.dart';
import 'package:test_app/feature/presentation/widgets/category/category_list_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  List<Widget> _pages = <Widget>[
    HomePage(),
    SearchPage(),
    BuscketPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        // backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1.0),
        height: 69,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Аккаунт',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: HomePage());
            });
            break;
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: SearchPage());
            });
            break;
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: BuscketPage());
            });
            break;
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: AccountPage());
            });
            break;
          default:
            return const CupertinoTabView();
            
        }
      },
    );
  }
}
