import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2pfintech_task/core/api/api_service.dart';
import 'package:m2pfintech_task/core/repository/video_repository.dart';
import '../models/video_model.dart';


final videoViewModelProvider =
    StateNotifierProvider<VideoViewModel, VideoModel>((ref) {
  final repository = VideoRepository(ApiService());
  return VideoViewModel(repository);
});

class VideoViewModel extends StateNotifier<VideoModel> {
  final VideoRepository repository;

  VideoViewModel(this.repository) : super(null) {
    fetchVideoData();
  }

  Future<void> fetchVideoData() async {
    try {
      final data = await repository.fetchVideoData();
      state = data;
    } catch (e) {
      log('error---->$e');
    }
  }
}
