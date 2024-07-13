
import '../api/api_service.dart';
import '../models/video_model.dart';

class VideoRepository {
  final ApiService apiService;

  VideoRepository(this.apiService);

  Future<VideoModel> fetchVideoData() async {
    final response = await apiService.fetchVideoService();
    if (response != null) {
      return videoModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
