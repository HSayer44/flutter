import '../models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Hip-hop R&B Mix',
      songs: Song.songs,
      imageUrl: 'https://cdn.pixabay.com/photo/2019/04/06/00/21/man-4106429_960_720.jpg'
    ),
    Playlist(
      title: 'Rock & Roll',
      songs: Song.songs,
      imageUrl: 'https://cdn.pixabay.com/photo/2022/11/29/05/19/setting-7623756_960_720.jpg'
    ),
    Playlist(
      title: 'Techno',
      songs: Song.songs,
      imageUrl: 'https://cdn.pixabay.com/photo/2021/11/09/21/29/sculpture-6782448_960_720.jpg'
    ),
  ];
}
