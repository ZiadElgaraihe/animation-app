import 'package:animation/components/add_item_button.dart';
import 'package:animation/components/list_item.dart';
import 'package:animation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static String homeId = 'home page';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> listOfItems = [];
  GlobalKey<AnimatedListState> animatedListKey = GlobalKey<AnimatedListState>();
  ScrollController controller = ScrollController();
  int num = 0;
  void addItem() {
    num++;
    int index = listOfItems.length;
    listOfItems.add('Item $num');
    animatedListKey.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 700));
    Future.delayed(
      const Duration(milliseconds: 750),
      () {
        controller.animateTo(controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
  }

  void removeItem(int index) {
    String text = listOfItems.removeAt(index);
    animatedListKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
          sizeFactor: animation,
          child: ListItem(
            text: text,
            onPressed: () {},
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('logged in', false);
              if (!mounted) return;
              Navigator.of(context).pushReplacementNamed(LogIn.logInId);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            AddItemButton(width: width, onPressed: addItem),
            Expanded(
              child: AnimatedList(
                controller: controller,
                key: animatedListKey,
                initialItemCount: listOfItems.length,
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListItem(
                      text: listOfItems[index],
                      onPressed: removeItem,
                      index: index,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
