import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 140) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      if (!_showTitle) return;
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: Duration(milliseconds: 300),
          child: Text("Choose your interests"),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              top: Sizes.size24,
              bottom: Sizes.size16,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Get better video recommendations",
                  style: TextStyle(fontSize: Sizes.size20),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 140,
        child: BottomAppBar(
          // height: MediaQuery.of(context).size.height * 0.2,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: Sizes.size20,
              top: Sizes.size1,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size16 + Sizes.size2,
              ),
              decoration: BoxDecoration(
                // border: BoxBorder.all(color: Colors.black),
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                "Next",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
