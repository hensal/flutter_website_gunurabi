import 'package:example_practise_app/InvestorsPage_Screen/financial_highlight.dart';
import 'package:example_practise_app/InvestorsPage_Screen/investor_eventCalendar.dart';
import 'package:example_practise_app/InvestorsPage_Screen/InvestorLibrary.dart';
import 'package:example_practise_app/InvestorsPage_Screen/investor_news.dart';
import 'package:example_practise_app/InvestorsPage_Screen/management_policy.dart';
import 'package:example_practise_app/InvestorsPage_Screen/stock.dart';
import 'package:example_practise_app/InvestorsPage_Screen/investors_top.dart';
import 'package:flutter/material.dart';

class InvestorsPage extends StatefulWidget {
  const InvestorsPage({super.key});

  @override
  State<InvestorsPage> createState() => _InvestorsPageState();
}

class _InvestorsPageState extends State<InvestorsPage> {
  int selectedIndex = 0; // This will keep track of the selected page

  final List<String> menuTitles = [
    "Investors TOP",
    "Management Policy",
    "Financial Highlight",
    "Stock",
    "Investor Library",
    "Investor Event Calendar",
    "Investor News",
  ];

  // List of corresponding content widgets for each menu title
  final List<Widget> menuContent = [
    const InvestorsTop(), // Index 0
    const ManagementPolicy(), // Index 1
    const FinancialHighlight(), // Index 2
    const Stock(), // Index 3
    const InvestorLibrary(), // Index 4
    const InvestorEventCalendar(), // Index 5
    const InvestorNews(), // Index 6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Breadcrumb
                const Text(
                  "Home > Investors",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                // Header Image
                Image.asset(
                  "assets/investerpic.PNG",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24),
                // Main Content (Sidebar + Content Area)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sidebar Menu
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
                                selectedIndex = index; // Update the selected index
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Right Content Panel
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
      ),
      // Footer with button navigation bar
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 87, 85, 85),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Footer buttons
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
