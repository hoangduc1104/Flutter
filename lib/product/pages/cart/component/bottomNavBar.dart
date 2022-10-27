import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tổng tiền:",
                  style: TextStyle(
                      color: Color(0xFF4C53A5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "\$200",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF4C53A5),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Thanh toán",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
