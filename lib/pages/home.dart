import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:start_in_mobile/pages/projects/projects_home.dart';
import 'package:start_in_mobile/pages/inforum/inforum.dart';
import 'package:start_in_mobile/pages/shop/shop.dart';
import 'package:start_in_mobile/pages/news/news.dart';
import 'package:start_in_mobile/pages/events/events.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';
import 'package:start_in_mobile/widgets/category_card.dart';
import 'package:start_in_mobile/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color.fromARGB(255, 223, 89, 11),
      ),
      drawer: const AppDrawer(),
      // bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
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
                    "The StartIn Foundation aims to advance technological innovation in Indonesia. StartIn provides a means for everyone who has a technological innovation idea to get donations  to fund their projects. StartIn also provides a means for everyone to learn everything about technology and how to start their own business, even startup, by attending workshops, talk shows, courses and participating on myriads of forum threads available on StartIn. StartIn also displays the latest news about tech startups and the latest technology with the most potential, to keep everybody update with current technology issues.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !request.loggedIn,
              child: CategoryCard(
                title: "Login",
                svgSrc: "assets/images/person.svg",
                press: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => LoginPage())));
                },
              ),
            ),
            CategoryCard(
              title: "Projects",
              svgSrc: "assets/images/project.svg",
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => ProjectsPage())));
              },
            ),
            CategoryCard(
              title: "Forum",
              svgSrc: "assets/images/forum.svg",
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => InForum())));
              },
            ),
            CategoryCard(
              title: "Events",
              svgSrc: "assets/images/calendar-svgrepo-com.svg",
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => Events())));
              },
            ),
            CategoryCard(
              title: "Courses",
              svgSrc: "assets/images/courses.svg",
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => (LoginPage()))));
              },
            ),
            CategoryCard(
              title: "News",
              svgSrc: "assets/images/news.svg",
              press: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: ((context) => News())));
              },
            ),
            CategoryCard(
              title: "Shop",
              svgSrc: "assets/images/shop-svgrepo-com.svg",
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => ShopPage())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
