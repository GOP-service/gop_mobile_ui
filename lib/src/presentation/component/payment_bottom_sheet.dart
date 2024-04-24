import 'package:flutter/material.dart';
import 'package:gop_passenger/core/app_icon.dart';
import 'package:gop_passenger/src/presentation/component/color_filtered_svg_image.dart';
import 'package:gop_passenger/src/presentation/state/payment_method.dart';


class PaymentBottomSheet extends StatefulWidget {
  final Function(PaymentMethod) onClosed;
  const PaymentBottomSheet({
    Key? key,
    required this.onClosed,
  }) : super(key: key);

  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: const ColorFilteredSvgImage(
                url: AppIcon.icMoneyBills,
                width: 24,
                height: 24,
                color: Colors.green),
            title: Text('Tiền mặt'),
            onTap: () {
              widget.onClosed(PaymentMethod.cash);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const ColorFilteredSvgImage(
                url: AppIcon.icCreditCard,
                width: 24,
                height: 24,
                color: Colors.green),
            title: Text('Chuyển khoản'),
            onTap: () {
              widget.onClosed(PaymentMethod.bankTransfer);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const ColorFilteredSvgImage(
                url: AppIcon.icCcPaypal, width: 24, height: 24, color: Colors.green),
            title: Text('Paypal'),
            onTap: () {
              widget.onClosed(PaymentMethod.paypal);
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
