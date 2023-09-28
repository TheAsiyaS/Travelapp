// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel1_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Hotel1Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hotel1DetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hotel1DetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hotel1DetailsGet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Hotel1DetailsGet value) hotel1DetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Hotel1DetailsGet value)? hotel1DetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Hotel1DetailsGet value)? hotel1DetailsGet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Hotel1EventCopyWith<$Res> {
  factory $Hotel1EventCopyWith(
          Hotel1Event value, $Res Function(Hotel1Event) then) =
      _$Hotel1EventCopyWithImpl<$Res, Hotel1Event>;
}

/// @nodoc
class _$Hotel1EventCopyWithImpl<$Res, $Val extends Hotel1Event>
    implements $Hotel1EventCopyWith<$Res> {
  _$Hotel1EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_Hotel1DetailsGetCopyWith<$Res> {
  factory _$$_Hotel1DetailsGetCopyWith(
          _$_Hotel1DetailsGet value, $Res Function(_$_Hotel1DetailsGet) then) =
      __$$_Hotel1DetailsGetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_Hotel1DetailsGetCopyWithImpl<$Res>
    extends _$Hotel1EventCopyWithImpl<$Res, _$_Hotel1DetailsGet>
    implements _$$_Hotel1DetailsGetCopyWith<$Res> {
  __$$_Hotel1DetailsGetCopyWithImpl(
      _$_Hotel1DetailsGet _value, $Res Function(_$_Hotel1DetailsGet) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Hotel1DetailsGet implements _Hotel1DetailsGet {
  const _$_Hotel1DetailsGet();

  @override
  String toString() {
    return 'Hotel1Event.hotel1DetailsGet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Hotel1DetailsGet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hotel1DetailsGet,
  }) {
    return hotel1DetailsGet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hotel1DetailsGet,
  }) {
    return hotel1DetailsGet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hotel1DetailsGet,
    required TResult orElse(),
  }) {
    if (hotel1DetailsGet != null) {
      return hotel1DetailsGet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Hotel1DetailsGet value) hotel1DetailsGet,
  }) {
    return hotel1DetailsGet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Hotel1DetailsGet value)? hotel1DetailsGet,
  }) {
    return hotel1DetailsGet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Hotel1DetailsGet value)? hotel1DetailsGet,
    required TResult orElse(),
  }) {
    if (hotel1DetailsGet != null) {
      return hotel1DetailsGet(this);
    }
    return orElse();
  }
}

abstract class _Hotel1DetailsGet implements Hotel1Event {
  const factory _Hotel1DetailsGet() = _$_Hotel1DetailsGet;
}

/// @nodoc
mixin _$Hotel1State {
  List<UnsplashSearch> get hotelModelList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get iserror => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Hotel1StateCopyWith<Hotel1State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Hotel1StateCopyWith<$Res> {
  factory $Hotel1StateCopyWith(
          Hotel1State value, $Res Function(Hotel1State) then) =
      _$Hotel1StateCopyWithImpl<$Res, Hotel1State>;
  @useResult
  $Res call(
      {List<UnsplashSearch> hotelModelList, bool isLoading, bool iserror});
}

/// @nodoc
class _$Hotel1StateCopyWithImpl<$Res, $Val extends Hotel1State>
    implements $Hotel1StateCopyWith<$Res> {
  _$Hotel1StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotelModelList = null,
    Object? isLoading = null,
    Object? iserror = null,
  }) {
    return _then(_value.copyWith(
      hotelModelList: null == hotelModelList
          ? _value.hotelModelList
          : hotelModelList // ignore: cast_nullable_to_non_nullable
              as List<UnsplashSearch>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      iserror: null == iserror
          ? _value.iserror
          : iserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $Hotel1StateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UnsplashSearch> hotelModelList, bool isLoading, bool iserror});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$Hotel1StateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotelModelList = null,
    Object? isLoading = null,
    Object? iserror = null,
  }) {
    return _then(_$_Initial(
      hotelModelList: null == hotelModelList
          ? _value._hotelModelList
          : hotelModelList // ignore: cast_nullable_to_non_nullable
              as List<UnsplashSearch>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      iserror: null == iserror
          ? _value.iserror
          : iserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<UnsplashSearch> hotelModelList,
      required this.isLoading,
      required this.iserror})
      : _hotelModelList = hotelModelList;

  final List<UnsplashSearch> _hotelModelList;
  @override
  List<UnsplashSearch> get hotelModelList {
    if (_hotelModelList is EqualUnmodifiableListView) return _hotelModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotelModelList);
  }

  @override
  final bool isLoading;
  @override
  final bool iserror;

  @override
  String toString() {
    return 'Hotel1State(hotelModelList: $hotelModelList, isLoading: $isLoading, iserror: $iserror)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._hotelModelList, _hotelModelList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.iserror, iserror) || other.iserror == iserror));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_hotelModelList), isLoading, iserror);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements Hotel1State {
  const factory _Initial(
      {required final List<UnsplashSearch> hotelModelList,
      required final bool isLoading,
      required final bool iserror}) = _$_Initial;

  @override
  List<UnsplashSearch> get hotelModelList;
  @override
  bool get isLoading;
  @override
  bool get iserror;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
