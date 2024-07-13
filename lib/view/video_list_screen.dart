import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2pfintech_task/view/video_preview_screen.dart';
import '../core/viewmodels/video_viewmodel.dart';

class VideoListScreen extends ConsumerWidget {
  const VideoListScreen({key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoData = ref.watch(videoViewModelProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('i Tunes'),
          bottom: const TabBar(
            indicatorColor: Colors.white60,
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.list_alt)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: videoData == null
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: videoData.results?.length,
                      itemBuilder: (context, index) {
                        var data = videoData.results[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  VideoPlayerScreen(url: data.previewUrl ?? ""),
                            ));
                          },
                          child: Card(
                            color: Colors.black87,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                leading: ClipOval(
                                  child: Image.network(
                                    data.artworkUrl30.toString() ?? "",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  data.artistName ?? "",
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    data.trackCensoredName ?? "",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white60),
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Center(
              child: videoData == null
                  ? const CircularProgressIndicator()
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemCount: videoData.results?.length,
                      itemBuilder: (context, index) {
                        var data = videoData.results[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  VideoPlayerScreen(url: data.previewUrl ?? ""),
                            ));
                          },
                          child: Card(
                            color: Colors.black87,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipOval(
                                      child: Image.network(
                                        data.artworkUrl30.toString() ?? "",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      data.artistName ?? "",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      data.trackCensoredName ?? "",
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Text(
                                      data.artistViewUrl.toString() ?? "",
                                      style: const TextStyle(
                                          color: Colors.white30, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
