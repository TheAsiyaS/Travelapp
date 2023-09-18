// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HotelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hotelDetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hotelDetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hotelDetailsGet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HotelDetailsGet value) hotelDetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HotelDetailsGet value)? hotelDetailsGet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HotelDetailsGet value)? hotelDetailsGet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelEventCopyWith<$Res> {
  factory $HotelEventCopyWith(
          HotelEvent value, $Res Function(HotelEvent) then) =
      _$HotelEventCopyWithImpl<$Res, HotelEvent>;
}

/// @nodoc
class _$HotelEventCopyWithImpl<$Res, $Val extends HotelEvent>
    implements $HotelEventCopyWith<$Res> {
  _$HotelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HotelDetailsGetCopyWith<$Res> {
  factory _$$_HotelDetailsGetCopyWith(
          _$_HotelDetailsGet value, $Res Function(_$_HotelDetailsGet) then) =
      __$$_HotelDetailsGetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HotelDetailsGetCopyWithImpl<$Res>
    extends _$HotelEventCopyWithImpl<$Res, _$_HotelDetailsGet>
    implements _$$_HotelDetailsGetCopyWith<$Res> {
  __$$_HotelDetailsGetCopyWithImpl(
      _$_HotelDetailsGet _value, $Res Function(_$_HotelDetailsGet) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_HotelDetailsGet implements _HotelDetailsGet {
  const _$_HotelDetailsGet();

  @override
  String toString() {
    return 'HotelEvent.hotelDetailsGet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_HotelDetailsGet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() hotelDetailsGet,
  }) {
    return hotelDetailsGet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? hotelDetailsGet,
  }) {
    return hotelDetailsGet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? hotelDetailsGet,
    required TResult orElse(),
  }) {
    if (hotelDetailsGet != null) {
      return hotelDetailsGet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HotelDetailsGet value) hotelDetailsGet,
  }) {
    return hotelDetailsGet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HotelDetailsGet value)? hotelDetailsGet,
  }) {
    return hotelDetailsGet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HotelDetailsGet value)? hotelDetailsGet,
    required TResult orElse(),
  }) {
    if (hotelDetailsGet != null) {
      return hotelDetailsGet(this);
    }
    return orElse();
  }
}

abstract class _HotelDetailsGet implements HotelEvent {
  const factory _HotelDetailsGet() = _$_HotelDetailsGet;
}

/// @nodoc
mixin _$HotelState {
  List<HotelModel> get hotelModelList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get iserror => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HotelStateCopyWith<HotelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelStateCopyWith<$Res> {
  factory $HotelStateCopyWith(
          HotelState value, $Res Function(HotelState) then) =
      _$HotelStateCopyWithImpl<$Res, HotelState>;
  @useResult
  $Res call({List<HotelModel> hotelModelList, bool isLoading, bool iserror});
}

/// @nodoc
class _$HotelStateCopyWithImpl<$Res, $Val extends HotelState>
    implements $HotelStateCopyWith<$Res> {
  _$HotelStateCopyWithImpl(this._value, this._then);

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
              as List<HotelModel>,
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
abstract class _$$_InitialCopyWith<$Res> implements $HotelStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HotelModel> hotelModelList, bool isLoading, bool iserror});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HotelStateCopyWithImpl<$Res, _$_Initial>
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
              as List<HotelModel>,
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
      {required final List<HotelModel> hotelModelList,
      required this.isLoading,
      required this.iserror})
      : _hotelModelList = hotelModelList;

  final List<HotelModel> _hotelModelList;
  @override
  List<HotelModel> get hotelModelList {
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
    return 'HotelState(hotelModelList: $hotelModelList, isLoading: $isLoading, iserror: $iserror)';
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

abstract class _Initial implements HotelState {
  const factory _Initial(
      {required final List<HotelModel> hotelModelList,
      required final bool isLoading,
      required final bool iserror}) = _$_Initial;

  @override
  List<HotelModel> get hotelModelList;
  @override
  bool get isLoading;
  @override
  bool get iserror;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
