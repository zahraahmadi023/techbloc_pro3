import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:techbloc_pro3/component/api_constants.dart';
import 'package:techbloc_pro3/models/poster_model.dart';
import 'package:techbloc_pro3/services/dio_services.dart';

class HomeScreenController extends GetxController{
  late Rx<PosterMoldel> poster;
  RxList tagList=RxList();
  RxList topVisitedList=RxList();
  RxList topPodcastsList=RxList();
  getHomeItem()async{
    var response=await DioServices().getMethode(ApiConstants.getHomeItem);
    response.data["poster"];
    response.data["top_visited"];
    response.data["top_podcasts"];
    response.data["tags"];
    print(response.data["poster"]["title"]); 

  }
  

  

}