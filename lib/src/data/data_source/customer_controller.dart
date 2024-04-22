import 'package:gop_passenger/core/dio_manager.dart';
import 'package:gop_passenger/core/result_type.dart';

class CustomerController {
  final DioManager dioManager;

  CustomerController({required this.dioManager});

  Future<Result> getProfile() async {
    return await dioManager.toggleRequest((token) async {
      return await dioManager.get('/auth/profile/customer', token);
    }, 'get profile');
  }
}
