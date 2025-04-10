import 'package:example_practise_app/about_us.dart';
import 'package:example_practise_app/investor.dart';
import 'package:example_practise_app/news.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyWebsiteApp());
}

class MyWebsiteApp extends StatelessWidget {
  MyWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Corporate Site',
      routerConfig: _router, // Using GoRouter for navigation
      debugShowCheckedModeBanner: false,
    );
  }

  // Define the GoRouter configuration
  final GoRouter _router = GoRouter(
    initialLocation: '/', // Initial screen on app launch
    routes: [
      // Define the route for About Us page
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage(); // Load About Us page
        },
      ),
      // Define the route for Investor page
      GoRoute(
        path: '/investors',
        builder: (BuildContext context, GoRouterState state) {
          return const InvestorsPage(); // Load Investors page
        },
      ),
      // Define the route for News page
      GoRoute(
        path: '/news',
        builder: (BuildContext context, GoRouterState state) {
          return const NewsPage(); // Load News page
        },
      ),
    ],
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/gurunabi.png',
                              height: 40,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "ぐるなび",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Color.fromARGB(221, 17, 8, 8),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Color.fromARGB(255, 192, 189, 189),
                                thickness: 2,
                                width: 20,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "GURUNAVI",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        // Right-side Links
                        const Row(
                          children: [
                            Text("Contact Us",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                            SizedBox(width: 16),
                            Text("|", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 16),
                            Text("Site map",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                            SizedBox(width: 16),
                            Icon(Icons.language, size: 18, color: Colors.black),
                            SizedBox(width: 8),
                            Text("JP", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 6),
                            Text("|", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 6),
                            Text("EN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Body with TabBar for navigation
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: const TabBar(
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelPadding: EdgeInsets.symmetric(horizontal: 52),
                    unselectedLabelColor: Colors.black54,
                    indicatorColor: Colors.red,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      // Define tab items with navigation using GoRouter
                      Tab(text: 'About Us'),
                      Tab(text: 'Investors'),
                      Tab(text: 'News'),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // The TabBar will use GoRouter's navigation on each tab
                  AboutUsPage(), // Go to the About Us page
                  InvestorsPage(), // Go to Investors page
                  NewsPage(), // Go to News page
                ],
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}
