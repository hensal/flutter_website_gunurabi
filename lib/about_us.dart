import 'package:example_practise_app/AboutPage_Screen/about_us_top.dart';
import 'package:example_practise_app/AboutPage_Screen/brand_statement.dart';
import 'package:example_practise_app/AboutPage_Screen/business_locations.dart';
import 'package:example_practise_app/AboutPage_Screen/business_risks.dart';
import 'package:example_practise_app/AboutPage_Screen/cooperate_overview.dart';
import 'package:example_practise_app/AboutPage_Screen/corporate_officers.dart';
import 'package:example_practise_app/AboutPage_Screen/history.dart';
import 'package:example_practise_app/AboutPage_Screen/medium_term.dart';
import 'package:example_practise_app/AboutPage_Screen/message_from_management.dart';
import 'package:example_practise_app/AboutPage_Screen/orgainization.dart';
import 'package:example_practise_app/AboutPage_Screen/sustainability.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  int selectedIndex = 0; 

  final List<String> menuTitles = [
    "About Us TOP",
    "Messages from Management",
    "Brand Statement",
    "Corporate Overview",
    "Corporate Officers",
    "Organization",
    "Business Locations",
    "History",
    "Medium Term Management Plan",
    "Business Risks",
    "Sustainability",
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
                  "Home > About Us",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                // Header Image
                Image.asset(
                  "assets/aboutus.PNG",
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
                                selectedIndex =
                                    index; // Update the selected index
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
                        index:
                            selectedIndex, // This switches based on selectedIndex
                        children: [
                          AboutUsTop(
                            onCardTap: (index) {
                              setState(() {
                                selectedIndex = index; // Update selectedIndex
                              });
                            },
                          ),
                          const MessagesFromManagementPage(), // Index 1
                          const BrandStatement(), // Index 2
                          const CorporateOverview(), // Index 3
                          const CorporateOfficers(), // Index 4
                          const Organization(), // Index 5
                          const BusinessLocations(), // Index 6
                          const History(), // Index 7
                          const MediumTermManagementPlan(), // Index 8
                          const BusinessRisks(), // Index 9
                          const Sustainability(), // Index 10
                        ],
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
