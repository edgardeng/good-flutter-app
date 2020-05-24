import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class MovieVideoPage extends StatefulWidget {
  final String url;

  const MovieVideoPage({Key key, this.url}) : super(key: key);

  
  @override
  _MovieVideoPageState createState() => _MovieVideoPageState();
}

class _MovieVideoPageState extends State<MovieVideoPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();// 'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}