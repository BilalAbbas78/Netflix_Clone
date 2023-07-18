import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  bool isEditSelected = false;

  List<User> users = [
    User(name: "Bilal", picture: 'assets/profile_icons/profile_1.jpg'),
    User(name: "Hadeed", picture: 'assets/profile_icons/profile_2.jpg'),
    User(name: "Izan", picture: 'assets/profile_icons/profile_3.jpg'),
    User(name: "Jamal", picture: 'assets/profile_icons/profile_1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: isEditSelected ? AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/netflix/select_profile.png', width: 100.0,),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){
                setState(() {
                  isEditSelected = !isEditSelected;
                });
              },
              icon: const Icon(Icons.mode_edit_outlined, color: Colors.white,),
            )
          ],
        ) : AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (){
              setState(() {
                isEditSelected = !isEditSelected;
              });
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
          ),
          title: Text(
            "Manage Profiles",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
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
            const SizedBox(
              height: 30.0,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              // mainAxisSpacing: 5,
              crossAxisSpacing: 20,
              children: users.map((User user) {
                return GestureDetector(
                    onTap: (){
                      isEditSelected ? debugPrint("Select ${user.name}") : debugPrint("Edit ${user.name}");
                    },
                    child: Column(
                      children: [
                        isEditSelected ? ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            user.picture,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ) : Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                user.picture,
                                width: 100.0,
                                height: 100.0,
                              ),
                            ),
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black.withOpacity(0.7),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 40.0,
                                color: Colors.white,
                              ),

                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
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
