import 'package:admin_dashboard/ui/layouts/dashboard/widget/footer.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/widget/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SideBar(), Expanded(child: child), Footer()],
        ),
      ),
    );
  }
}
