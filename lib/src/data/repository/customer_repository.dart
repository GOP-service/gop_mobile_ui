import 'package:gop_passenger/core/dio_manager.dart';
import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/src/data/data_source/customer_controller.dart';
import 'package:gop_passenger/src/data/model/customer_model.dart';

class CustomerRepository {
  late final CustomerModel? customerModel;
  late final DioManager _dioManager;
  late final CustomerController customerController;

  CustomerRepository({required DioManager dioManager}) {
    _dioManager = dioManager;
    customerController = CustomerController(dioManager: _dioManager);
  }

  Future<Result> getProfile() async {
    try {
      final response = await customerController.getProfile();
      if (response is Success) {
        customerModel = CustomerModel.fromJson(response.data);
        return Success(null);
      }
    } catch (e) {
      return Failure(e.toString());
    }
    return Failure('Failed to get profile');
  }
}
