import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/domain_data/custom_mixin/mixen_widgets/empty_widget.dart';
import 'package:weather_app/domain_data/custom_mixin/mixen_widgets/error_widget.dart';
import 'package:weather_app/domain_data/custom_mixin/mixen_widgets/loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/remote_data/response_model.dart';
import 'mixen_widgets/auth_error_widget.dart';
import 'mixen_widgets/load_more.dart';
import 'mixen_widgets/status_error.dart';

mixin CustomStateMixin<T> on ListNotifierMixin {
  dynamic _value;
  RxStatus? _status;
  TRefresher tRefresher = TRefresher();

  dynamic getMethod(
      bool isRefresh, Future<ResponseModel?> Function() futureMethod,
      {int page = 1, Function(int)? getPage}) async {
    ResponseModel? data = await futureMethod();
    sPrint.info('data::: ${data?.toJson()}');
    return checkStatus(data, () {
      getPage?.call(++page);
      return data;
    });
  }

  dynamic refreshData(
      {required dynamic model,
      required Future<ResponseModel<T>> Function() futureMethod,
      ResponseModel Function(dynamic data)? checkIfEmpty,
      required RefreshController controller,
      required Function(int)? getPage}) async {
    ResponseModel? result;
    try {
      sPrint.info('call refresh data');
      change('', status: RxStatus.loading());
      result = await tRefresher.onRefresh(model,
          controller: controller,
          getData: (refresh) =>
              getMethod(refresh, futureMethod, page: 1, getPage: getPage));
      if (result != null) {
        if (checkIfEmpty != null) {
          result = checkIfEmpty.call(result);
        }
        sPrint.info('change result:: ${result.status}');
        change(result);
        return result;
      }
    } catch (e, s) {
      sPrint.error(e.toString(), s);
    }
    return result;
  }

  // دا اللي هيستقبل أكتر من Future
Future<Map<String, dynamic>> refreshDataMulti({
  required List<Future<ResponseModel>> Function() futureMethods,
  required RefreshController controller,
  ResponseModel Function(List<ResponseModel> data)? checkIfEmpty,
  Function(int)? getPage,
}) async {
  try {
    change(null, status: RxStatus.loading());
    controller.requestRefresh();

    // ⬅️ نستقبل الاثنين API مع بعض
    final List<ResponseModel> results = await Future.wait(futureMethods());

    ResponseModel finalResult =
        checkIfEmpty != null ? checkIfEmpty(results) : results.first;

    controller.refreshCompleted();
    change(finalResult.data, status: RxStatus.success());

    // ⬅️ هنا بقى بنرجع موديلين
    return {
      "weather": results[0].data,
      "forecast": results[1].data,
    };

  } catch (e) {
    controller.refreshFailed();
    change(null, status: RxStatus.error(e.toString()));
    return {};
  }
}





//   Future<T?> refreshData<T>({
//   required T model,
//   required Future<ResponseModel<dynamic>> Function() futureMethod,
//   required T Function(T response) checkIfEmpty, // ← Key fix
//   required RefreshController controller,
//   required Function(int)? getPage,
// }) async {
//   T? result = model;
//   try {
//     sPrint.info('call refresh data');
//     change(null, status: RxStatus.loading());

//     final response = await tRefresher.onRefresh(model as ResponseModel?,
//         controller: controller,
//         getData: (refresh) =>
//             getMethod(refresh, futureMethod, page: 1, getPage: getPage));

//     if (response is T) {
//       result = checkIfEmpty(response as T);
//     } else if (response == null) {
//       result = model;
//     }

//     sPrint.info('change result');
//     change(result, status: RxStatus.success());
//     return result;
//   } catch (e, s) {
//     sPrint.error(e.toString(), s);
//     change(model, status: RxStatus.error(e.toString()));
//     return model;
//   } finally {
//     controller.refreshCompleted();
//   }
// }

  loadMoreData(
      {required dynamic model,
      required Future<ResponseModel> Function() futureMethod,
      required Function(dynamic data) addModel,
      required RefreshController controller,
      required int page,
      required Function(int)? getPage}) async {
    ResponseModel? result = await tRefresher.loadMoreMethod(model, addModel,
        controller: controller,
        getData: (refresh) =>
            getMethod(refresh, futureMethod, page: page, getPage: getPage));
    change(result);
    return result;
  }

  checkStatus(
    dynamic data,
    Function onSuccess, {
    bool useChange = true,
    Function(String)? onError,
    bool isShowToast = true,
    dynamic baseModel,
  }) {
    StatusError statusError = StatusError();
    return statusError.checkStatus(data, onSuccess,
        stateMixin: this, onError: onError, showErrorToast: isShowToast);
  }

  bool _isNullOrEmpty(dynamic val) {
    if (val == null) return true;
    var result = false;
    if (val is Iterable) {
      result = val.isEmpty;
    } else if (val is String) {
      result = val.isEmpty;
    } else if (val is Map) {
      result = val.isEmpty;
    }
    return result;
  }

  void _fillEmptyStatus() {
    _status = _isNullOrEmpty(_value) ? RxStatus.loading() : RxStatus.success();
  }

  RxStatus get status {
    notifyChildrens();
    return _status ??= _status = RxStatus.loading();
  }

  T? get state => value;

  @protected
  T? get value {
    notifyChildrens();
    return _value;
  }

  @protected
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  @protected
  void change(dynamic newState, {RxStatus? status}) {
    StatusError statusError = StatusError();
    var canUpdate = false;
    if (newState is ResponseModel) {
      sPrint.warning(
          'get status:: ${statusError.getStatus(newState.status ?? 0)}');
      switch (statusError.getStatus(newState.status ?? 0)) {
        case StatusType.apiError:
          _status = RxStatus.error(newState.message);
          break;
        case StatusType.apiSuccess:
          _status = RxStatus.success();
          break;
        case StatusType.authError:
          _status = RxStatus.authentication();
          break;
        case StatusType.empty:
          sPrint.warning('get empty');
          _status = RxStatus.empty();
          break;
        case StatusType.none:
          _status = RxStatus.error('no data');
          break;
        case StatusType.ban:
          _status = RxStatus.authentication();
          break;
      }
      _value = newState;
      canUpdate = true;
    }

    if (status != null) {
      _status = status;
      canUpdate = true;
    }
    if (newState != _value) {
      _value = newState;
      canUpdate = true;
    }

    if (canUpdate) {
      refresh();
    }
  }

  void append(Future<ResponseModel> Function() Function() body,
      {String? errorMessage}) {
    final compute = body();
    compute().then((newValue) {
      change(newValue);
    }, onError: (err) {
      change(state);
    });
  }
}

