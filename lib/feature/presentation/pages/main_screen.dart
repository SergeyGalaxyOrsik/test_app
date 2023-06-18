import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/feature/presentation/pages/account_screen.dart';
import 'package:test_app/feature/presentation/pages/bascket_screen.dart';
import 'package:test_app/feature/presentation/pages/home_screen.dart';
import 'package:test_app/feature/presentation/pages/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1.0),
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
              return const CupertinoPageScaffold(child: HomePage());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: SearchPage());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: BuscketPage());
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: AccountPage());
            });
          default:
            return const CupertinoTabView();
            
        }
      },
    );
  }
}
