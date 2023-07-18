import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {

  List<User> users = [
    User(name: "Bilal", picture: "picture"),
    User(name: "Izan", picture: "picture"),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/netflix/select_profile.png', width: 100.0,),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.mode_edit_outlined, color: Colors.white,),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
            ),
            const Text(
              "Who's watching?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: users.map((User user) {
                return GestureDetector(
                    onTap: (){},
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/netflix/select_profile.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          user.name,
                          style: const TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                      ],
                    )
                );
              }).toList(),
            ),




          ],
        ),
      ),
    );
  }
}
