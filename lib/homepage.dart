import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/auth/login.dart';
import 'package:pos/bloc/auth/auth_bloc.dart';
import 'package:pos/constant/dimension.dart';
import 'package:pos/pages/history.dart';
import 'package:pos/pages/info.dart';
import 'package:pos/pages/notification.dart';
import 'package:pos/pages/search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.uid,
  });
  final String uid;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 0;
  double buttomBarWidth = 42;

  onTap(int index) {
    setState(() {
      page = index;
    });
  }

  List<Widget> pages = const [
    Search(),
    History(),
    NotiPage(),
    AccountInfo(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize:
                        Size(Dimensions.iconSize16, Dimensions.iconSize16),
                    side: BorderSide.none),
                onPressed: () {
                  context.read<AuthBloc>().add(
                        SignOutRequest(),
                      );
                },
                child: const Icon(Icons.exit_to_app_outlined),
              ),
            ],
          ),
          body: pages[page],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            iconSize: 28,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts_outlined),
                label: '',
              ),
            ],
            onTap: onTap,
            currentIndex: page,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
