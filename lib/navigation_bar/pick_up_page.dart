import 'package:flutter/material.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {

  final List<Map<String, dynamic>> _requests = [
    {
      "name": "Aditya",
      "orderDetails": "Coffee  (x1),  Red Sauce Pasta  (x1)",
      "pickupTime": "10:00 AM",
    },
    {
      "name": "Prateek",
      "orderDetails": "Cold Coffee  (x1) , Donut  (x2)",
      "pickupTime": "11:30 AM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup Requests'),
      ),
      body: ListView.builder(
        itemCount: _requests.length,
        itemBuilder: (context, index) {
          final request = _requests[index];
          return PickupRequestCard(
            name: request["name"],
            orderDetails: request["orderDetails"],
            pickupTime: request["pickupTime"],
            onAccept: () => handleAccept(index),
            onDecline: () => handleDecline(index),
          );
        },
      ),
    );
  }
  void handleAccept(int index) {
    // Implement logic to handle accepting the request (e.g., update UI, notify server)
    setState(() {
      // Update UI to show request accepted (e.g., change button text)
    });
  }

  void handleDecline(int index) {
    // Implement logic to handle declining the request (e.g., remove from list, notify server)
    setState(() {
      _requests.removeAt(index); // Remove from UI for now
    });
  }
}

class PickupRequestCard extends StatelessWidget {
  final String name;
  final String orderDetails;
  final String pickupTime;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const PickupRequestCard({
    Key? key,
    required this.name,
    required this.orderDetails,
    required this.pickupTime,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Order Details: $orderDetails'),
              SizedBox(height: 8.0),
              Text('Pickup Time: $pickupTime'),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: onAccept,
                    child: Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: onDecline,
                    child: Text('Decline'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
