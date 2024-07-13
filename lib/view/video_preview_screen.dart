import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({key, this.url});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  ChewieController _chewieController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = _initializePlayer(widget.url);
  }

  Future<void> _initializePlayer(String url) async {
    final videoPlayerController = VideoPlayerController.network(url);
    // VideoPlayerController.networkUrl(Uri.parse(url));
    await videoPlayerController.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: videoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: true,
      );
    });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _chewieController?.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Enjoy the Video'),
      ),
      body: FutureBuilder<void>(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
              child: AspectRatio(
                aspectRatio:
                    _chewieController.videoPlayerController.value.aspectRatio,
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
