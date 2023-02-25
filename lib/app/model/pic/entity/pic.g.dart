// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pic _$$_PicFromJson(Map<String, dynamic> json) => _$_Pic(
      id: json['id'] as String,
      author: json['author'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      url: json['url'] as String,
      downloadUrl: json['download_url'] as String,
    );

Map<String, dynamic> _$$_PicToJson(_$_Pic instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'download_url': instance.downloadUrl,
    };
