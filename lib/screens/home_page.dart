import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/select_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = ["assets/shows/1.jpg", "assets/shows/2.jpg", "assets/shows/3.jpg", "assets/shows/4.jpg",
    "assets/shows/5.jpg", "assets/shows/6.jpg", "assets/shows/7.jpg", "assets/shows/8.jpg", "assets/shows/9.jpg",
    "assets/shows/10.jpg", "assets/shows/11.jpg", "assets/shows/12.jpg", "assets/shows/13.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              title: customAppBar(),
              // title: Text("Hello"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Image.asset(images[12]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  for (int x=1; x<=10; x++) {
                    if (index % 12 == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Released in the Past Year",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      );
                    } else if (index % 12 == 1) {
                      return SizedBox(
                        height: 155,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var image in images) ...[
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    image,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 1,
                      );
                    }
                  }
                },
                childCount: 110, // Modify this to set the number of items you have
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return AppBar(
      // backgroundColor: Colors.transparent,
      title: Image.asset(
        'assets/netflix/select_profile.png',
        width: 100.0,
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              SelectProfileScreenState.loggedInUser.picture,
              width: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}
