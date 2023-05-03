import 'package:fintek/src/core/constants.dart';

import 'package:fintek/src/features/account/presentation/widgets/account_tile.dart';
import 'package:fintek/src/features/account/presentation/widgets/feature_tile.dart';

import 'package:fintek/src/features/auth/presentation/screens/log_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  returnBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return SizedBox(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Account',
                      style: kTextStyle1,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.cancel))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                          width: 100, height: 100, 'asset/images/uba.jpeg'),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('3005678901', style: kTextStyle2,),
                          Text('Glory Bassey'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                          width: 100, height: 100, 'asset/images/firstBank.jpeg'),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('3005678901', style: kTextStyle2,),
                          Text('Glory Bassey'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              

              
            
            ],
          ),
        );
      },
    );
  }

  User? currentUser;
  @override
  void initState() {
    currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final userInfoProvider = ref.watch(userDetailsProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E52),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E52),
        title: Text(
          // "Hello ${userInfoProvider!.displayName!.split(" ").sublist(0, 1).elementAt(0)}",
          "Hello ${" ".filteredName(currentUser!.displayName)}",
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            foregroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1480429370139-e0132c086e2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.bell_fill, color: Colors.white),
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                var navigator = Navigator.of(context);
                navigator.pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(13.5),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 135,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Wallet Balance', style: kTextStyle),
                          Icon(
                            Icons.visibility_off,
                            size: 27.5,
                          )
                        ],
                      ),
                      const Text('₦30000', style: kTextStyle),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1.3),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Fund Wallet'),
                                  Icon(Icons.add),
                                ],
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.group_add,
                            color: Color(0xFF0E0E52),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => returnBottomSheet(context),
              child: const AccountTile(
                title: 'Send Funds',
                subtitle: 'Send Funds to any account',
                imagePath: 'asset/images/send.svg',
              ),
            ),
            const SizedBox(height: 10),
            const AccountTile(
              title: 'Withdraw Funds',
              subtitle: 'Withdraw to any account',
              imagePath: 'asset/images/withdraw.svg',
            ),
            const SizedBox(height: 10),
            const AccountTile(
              title: 'Save Money',
              subtitle: 'Improve your Saving game',
              imagePath: 'asset/images/save.svg',
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FeatureTile(
                      title: 'Save and Spend Later',
                      imagePath: pocketMoney,
                    ),
                    FeatureTile(
                      title: 'Save and Receive Money',
                      imagePath: countMoney,
                    ),
                    FeatureTile(
                      title: 'Create Virtual Cards',
                      imagePath: virtualCard,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

extension FilterString on String {
  String filteredName(String? name) {
    return name!.split(" ").sublist(0, 1).elementAt(0);
  }
}
