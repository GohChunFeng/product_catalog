import 'package:flutter/material.dart';

enum LoadState {
  ///when request is loading
  loading,

  ///when request success
  success,

  ///when request failure
  failure,

  ///when request content is empty
  empty,
}

///Used to describe the status, errors, and data of requests
@immutable
class LoadData<T> {
  final LoadState state;
  final T? value;
  final dynamic error;

  const LoadData._({this.state = LoadState.loading, this.value, this.error});

  const LoadData.init() : this._();

  LoadData<T> load() {
    return LoadData._(state: LoadState.loading);
  }

  LoadData<T> success(T? value) {
    return LoadData._(state: LoadState.success, value: value);
  }

  LoadData<T> failure(dynamic error) {
    return LoadData._(state: LoadState.failure, error: error);
  }

  LoadData<T> empty() {
    return LoadData._(state: LoadState.empty);
  }

  @override
  int get hashCode => Object.hash(state, value, error);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is LoadData<T> &&
        other.state == state &&
        other.error == error &&
        other.value == value;
  }
}

///Used to describe the status, errors, and data of paging requests
@immutable
class PageLoadData<T> {
  static const initPageIndex = 1;

  final LoadState state;
  final dynamic error;

  final List<T>? value;
  final int pageIndex;

  const PageLoadData._({
    this.state = LoadState.loading,
    this.error,
    this.value,
    this.pageIndex = initPageIndex,
  });

  const PageLoadData.init() : this._();

  PageLoadData<T> load(bool refresh) {
    LoadState state;
    dynamic error;
    List<T>? value;
    int pageIndex;

    if (refresh) {
      state = LoadState.loading;
      error = null;
      value = null;
      pageIndex = initPageIndex;
    } else {
      state = this.state;
      error = null;
      value = this.value;
      pageIndex = this.pageIndex;
    }

    return PageLoadData._(
      state: state,
      error: error,
      value: value,
      pageIndex: pageIndex,
    );
  }

  ///extraEmptyJudge: Used to extra determine if the content is empty
  ///Sometimes it contains not only the list but also the header data
  PageLoadData<T> success(
    List<T>? newPageList, {
    bool Function()? extraIsEmpty,
  }) {
    LoadState state; //success or empty
    List<T>? value; //oldValue + newPageList
    int pageIndex; //forward or unchanged

    //Combine result
    final oldList = this.value;
    final newList = newPageList;
    if ((oldList?.isNotEmpty ?? false) || (newList?.isNotEmpty ?? false)) {
      value = [];
      if (oldList?.isNotEmpty ?? false) {
        value.addAll(oldList!);
      }
      if (newList?.isNotEmpty ?? false) {
        value.addAll(newList!);
      }
    }
    //judge pageIndex
    if (newList?.isNotEmpty ?? false) {
      pageIndex = this.pageIndex + 1;
    } else {
      pageIndex = this.pageIndex;
    }
    //judge state
    if (value?.isNotEmpty ?? false) {
      state = LoadState.success;
    } else {
      state = LoadState.empty;
      if (!(extraIsEmpty?.call() ?? true)) {
        state = LoadState.success;
      }
    }

    return PageLoadData._(
      state: state,
      error: null,
      value: value,
      pageIndex: pageIndex,
    );
  }

  PageLoadData<T> failure(dynamic error) {
    LoadState state; //failure or success
    List<T>? value = this.value;
    int pageIndex = this.pageIndex;

    if (value?.isNotEmpty ?? false) {
      //Because we need to display the data that has been loaded
      state = LoadState.success;
    } else {
      state = LoadState.failure;
    }

    return PageLoadData._(
      state: state,
      error: error,
      value: value,
      pageIndex: pageIndex,
    );
  }

  int getPage(bool refresh) {
    if (refresh) {
      return initPageIndex;
    }
    return pageIndex;
  }

  @override
  int get hashCode => Object.hash(state, error, value, pageIndex);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is PageLoadData<T> &&
        other.state == state &&
        other.error == error &&
        other.value == value &&
        other.pageIndex == pageIndex;
  }
}

///Used to easily handle the loading state
class LoadStateUtil {
  LoadStateUtil._();

  static Widget switchLoadState(
    LoadState state, {
    required Widget Function() success,
    Widget Function()? loading,
    Widget Function()? failure,
    Widget Function()? empty,
    Widget Function()? loadingInCenter,
    Widget Function()? failureInCenter,
    Widget Function()? emptyInCenter,
  }) {
    if (state == LoadState.success) {
      return success();
    }

    Widget child;
    switch (state) {
      case LoadState.success:
        {
          //unreachable
          child = Placeholder();
          break;
        }
      case LoadState.loading:
        {
          if (loading != null) {
            return loading();
          }
          child = loadingInCenter?.call() ?? CircularProgressIndicator();
          break;
        }
      case LoadState.failure:
        {
          if (failure != null) {
            return failure();
          }
          child = failureInCenter?.call() ?? Text('error');
          break;
        }
      case LoadState.empty:
        {
          if (empty != null) {
            return empty();
          }
          child = emptyInCenter?.call() ?? Text('empty');
          break;
        }
    }

    return Center(
      child: FittedBox(fit: BoxFit.none, child: child),
    );
  }

  static Widget switchPageLoadState(
    LoadState state, {
    required Widget Function() success,
    Widget Function()? loading,
    Widget Function()? failure,
    Widget Function()? empty,
    Widget Function()? loadingInScroll,
    Widget Function()? failureInScroll,
    Widget Function()? emptyInScroll,
  }) {
    if (state == LoadState.success) {
      return success();
    }

    Widget childInScroll;
    switch (state) {
      case LoadState.success:
        {
          //unreachable
          childInScroll = Placeholder();
          break;
        }
      case LoadState.loading:
        {
          if (loading != null) {
            return loading();
          }
          childInScroll =
              loadingInScroll?.call() ?? CircularProgressIndicator();
          break;
        }
      case LoadState.failure:
        {
          if (failure != null) {
            return failure();
          }
          childInScroll = failureInScroll?.call() ?? Text('error');
          break;
        }
      case LoadState.empty:
        {
          if (empty != null) {
            return empty();
          }
          childInScroll = emptyInScroll?.call() ?? Text('empty');
          break;
        }
    }
    return LayoutBuilder(
      builder: (ctx, cons) {
        return SingleChildScrollView(
          child: Container(
            height: cons.maxHeight,
            width: double.infinity,
            alignment: Alignment.center,
            child: childInScroll,
          ),
        );
      },
    );
  }
}
