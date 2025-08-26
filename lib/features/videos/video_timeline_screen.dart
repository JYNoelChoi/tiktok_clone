import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _pageController = PageController();
  final _scrollCurve = Curves.linear;
  final _scrollDuration = Duration(milliseconds: 150);

  // List<Color> colors = [Colors.blue, Colors.red, Colors.yellow, Colors.teal];

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      // colors.addAll([Colors.blue, Colors.red, Colors.yellow, Colors.teal]);
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  Future<void> _onRefresh() {
    return Future.delayed(Duration(seconds: 5));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 50,
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      onRefresh: _onRefresh,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (value) => _onPageChanged(value),
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index),
      ),
    );
  }
}
