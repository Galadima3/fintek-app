import 'package:fintek/src/core/constants.dart';
import 'package:fintek/src/features/account/presentation/screens/settings_screen.dart';
import 'package:fintek/src/features/account/presentation/screens/transaction_history.dart';
import 'package:fintek/src/features/account/presentation/widgets/account_tile.dart';
import 'package:fintek/src/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screens = [
    HomeScreen(title: 'Ozai'),
    SettingsScreen(),
    TransactionScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 16,
          selectedIconTheme:
              const IconThemeData(color: Color(0xFF0E0E52), size: 25),
          selectedItemColor: const Color(0xFF0E0E52),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ]),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userInfoProvider = ref.watch(userDetailsProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E52),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E52),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            foregroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1480429370139-e0132c086e2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.bell_fill, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 150,
                width: 330,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const AccountTile(
            title: 'Send Funds',
            subtitle: 'Send Funds to any account',
            imagePath: 'asset/images/send.svg',
          ),
          const SizedBox(height: 15),
          const AccountTile(
            title: 'Withdraw Funds',
            subtitle: 'Withdraw to any account',
            imagePath: 'asset/images/withdraw.svg',
          ),
          const SizedBox(height: 15),
          const AccountTile(
            title: 'Save Money',
            subtitle: 'Improve your Saving game',
            imagePath: 'asset/images/save.svg',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 100,
                        width: 135,
                        
                        child: Center(child: Image.asset(onboardingImage)),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
