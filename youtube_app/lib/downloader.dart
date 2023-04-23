import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class Download {
  Future<void> downloadVideo(String youTube_link, String title) async {
    await FlutterYoutubeDownloader.downloadVideo(
        youTube_link, title, 18);
  }
}
