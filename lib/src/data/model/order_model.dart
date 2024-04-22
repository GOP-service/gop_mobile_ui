import 'dart:ffi';

class OrderModel {
  final String id;
  final String customerId;
  final String orderStatus;
  final DateTime orderDate;
  final String orderType;
  final String? vehicleType;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? pickUpAddress;
  final Double? pickUpLat;
  final Double? pickUpLng;
  final String? dropOffAddress;
  final Double? dropOffLat;
  final Double? dropOffLng;

  final int? deliveryFee;
  final int? subTotal;
  final int? total;
  final Double? duration;
  final Double? distance;

  OrderModel({
    required this.id,
    required this.customerId,
    required this.orderStatus,
    required this.orderDate,
    required this.orderType,
    this.vehicleType,
    this.paymentMethod,
    this.paymentStatus,
    this.pickUpAddress,
    this.pickUpLat,
    this.pickUpLng,
    this.dropOffAddress,
    this.dropOffLat,
    this.dropOffLng,
    this.deliveryFee,
    this.subTotal,
    this.total,
    this.duration,
    this.distance,
  });

//todo: implement TYPE
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      customerId: json['customer_id'],
      orderStatus: json['order_status'],
      orderDate: DateTime.parse(json['order_date']),
      orderType: json['order_type'],
      vehicleType: json['vehicle_type'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      pickUpAddress: json['pick_up_address'],
      pickUpLat: json['pick_up_lat'],
      pickUpLng: json['pick_up_lng'],
      dropOffAddress: json['drop_off_address'],
      dropOffLat: json['drop_off_lat'],
      dropOffLng: json['drop_off_lng'],
      deliveryFee: json['delivery_fee'],
      subTotal: json['sub_total'],
      total: json['total'],
      duration: json['duration'],
      distance: json['distance'],
    );
  }

//todo  implement toJson
  Map<String, dynamic> toJson() {
    return {};
  }
}
