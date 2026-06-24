// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponseEntity {

 AuthResponseStatus get status; AuthResponseDataEntity get data;
/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseEntityCopyWith<AuthResponseEntity> get copyWith => _$AuthResponseEntityCopyWithImpl<AuthResponseEntity>(this as AuthResponseEntity, _$identity);

  /// Serializes this AuthResponseEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponseEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthResponseEntity(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthResponseEntityCopyWith<$Res>  {
  factory $AuthResponseEntityCopyWith(AuthResponseEntity value, $Res Function(AuthResponseEntity) _then) = _$AuthResponseEntityCopyWithImpl;
@useResult
$Res call({
 AuthResponseStatus status, AuthResponseDataEntity data
});


$AuthResponseDataEntityCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthResponseEntityCopyWithImpl<$Res>
    implements $AuthResponseEntityCopyWith<$Res> {
  _$AuthResponseEntityCopyWithImpl(this._self, this._then);

  final AuthResponseEntity _self;
  final $Res Function(AuthResponseEntity) _then;

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthResponseStatus,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthResponseDataEntity,
  ));
}
/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthResponseDataEntityCopyWith<$Res> get data {
  
  return $AuthResponseDataEntityCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponseEntity].
extension AuthResponseEntityPatterns on AuthResponseEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthResponseStatus status,  AuthResponseDataEntity data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
return $default(_that.status,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthResponseStatus status,  AuthResponseDataEntity data)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseEntity():
return $default(_that.status,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthResponseStatus status,  AuthResponseDataEntity data)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponseEntity implements AuthResponseEntity {
  const _AuthResponseEntity({required this.status, required this.data});
  factory _AuthResponseEntity.fromJson(Map<String, dynamic> json) => _$AuthResponseEntityFromJson(json);

@override final  AuthResponseStatus status;
@override final  AuthResponseDataEntity data;

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseEntityCopyWith<_AuthResponseEntity> get copyWith => __$AuthResponseEntityCopyWithImpl<_AuthResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponseEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthResponseEntity(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseEntityCopyWith<$Res> implements $AuthResponseEntityCopyWith<$Res> {
  factory _$AuthResponseEntityCopyWith(_AuthResponseEntity value, $Res Function(_AuthResponseEntity) _then) = __$AuthResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 AuthResponseStatus status, AuthResponseDataEntity data
});


@override $AuthResponseDataEntityCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthResponseEntityCopyWithImpl<$Res>
    implements _$AuthResponseEntityCopyWith<$Res> {
  __$AuthResponseEntityCopyWithImpl(this._self, this._then);

  final _AuthResponseEntity _self;
  final $Res Function(_AuthResponseEntity) _then;

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_AuthResponseEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthResponseStatus,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthResponseDataEntity,
  ));
}

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthResponseDataEntityCopyWith<$Res> get data {
  
  return $AuthResponseDataEntityCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
