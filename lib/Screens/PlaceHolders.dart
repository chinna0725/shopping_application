import 'package:flutter/material.dart';

class BannerPlaceholder extends StatefulWidget {

  final int height;
  final int width;
  const BannerPlaceholder({Key? key, required this.height, required this.width,}) : super(key: key);

  @override
  State<BannerPlaceholder> createState() => _BannerPlaceholderState();
}

class _BannerPlaceholderState extends State<BannerPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 10.0,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          Container(
            width: width,
            height: 10.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}