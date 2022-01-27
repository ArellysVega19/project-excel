import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  final bool child;
  const NotificationsIndicator({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
          if (child)
            Positioned(
              left: 2,
              child: Container(
                width: 5,
                height: 5,
                decoration: buildBoxDecoration(),
              ),
            )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.red, borderRadius: BorderRadius.circular(100));
}
