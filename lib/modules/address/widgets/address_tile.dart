import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/address/address_fetch_response.dart';
import 'package:food_delivery/modules/checkout_tab/checkout_screen.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../address_controller.dart';

class AddressTile extends StatelessWidget {
  AddressTile({required this.addresses, Key? key}) : super(key: key);

  Addresses addresses;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        minVerticalPadding: 10,
        horizontalTitleGap: 0,
        onTap: () {
          Get.back();
          controller.addressId(addresses.addressId);
          controller.streetName(addresses.street);
          controller.houseNo(addresses.houseNo);
        },
        leading: Icon(
          Icons.location_on_outlined,
          color: Colors.black54,
          size: 22,
        ),
        title: Text(
          "House No. ${addresses.houseNo} , ${addresses.street}",
          style: TextStyle(color: primaryColor, fontSize: 14),
        ),
      ),
    );
  }
}
