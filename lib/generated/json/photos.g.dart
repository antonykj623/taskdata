import 'package:tasknew/generated/json/base/json_convert_content.dart';
import 'package:tasknew/data/photos.dart';
import 'package:json_annotation/json_annotation.dart';


Photos $PhotosFromJson(Map<String, dynamic> json) {
  final Photos photos = Photos();
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    photos.total = total;
  }
  final int? totalHits = jsonConvert.convert<int>(json['totalHits']);
  if (totalHits != null) {
    photos.totalHits = totalHits;
  }
  final List<Hits>? hits = (json['hits'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Hits>(e) as Hits).toList();
  if (hits != null) {
    photos.hits = hits;
  }
  return photos;
}

Map<String, dynamic> $PhotosToJson(Photos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total'] = entity.total;
  data['totalHits'] = entity.totalHits;
  data['hits'] = entity.hits?.map((v) => v.toJson()).toList();
  return data;
}

extension PhotosExtension on Photos {
  Photos copyWith({
    int? total,
    int? totalHits,
    List<Hits>? hits,
  }) {
    return Photos()
      ..total = total ?? this.total
      ..totalHits = totalHits ?? this.totalHits
      ..hits = hits ?? this.hits;
  }
}

Hits $HitsFromJson(Map<String, dynamic> json) {
  final Hits hits = Hits();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    hits.id = id;
  }
  final String? pageURL = jsonConvert.convert<String>(json['pageURL']);
  if (pageURL != null) {
    hits.pageURL = pageURL;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    hits.type = type;
  }
  final String? tags = jsonConvert.convert<String>(json['tags']);
  if (tags != null) {
    hits.tags = tags;
  }
  final String? previewURL = jsonConvert.convert<String>(json['previewURL']);
  if (previewURL != null) {
    hits.previewURL = previewURL;
  }
  final int? previewWidth = jsonConvert.convert<int>(json['previewWidth']);
  if (previewWidth != null) {
    hits.previewWidth = previewWidth;
  }
  final int? previewHeight = jsonConvert.convert<int>(json['previewHeight']);
  if (previewHeight != null) {
    hits.previewHeight = previewHeight;
  }
  final String? webformatURL = jsonConvert.convert<String>(
      json['webformatURL']);
  if (webformatURL != null) {
    hits.webformatURL = webformatURL;
  }
  final int? webformatWidth = jsonConvert.convert<int>(json['webformatWidth']);
  if (webformatWidth != null) {
    hits.webformatWidth = webformatWidth;
  }
  final int? webformatHeight = jsonConvert.convert<int>(
      json['webformatHeight']);
  if (webformatHeight != null) {
    hits.webformatHeight = webformatHeight;
  }
  final String? largeImageURL = jsonConvert.convert<String>(
      json['largeImageURL']);
  if (largeImageURL != null) {
    hits.largeImageURL = largeImageURL;
  }
  final int? imageWidth = jsonConvert.convert<int>(json['imageWidth']);
  if (imageWidth != null) {
    hits.imageWidth = imageWidth;
  }
  final int? imageHeight = jsonConvert.convert<int>(json['imageHeight']);
  if (imageHeight != null) {
    hits.imageHeight = imageHeight;
  }
  final int? imageSize = jsonConvert.convert<int>(json['imageSize']);
  if (imageSize != null) {
    hits.imageSize = imageSize;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    hits.views = views;
  }
  final int? downloads = jsonConvert.convert<int>(json['downloads']);
  if (downloads != null) {
    hits.downloads = downloads;
  }
  final int? collections = jsonConvert.convert<int>(json['collections']);
  if (collections != null) {
    hits.collections = collections;
  }
  final int? likes = jsonConvert.convert<int>(json['likes']);
  if (likes != null) {
    hits.likes = likes;
  }
  final int? comments = jsonConvert.convert<int>(json['comments']);
  if (comments != null) {
    hits.comments = comments;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    hits.userId = userId;
  }
  final String? user = jsonConvert.convert<String>(json['user']);
  if (user != null) {
    hits.user = user;
  }
  final String? userImageURL = jsonConvert.convert<String>(
      json['userImageURL']);
  if (userImageURL != null) {
    hits.userImageURL = userImageURL;
  }
  return hits;
}

Map<String, dynamic> $HitsToJson(Hits entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['pageURL'] = entity.pageURL;
  data['type'] = entity.type;
  data['tags'] = entity.tags;
  data['previewURL'] = entity.previewURL;
  data['previewWidth'] = entity.previewWidth;
  data['previewHeight'] = entity.previewHeight;
  data['webformatURL'] = entity.webformatURL;
  data['webformatWidth'] = entity.webformatWidth;
  data['webformatHeight'] = entity.webformatHeight;
  data['largeImageURL'] = entity.largeImageURL;
  data['imageWidth'] = entity.imageWidth;
  data['imageHeight'] = entity.imageHeight;
  data['imageSize'] = entity.imageSize;
  data['views'] = entity.views;
  data['downloads'] = entity.downloads;
  data['collections'] = entity.collections;
  data['likes'] = entity.likes;
  data['comments'] = entity.comments;
  data['userId'] = entity.userId;
  data['user'] = entity.user;
  data['userImageURL'] = entity.userImageURL;
  return data;
}

extension HitsExtension on Hits {
  Hits copyWith({
    int? id,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webformatURL,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageURL,
  }) {
    return Hits()
      ..id = id ?? this.id
      ..pageURL = pageURL ?? this.pageURL
      ..type = type ?? this.type
      ..tags = tags ?? this.tags
      ..previewURL = previewURL ?? this.previewURL
      ..previewWidth = previewWidth ?? this.previewWidth
      ..previewHeight = previewHeight ?? this.previewHeight
      ..webformatURL = webformatURL ?? this.webformatURL
      ..webformatWidth = webformatWidth ?? this.webformatWidth
      ..webformatHeight = webformatHeight ?? this.webformatHeight
      ..largeImageURL = largeImageURL ?? this.largeImageURL
      ..imageWidth = imageWidth ?? this.imageWidth
      ..imageHeight = imageHeight ?? this.imageHeight
      ..imageSize = imageSize ?? this.imageSize
      ..views = views ?? this.views
      ..downloads = downloads ?? this.downloads
      ..collections = collections ?? this.collections
      ..likes = likes ?? this.likes
      ..comments = comments ?? this.comments
      ..userId = userId ?? this.userId
      ..user = user ?? this.user
      ..userImageURL = userImageURL ?? this.userImageURL;
  }
}