// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pic _$PicFromJson(Map<String, dynamic> json) {
  return _Pic.fromJson(json);
}

/// @nodoc
mixin _$Pic {
  @JsonKey(name: PicKeys.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: PicKeys.author)
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: PicKeys.width)
  double get width => throw _privateConstructorUsedError;
  @JsonKey(name: PicKeys.height)
  double get height => throw _privateConstructorUsedError;
  @JsonKey(name: PicKeys.url)
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: PicKeys.downloadUrl)
  String get downloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PicCopyWith<Pic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PicCopyWith<$Res> {
  factory $PicCopyWith(Pic value, $Res Function(Pic) then) =
      _$PicCopyWithImpl<$Res, Pic>;
  @useResult
  $Res call(
      {@JsonKey(name: PicKeys.id) String id,
      @JsonKey(name: PicKeys.author) String author,
      @JsonKey(name: PicKeys.width) double width,
      @JsonKey(name: PicKeys.height) double height,
      @JsonKey(name: PicKeys.url) String url,
      @JsonKey(name: PicKeys.downloadUrl) String downloadUrl});
}

/// @nodoc
class _$PicCopyWithImpl<$Res, $Val extends Pic> implements $PicCopyWith<$Res> {
  _$PicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? width = null,
    Object? height = null,
    Object? url = null,
    Object? downloadUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PicCopyWith<$Res> implements $PicCopyWith<$Res> {
  factory _$$_PicCopyWith(_$_Pic value, $Res Function(_$_Pic) then) =
      __$$_PicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: PicKeys.id) String id,
      @JsonKey(name: PicKeys.author) String author,
      @JsonKey(name: PicKeys.width) double width,
      @JsonKey(name: PicKeys.height) double height,
      @JsonKey(name: PicKeys.url) String url,
      @JsonKey(name: PicKeys.downloadUrl) String downloadUrl});
}

/// @nodoc
class __$$_PicCopyWithImpl<$Res> extends _$PicCopyWithImpl<$Res, _$_Pic>
    implements _$$_PicCopyWith<$Res> {
  __$$_PicCopyWithImpl(_$_Pic _value, $Res Function(_$_Pic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? width = null,
    Object? height = null,
    Object? url = null,
    Object? downloadUrl = null,
  }) {
    return _then(_$_Pic(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pic extends _Pic {
  const _$_Pic(
      {@JsonKey(name: PicKeys.id) required this.id,
      @JsonKey(name: PicKeys.author) required this.author,
      @JsonKey(name: PicKeys.width) required this.width,
      @JsonKey(name: PicKeys.height) required this.height,
      @JsonKey(name: PicKeys.url) required this.url,
      @JsonKey(name: PicKeys.downloadUrl) required this.downloadUrl})
      : super._();

  factory _$_Pic.fromJson(Map<String, dynamic> json) => _$$_PicFromJson(json);

  @override
  @JsonKey(name: PicKeys.id)
  final String id;
  @override
  @JsonKey(name: PicKeys.author)
  final String author;
  @override
  @JsonKey(name: PicKeys.width)
  final double width;
  @override
  @JsonKey(name: PicKeys.height)
  final double height;
  @override
  @JsonKey(name: PicKeys.url)
  final String url;
  @override
  @JsonKey(name: PicKeys.downloadUrl)
  final String downloadUrl;

  @override
  String toString() {
    return 'Pic(id: $id, author: $author, width: $width, height: $height, url: $url, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pic &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, author, width, height, url, downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PicCopyWith<_$_Pic> get copyWith =>
      __$$_PicCopyWithImpl<_$_Pic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PicToJson(
      this,
    );
  }
}

abstract class _Pic extends Pic {
  const factory _Pic(
      {@JsonKey(name: PicKeys.id)
          required final String id,
      @JsonKey(name: PicKeys.author)
          required final String author,
      @JsonKey(name: PicKeys.width)
          required final double width,
      @JsonKey(name: PicKeys.height)
          required final double height,
      @JsonKey(name: PicKeys.url)
          required final String url,
      @JsonKey(name: PicKeys.downloadUrl)
          required final String downloadUrl}) = _$_Pic;
  const _Pic._() : super._();

  factory _Pic.fromJson(Map<String, dynamic> json) = _$_Pic.fromJson;

  @override
  @JsonKey(name: PicKeys.id)
  String get id;
  @override
  @JsonKey(name: PicKeys.author)
  String get author;
  @override
  @JsonKey(name: PicKeys.width)
  double get width;
  @override
  @JsonKey(name: PicKeys.height)
  double get height;
  @override
  @JsonKey(name: PicKeys.url)
  String get url;
  @override
  @JsonKey(name: PicKeys.downloadUrl)
  String get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PicCopyWith<_$_Pic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PicPageData {
  List<Pic> get pics => throw _privateConstructorUsedError;
  bool get isNextPageAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PicPageDataCopyWith<PicPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PicPageDataCopyWith<$Res> {
  factory $PicPageDataCopyWith(
          PicPageData value, $Res Function(PicPageData) then) =
      _$PicPageDataCopyWithImpl<$Res, PicPageData>;
  @useResult
  $Res call({List<Pic> pics, bool isNextPageAvailable});
}

/// @nodoc
class _$PicPageDataCopyWithImpl<$Res, $Val extends PicPageData>
    implements $PicPageDataCopyWith<$Res> {
  _$PicPageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pics = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_value.copyWith(
      pics: null == pics
          ? _value.pics
          : pics // ignore: cast_nullable_to_non_nullable
              as List<Pic>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PicPageDataCopyWith<$Res>
    implements $PicPageDataCopyWith<$Res> {
  factory _$$_PicPageDataCopyWith(
          _$_PicPageData value, $Res Function(_$_PicPageData) then) =
      __$$_PicPageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pic> pics, bool isNextPageAvailable});
}

/// @nodoc
class __$$_PicPageDataCopyWithImpl<$Res>
    extends _$PicPageDataCopyWithImpl<$Res, _$_PicPageData>
    implements _$$_PicPageDataCopyWith<$Res> {
  __$$_PicPageDataCopyWithImpl(
      _$_PicPageData _value, $Res Function(_$_PicPageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pics = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_$_PicPageData(
      pics: null == pics
          ? _value._pics
          : pics // ignore: cast_nullable_to_non_nullable
              as List<Pic>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PicPageData implements _PicPageData {
  const _$_PicPageData(
      {required final List<Pic> pics, required this.isNextPageAvailable})
      : _pics = pics;

  final List<Pic> _pics;
  @override
  List<Pic> get pics {
    if (_pics is EqualUnmodifiableListView) return _pics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pics);
  }

  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'PicPageData(pics: $pics, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PicPageData &&
            const DeepCollectionEquality().equals(other._pics, _pics) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                other.isNextPageAvailable == isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pics), isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PicPageDataCopyWith<_$_PicPageData> get copyWith =>
      __$$_PicPageDataCopyWithImpl<_$_PicPageData>(this, _$identity);
}

abstract class _PicPageData implements PicPageData {
  const factory _PicPageData(
      {required final List<Pic> pics,
      required final bool isNextPageAvailable}) = _$_PicPageData;

  @override
  List<Pic> get pics;
  @override
  bool get isNextPageAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_PicPageDataCopyWith<_$_PicPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
