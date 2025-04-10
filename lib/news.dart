import 'package:example_practise_app/NewsPage_Screen/2019_news.dart';
import 'package:example_practise_app/NewsPage_Screen/2020_news.dart';
import 'package:example_practise_app/NewsPage_Screen/2021_news.dart';
import 'package:example_practise_app/NewsPage_Screen/news_top.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int selectedIndex = 0;

  final List<String> menuTitles = [
    "News Top",
    "2019",
    "2020",
    "2021",
  ];

  final List<Widget> menuContent = [
    const NewsTopPage(),
    const News2019Page(),
    const News2020Page(),
    const News2021Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Breadcrumb Navigation
              const Text(
                "Home > News",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              // Main Content Area
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sidebar Navigation Menu
                  Container(
                    width: 220,
                    color: Colors.grey.shade100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menuTitles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            menuTitles[index],
                            style: TextStyle(
                              fontWeight: index == selectedIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                          selected: index == selectedIndex,
                          selectedTileColor: Colors.white,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Content Display Area
                  Expanded(
                    child: IndexedStack(
                      index: selectedIndex,
                      children: menuContent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // Footer Section
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 87, 85, 85),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Terms of Use",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(width: 6),
            const Text(" | ", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 6),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Terms & Conditions",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(width: 6),
            const Text(" | ", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 6),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Privacy Policy",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(width: 6),
            const Text(" | ", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 26),
            const Text(
              "© Gurunavi, Inc.",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
