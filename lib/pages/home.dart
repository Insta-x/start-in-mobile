import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start_in_mobile/pages/shop/shop.dart';
import 'package:start_in_mobile/util/constants.dart';
import 'package:start_in_mobile/widgets/category_card.dart';
import 'package:start_in_mobile/widgets/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: const AppDrawer(),
      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/startin-logo.png"),
                    ),
                  ),
                  Text(
                    "StartIn",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Innovate your better future \n",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "The StartIn Foundation aims to advance technological innovation in Indonesia. StartIn provides a means for everyone who has a technological innovation idea to get donations  to fund their projects. StartIn also provides a means for everyone to learn everything about technology and how to start their own business, even startup, by attending workshops, talk shows, courses and participating on myriads of forum threads available on StartIn. StartIn also displays the latest news about tech startups and the latest technology with the most potential, to keep everybody update with current technology issues.\n\n\n",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                  // SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Projects",
                          svgSrc: "assets/images/project.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Forum",
                          svgSrc: "assets/images/forum.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Shop",
                          svgSrc: "assets/images/shop-svgrepo-com.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Events",
                          svgSrc: "gaada fotonya di assets",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "News",
                          svgSrc: "assets/images/news.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Courses",
                          svgSrc: "assets/images/courses.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
