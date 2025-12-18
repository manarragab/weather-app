import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/remote_data/response_model.dart';
import '../../../res/configuration/print_types.dart';


class TRefresher{
 Future <ResponseModel?> onRefresh(ResponseModel? model,{required RefreshController controller,required Function(bool refresh) getData}) async{
    sPrint.info('get refresh explain');
    try{
      model?.more = true;
    }catch(e){
      sPrint.warning(e.toString());
    }
    model = await getData(true);
    if(model != null){
      finishLoaded(true,controller);
    }else{
      failedLoaded(true,controller);
    }
    return model;
  }



  /// getExplain => controller
  /// (smart refresher + load more ) => controller  /// smart refresher => controller
  /// getExplain  + data // = data  (refresh / more )

  Future<ResponseModel?> loadMoreMethod(dynamic model,Function(dynamic data) addModel,{required RefreshController controller,required Function(bool refresh) getData}) async{
    if(model.more == true){
      sPrint.info('load more');
      dynamic res  = await getData(false);
      if(res != null){
        finishLoaded(false,controller);
       dynamic r =  await addModel(res);
        sPrint.info('return $res');
        return r;
      }else{
        failedLoaded(false,controller);
      }
    }else{
      finishLoaded(false, controller,noData: true);
    }
    return model;
  }


  void finishLoaded(bool isRefresh, RefreshController controller, {bool noData = false}) {
    sPrint.info('finish Load  isRefreshed:: $isRefresh  noData:: $noData');
    if (isRefresh) {
      controller.refreshCompleted( resetFooterState:
      controller.footerStatus == LoadStatus.noMore);
    } else {
      sPrint.info('load complete');
      if(noData){
        controller.loadNoData();
      }else{
        controller.loadComplete();
      }
    }
  }

  void failedLoaded(bool isRefresh, RefreshController controller) {
    if (isRefresh) {
      controller.refreshFailed();
    } else {
      controller.loadFailed();
    }
  }
}
