import 'package:flutter/material.dart';
import 'package:example_practise_app/Widgets/card_reusable.dart';

class AboutUsTop extends StatelessWidget {
  final Function(int) onCardTap;

  const AboutUsTop({super.key, required this.onCardTap});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'icon': Icons.mic,
        'title': 'Messages from Management',
        'description': 'Messages from our president Akio Sugihara and founder Hisao Taki.',
        'index': 1, // Index for Messages from Management
      },
      {
        'icon': Icons.lightbulb_outline,
        'title': 'Brand Statement',
        'description': 'Our purpose and corporate philosophy are essential to the promotion of our business.',
        'index': 2, // Index for Brand Statement
      },
      {
        'icon': Icons.business,
        'title': 'Corporate Overview',
        'description': 'Learn more about our company profile and operations.',
        'index': 3, // Index for Corporate Overview
      },
      {
        'icon': Icons.group,
        'title': 'Corporate Officers',
        'description': 'Meet the leaders who guide our company forward.',
        'index': 4, // Index for Corporate Officers
      },
      {
        'icon': Icons.account_tree,
        'title': 'Organization',
        'description': 'Explore our corporate structure and divisions.',
        'index': 5, // Index for Organization
      },
      {
        'icon': Icons.location_on,
        'title': 'Business Locations',
        'description': 'Find our office and business locations globally.',
        'index': 6, // Index for Business Locations
      },
      {
        'icon': Icons.history,
        'title': 'History',
        'description': 'Discover the rich history of our company since inception.',
        'index': 7, // Index for History
      },
      {
        'icon': Icons.timeline,
        'title': 'Medium Term Management Plan',
        'description': 'Strategic goals and visions for sustainable growth.',
        'index': 8, // Index for Medium Term Management Plan
      },
      {
        'icon': Icons.warning,
        'title': 'Business Risks',
        'description': 'Understand potential risks and our mitigation strategies.',
        'index': 9, // Index for Business Risks
      },
      {
        'icon': Icons.eco,
        'title': 'Sustainability',
        'description': 'Our commitment to the environment and sustainable practices.',
        'index': 10, // Index for Sustainability
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About Us",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          itemCount: cardData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            final item = cardData[index];
            return AboutUsCard(
              icon: item['icon'],
              title: item['title'],
              description: item['description'],
              onTap: () => onCardTap(item['index']), // Trigger onTap for each card
            );
          },
        ),
      ],
    );
  }
}