class Value<T> extends ListNotifier
    with CustomStateMixin<T>
    implements ValueListenable<T?> {
  Value(T val) {
    _value = val;
    _fillEmptyStatus();
  }

  @override
  T? get value {
    notifyChildrens();
    return _value;
  }

  @override
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  T? call([T? v]) {
    if (v != null) {
      value = v;
    }
    return value;
  }

  void update(void Function(T? value) fn) {
    fn(value);
    refresh();
  }

  @override
  String toString() => value.toString();

  dynamic toJson() => (value as dynamic)?.toJson();
}

extension ReactiveT<T> on T {
  Value<T> get reactive => Value<T>(this);
}

typedef Condition = bool Function();

abstract class GetNotifier<T> extends Value<ResponseModel>
    with GetLifeCycleBase {
  GetNotifier(ResponseModel initial) : super(initial) {
    $configureLifeCycle();
  }

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    ambiguate(SchedulerBinding.instance)
        ?.addPostFrameCallback((_) => onReady());
  }
}

extension StateExt<T> on CustomStateMixin<T> {
  Widget obx(NotifierBuilder<T?> widget,
      {Function()? onTap,
      Widget Function(String? error)? onError,
      Widget? onLoading,
      Widget? onEmpty,
      Color backgroundColor = CustomColors.transparent}) {
    return SimpleBuilder(builder: (_) {
      sPrint.info(
          ':::::::status:::::: =========> ${status.isEmpty ? "empty" : status.isLoading ? "loading" : status.isAuthError ? "error:${status.errorMessage}" : "success"}');
      if (status.isLoading) {
        return onLoading ??
            Container(
                alignment: Alignment.center,
                color: backgroundColor,
                child: const LoadingWidget());
      } else if (status.isAuthError) {
        return const AuthErrorWidget();
      } else if (status.isError) {
        return onError != null
            ? onError(status.errorMessage)
            : CustomErrorWidget(
                _status?.errorMessage,
                onTap: onTap,
              );
      } else if (status.isEmpty) {
        return onEmpty ??
            EmptyWidget(
              onTap: onTap,
            ); // Also can be widget(null); but is risky
      }
      return widget(value);
    });
  }
}

class RxStatus {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isEmpty;
  final bool isAuthError;
  final String? errorMessage;

  RxStatus._({
    this.isEmpty = false,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isAuthError = false,
  });

  factory RxStatus.loading() {
    return RxStatus._(isLoading: true);
  }

  factory RxStatus.authentication() {
    return RxStatus._(isAuthError: true);
  }

  factory RxStatus.success() {
    return RxStatus._(isSuccess: true);
  }

  factory RxStatus.error([String? message]) {
    return RxStatus._(isError: true, errorMessage: message);
  }

  factory RxStatus.empty() {
    return RxStatus._(isEmpty: true);
  }

  toJson() {
    Map<String, dynamic> data = {};
    data['isLoading'] = isLoading;
    data['success'] = isSuccess;
    data['isError'] = isError;
    data['isAuthError'] = isAuthError;
    return data;
  }
}

typedef NotifierBuilder<ResponseModel> = Widget Function(ResponseModel state);
