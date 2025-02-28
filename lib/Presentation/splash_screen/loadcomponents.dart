import 'package:asset/Services/getx_services/asset_controller.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';

class Load{

  Future<void> load() async{
    final AssetController _assetController = Get.find<AssetController>();
    await _assetController.fetchAssetsFree(); // Refresh the list
    await _assetController.fetchAssetsPurchased(); // Refresh the list
  }

}