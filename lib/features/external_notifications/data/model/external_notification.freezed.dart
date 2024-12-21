// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExternalNotification _$ExternalNotificationFromJson(Map<String, dynamic> json) {
  return _ExternalNotification.fromJson(json);
}

/// @nodoc
mixin _$ExternalNotification {
  @JsonKey(name: "topic")
  String? get topic => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this ExternalNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExternalNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExternalNotificationCopyWith<ExternalNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalNotificationCopyWith<$Res> {
  factory $ExternalNotificationCopyWith(ExternalNotification value,
          $Res Function(ExternalNotification) then) =
      _$ExternalNotificationCopyWithImpl<$Res, ExternalNotification>;
  @useResult
  $Res call(
      {@JsonKey(name: "topic") String? topic,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$ExternalNotificationCopyWithImpl<$Res,
        $Val extends ExternalNotification>
    implements $ExternalNotificationCopyWith<$Res> {
  _$ExternalNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExternalNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = freezed,
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExternalNotificationImplCopyWith<$Res>
    implements $ExternalNotificationCopyWith<$Res> {
  factory _$$ExternalNotificationImplCopyWith(_$ExternalNotificationImpl value,
          $Res Function(_$ExternalNotificationImpl) then) =
      __$$ExternalNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "topic") String? topic,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$ExternalNotificationImplCopyWithImpl<$Res>
    extends _$ExternalNotificationCopyWithImpl<$Res, _$ExternalNotificationImpl>
    implements _$$ExternalNotificationImplCopyWith<$Res> {
  __$$ExternalNotificationImplCopyWithImpl(_$ExternalNotificationImpl _value,
      $Res Function(_$ExternalNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExternalNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = freezed,
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ExternalNotificationImpl(
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExternalNotificationImpl implements _ExternalNotification {
  const _$ExternalNotificationImpl(
      {@JsonKey(name: "topic") this.topic,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "message") this.message});

  factory _$ExternalNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExternalNotificationImplFromJson(json);

  @override
  @JsonKey(name: "topic")
  final String? topic;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'ExternalNotification(topic: $topic, title: $title, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalNotificationImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, topic, title, message);

  /// Create a copy of ExternalNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalNotificationImplCopyWith<_$ExternalNotificationImpl>
      get copyWith =>
          __$$ExternalNotificationImplCopyWithImpl<_$ExternalNotificationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExternalNotificationImplToJson(
      this,
    );
  }
}

abstract class _ExternalNotification implements ExternalNotification {
  const factory _ExternalNotification(
          {@JsonKey(name: "topic") final String? topic,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "message") final String? message}) =
      _$ExternalNotificationImpl;

  factory _ExternalNotification.fromJson(Map<String, dynamic> json) =
      _$ExternalNotificationImpl.fromJson;

  @override
  @JsonKey(name: "topic")
  String? get topic;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "message")
  String? get message;

  /// Create a copy of ExternalNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExternalNotificationImplCopyWith<_$ExternalNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
