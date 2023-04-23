class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
        title: 'Faded',
        description: 'Alan Walker',
        url: 'assets/music/faded.mp3',
        coverUrl: 'assets/images/faded.jpg'),
    Song(
        title: 'Calm Down',
        description: 'Rema',
        url: 'assets/music/calm.mp3',
        coverUrl: 'assets/images/calm.jpg'),
    Song(
        title: 'Get you the moon',
        description: 'Kina',
        url: 'assets/music/moon.mp3',
        coverUrl: 'assets/images/moon.jpg'),
  ];
}
