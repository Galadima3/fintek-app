import 'package:flutter/material.dart';

const String onboardingImage = 'asset/images/onboard_image.jpeg';

const String virtualCard =
    'https://images.unsplash.com/photo-1563013544-824ae1b704d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1vbmV5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';

const String pocketMoney =
    'https://images.unsplash.com/photo-1618914239396-6d0868064a25?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG9ja2V0JTIwbW9uZXl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';

const String countMoney =
    'https://images.unsplash.com/photo-1518458028785-8fbcd101ebb9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG9ja2V0JTIwbW9uZXl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';

const kTextStyle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0E0E52));

const kTextStyle1 = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0E0E52));

const kTextStyle2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

// class MyAppX extends StatefulWidget {
//   const MyAppX({super.key});

//   @override
//   State<MyAppX> createState() => _MyAppXState();
// }

// class _MyAppXState extends State<MyAppX> {
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   static const List<Widget> _screens = [
//     HomeScreen(user: user),
//     SettingsScreen(),
//     TransactionScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _screens.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           selectedFontSize: 16,
//           selectedIconTheme:
//               const IconThemeData(color: Color(0xFF0E0E52), size: 25),
//           selectedItemColor: const Color(0xFF0E0E52),
//           selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
//           showUnselectedLabels: false,
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.history),
//               label: 'History',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'settings',
//             ),
//           ]),
//     );
//   }
// }
