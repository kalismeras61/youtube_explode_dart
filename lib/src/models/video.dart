import 'models.dart';

/// Information about a YouTube video.
class Video {
  /// ID of this video.
  final String id;

  /// Author of this video.
  final String author;

  /// Upload date of this video.
  final DateTime uploadDate;

  /// Title of this video.
  final String title;

  /// Description of this video.
  final String description;

  /// Thumbnails of this video.
  final ThumbnailSet thumbnailSet;

  /// Duration of this video.
  final Duration duration;

  /// Search keywords of this video.
  final List<String> keyWords;

  /// Statistics of this video.
  final Statistics statistics;

  /// Initializes an instance of [Video]
  const Video(
      this.id,
      this.author,
      this.uploadDate,
      this.title,
      this.description,
      this.thumbnailSet,
      this.duration,
      this.keyWords,
      this.statistics);
}