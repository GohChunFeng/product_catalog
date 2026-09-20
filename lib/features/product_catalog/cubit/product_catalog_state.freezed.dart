// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_catalog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductCatalogState {

 PageLoadData<ProductCatalogModel> get productCatalogPageLoadData; LoadData<ProductDetailModel> get productDetailLoadData;
/// Create a copy of ProductCatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCatalogStateCopyWith<ProductCatalogState> get copyWith => _$ProductCatalogStateCopyWithImpl<ProductCatalogState>(this as ProductCatalogState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductCatalogState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCatalogState&&(identical(other.productCatalogPageLoadData, _this.productCatalogPageLoadData) || other.productCatalogPageLoadData == _this.productCatalogPageLoadData)&&(identical(other.productDetailLoadData, _this.productDetailLoadData) || other.productDetailLoadData == _this.productDetailLoadData));
}


@override
int get hashCode {
  final _this = this as ProductCatalogState;
  return Object.hash(runtimeType,_this.productCatalogPageLoadData,_this.productDetailLoadData);
}

@override
String toString() {
  final _this = this as ProductCatalogState;
  return 'ProductCatalogState(productCatalogPageLoadData: ${_this.productCatalogPageLoadData}, productDetailLoadData: ${_this.productDetailLoadData})';
}


}

/// @nodoc
abstract mixin class $ProductCatalogStateCopyWith<$Res>  {
  factory $ProductCatalogStateCopyWith(ProductCatalogState value, $Res Function(ProductCatalogState) _then) = _$ProductCatalogStateCopyWithImpl;
@useResult
$Res call({
 PageLoadData<ProductCatalogModel> productCatalogPageLoadData, LoadData<ProductDetailModel> productDetailLoadData
});




}
/// @nodoc
class _$ProductCatalogStateCopyWithImpl<$Res>
    implements $ProductCatalogStateCopyWith<$Res> {
  _$ProductCatalogStateCopyWithImpl(this._self, this._then);

  final ProductCatalogState _self;
  final $Res Function(ProductCatalogState) _then;

/// Create a copy of ProductCatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productCatalogPageLoadData = null,Object? productDetailLoadData = null,}) {
  return _then(ProductCatalogState(
productCatalogPageLoadData: null == productCatalogPageLoadData ? _self.productCatalogPageLoadData : productCatalogPageLoadData // ignore: cast_nullable_to_non_nullable
as PageLoadData<ProductCatalogModel>,productDetailLoadData: null == productDetailLoadData ? _self.productDetailLoadData : productDetailLoadData // ignore: cast_nullable_to_non_nullable
as LoadData<ProductDetailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductCatalogState].
extension ProductCatalogStatePatterns on ProductCatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCatalogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCatalogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCatalogState value)  $default,){
final _that = this;
switch (_that) {
case _ProductCatalogState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCatalogState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCatalogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageLoadData<ProductCatalogModel> productCatalogPageLoadData,  LoadData<ProductDetailModel> productDetailLoadData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCatalogState() when $default != null:
return $default(_that.productCatalogPageLoadData,_that.productDetailLoadData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageLoadData<ProductCatalogModel> productCatalogPageLoadData,  LoadData<ProductDetailModel> productDetailLoadData)  $default,) {final _that = this;
switch (_that) {
case _ProductCatalogState():
return $default(_that.productCatalogPageLoadData,_that.productDetailLoadData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageLoadData<ProductCatalogModel> productCatalogPageLoadData,  LoadData<ProductDetailModel> productDetailLoadData)?  $default,) {final _that = this;
switch (_that) {
case _ProductCatalogState() when $default != null:
return $default(_that.productCatalogPageLoadData,_that.productDetailLoadData);case _:
  return null;

}
}

}

/// @nodoc


class _ProductCatalogState implements ProductCatalogState {
  const _ProductCatalogState({this.productCatalogPageLoadData = const PageLoadData.init(), this.productDetailLoadData = const LoadData.init()});
  

@override@JsonKey() final  PageLoadData<ProductCatalogModel> productCatalogPageLoadData;
@override@JsonKey() final  LoadData<ProductDetailModel> productDetailLoadData;

/// Create a copy of ProductCatalogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCatalogStateCopyWith<_ProductCatalogState> get copyWith => __$ProductCatalogStateCopyWithImpl<_ProductCatalogState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCatalogState&&(identical(other.productCatalogPageLoadData, productCatalogPageLoadData) || other.productCatalogPageLoadData == productCatalogPageLoadData)&&(identical(other.productDetailLoadData, productDetailLoadData) || other.productDetailLoadData == productDetailLoadData));
}


@override
int get hashCode {
    return Object.hash(runtimeType,productCatalogPageLoadData,productDetailLoadData);
}

@override
String toString() {
    return 'ProductCatalogState(productCatalogPageLoadData: $productCatalogPageLoadData, productDetailLoadData: $productDetailLoadData)';
}


}

/// @nodoc
abstract mixin class _$ProductCatalogStateCopyWith<$Res> implements $ProductCatalogStateCopyWith<$Res> {
  factory _$ProductCatalogStateCopyWith(_ProductCatalogState value, $Res Function(_ProductCatalogState) _then) = __$ProductCatalogStateCopyWithImpl;
@override @useResult
$Res call({
 PageLoadData<ProductCatalogModel> productCatalogPageLoadData, LoadData<ProductDetailModel> productDetailLoadData
});




}
/// @nodoc
class __$ProductCatalogStateCopyWithImpl<$Res>
    implements _$ProductCatalogStateCopyWith<$Res> {
  __$ProductCatalogStateCopyWithImpl(this._self, this._then);

  final _ProductCatalogState _self;
  final $Res Function(_ProductCatalogState) _then;

/// Create a copy of ProductCatalogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productCatalogPageLoadData = null,Object? productDetailLoadData = null,}) {
  return _then(_ProductCatalogState(
productCatalogPageLoadData: null == productCatalogPageLoadData ? _self.productCatalogPageLoadData : productCatalogPageLoadData // ignore: cast_nullable_to_non_nullable
as PageLoadData<ProductCatalogModel>,productDetailLoadData: null == productDetailLoadData ? _self.productDetailLoadData : productDetailLoadData // ignore: cast_nullable_to_non_nullable
as LoadData<ProductDetailModel>,
  ));
}


}

// dart format on
