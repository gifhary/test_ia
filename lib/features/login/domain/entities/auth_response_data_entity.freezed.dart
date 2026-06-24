// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponseDataEntity {

 String get accessToken; String get tokenType; int get expiresIn; String get refreshToken;
/// Create a copy of AuthResponseDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseDataEntityCopyWith<AuthResponseDataEntity> get copyWith => _$AuthResponseDataEntityCopyWithImpl<AuthResponseDataEntity>(this as AuthResponseDataEntity, _$identity);

  /// Serializes this AuthResponseDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponseDataEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenType,expiresIn,refreshToken);

@override
String toString() {
  return 'AuthResponseDataEntity(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AuthResponseDataEntityCopyWith<$Res>  {
  factory $AuthResponseDataEntityCopyWith(AuthResponseDataEntity value, $Res Function(AuthResponseDataEntity) _then) = _$AuthResponseDataEntityCopyWithImpl;
@useResult
$Res call({
 String accessToken, String tokenType, int expiresIn, String refreshToken
});




}
/// @nodoc
class _$AuthResponseDataEntityCopyWithImpl<$Res>
    implements $AuthResponseDataEntityCopyWith<$Res> {
  _$AuthResponseDataEntityCopyWithImpl(this._self, this._then);

  final AuthResponseDataEntity _self;
  final $Res Function(AuthResponseDataEntity) _then;

/// Create a copy of AuthResponseDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? tokenType = null,Object? expiresIn = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthResponseDataEntity].
extension AuthResponseDataEntityPatterns on AuthResponseDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String tokenType,  int expiresIn,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseDataEntity() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.expiresIn,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String tokenType,  int expiresIn,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDataEntity():
return $default(_that.accessToken,_that.tokenType,_that.expiresIn,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String tokenType,  int expiresIn,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDataEntity() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.expiresIn,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponseDataEntity implements AuthResponseDataEntity {
  const _AuthResponseDataEntity({required this.accessToken, required this.tokenType, required this.expiresIn, required this.refreshToken});
  factory _AuthResponseDataEntity.fromJson(Map<String, dynamic> json) => _$AuthResponseDataEntityFromJson(json);

@override final  String accessToken;
@override final  String tokenType;
@override final  int expiresIn;
@override final  String refreshToken;

/// Create a copy of AuthResponseDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseDataEntityCopyWith<_AuthResponseDataEntity> get copyWith => __$AuthResponseDataEntityCopyWithImpl<_AuthResponseDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponseDataEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenType,expiresIn,refreshToken);

@override
String toString() {
  return 'AuthResponseDataEntity(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseDataEntityCopyWith<$Res> implements $AuthResponseDataEntityCopyWith<$Res> {
  factory _$AuthResponseDataEntityCopyWith(_AuthResponseDataEntity value, $Res Function(_AuthResponseDataEntity) _then) = __$AuthResponseDataEntityCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String tokenType, int expiresIn, String refreshToken
});




}
/// @nodoc
class __$AuthResponseDataEntityCopyWithImpl<$Res>
    implements _$AuthResponseDataEntityCopyWith<$Res> {
  __$AuthResponseDataEntityCopyWithImpl(this._self, this._then);

  final _AuthResponseDataEntity _self;
  final $Res Function(_AuthResponseDataEntity) _then;

/// Create a copy of AuthResponseDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? tokenType = null,Object? expiresIn = null,Object? refreshToken = null,}) {
  return _then(_AuthResponseDataEntity(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
