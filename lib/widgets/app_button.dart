import 'package:edd_life/asset/images.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
    required this.asset,
  });

  String text;
  VoidCallback? onPressed;
  bool loading;
  String asset;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll<EdgeInsets?>(
            EdgeInsets.symmetric(vertical: 20)),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            width: 90,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          if (loading)
            const SizedBox(height: 10, width: 10, child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
