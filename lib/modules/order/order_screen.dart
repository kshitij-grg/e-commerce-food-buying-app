import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/order/order_details.dart';
import 'package:food_delivery/modules/order/order_details_controller.dart';
import 'package:food_delivery/modules/order/widgets/order_status.dart';
import 'package:food_delivery/widgets/loading.dart';
import 'package:get/get.dart';
import 'widgets/order_history_tile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final putController = Get.put(OrderDetailsController());

  final controller = Get.find<OrderDetailsController>();

  int selectedIndex = 0;
  final PageController _pageController = PageController();

  Widget getOrders(String selectedStatus) {
    List<OrderHistory> selectedOrders = [];

    if (selectedStatus == "All") {
      selectedOrders = controller.orderHistory;
    } else {
      for (OrderHistory order in controller.orderHistory) {
        if (selectedStatus == order.orderStatus) {
          selectedOrders.add(order);
        }
      }
    }

    return ListView.builder(
        itemCount: selectedOrders.length,
        itemBuilder: (context, index) {
          return OrderHistoryTile(
            orderHistory: selectedOrders[index],
            index: index,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Loading(
                size: 200,
              )
            : controller.orderHistory.isEmpty
                ? Center(
                    child: Text('You have not ordered anything yet'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        OrderStatus(
                            selectedIndex: selectedIndex,
                            onPressed: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                              _pageController.jumpToPage(index);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          controller: _pageController,
                          children: [
                            getOrders("All"),
                            getOrders("Pending"),
                            getOrders("Paid"),
                          ],
                        ))
                      ],
                    ),
                  ),
      ),
    );
  }
}
