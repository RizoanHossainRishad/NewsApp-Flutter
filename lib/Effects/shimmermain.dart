
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmermain extends StatefulWidget {
  int child;
  double ratio;
  Shimmermain({super.key,required this.child,required this.ratio});

  @override
  State<Shimmermain> createState() => _ShimmermainState();
}

class _ShimmermainState extends State<Shimmermain> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: screenheight*widget.ratio,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.child,
          itemBuilder: (context, index) {
            return buildShimmer(screenWidth, screenheight);
          },
        ),
      ),
    );
  }

  Widget buildShimmer(double screenWidth, double screenHeight) => Padding(
    padding:EdgeInsets.only(
      left: screenWidth*0.02,
      right:screenWidth*0.02 ,
      top: screenHeight*0.01,
      bottom: screenHeight*0.01,
    ),
    child: Container(
      margin: EdgeInsetsGeometry.only(
        left: screenWidth * 0.01,
        right: screenWidth * 0.01,
        top: screenHeight * 0.001,
        bottom: screenHeight * 0.01,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 3)),

          BoxShadow(color: Colors.black12, offset: Offset(-1, 1)),
          BoxShadow(color: Colors.black12, offset: Offset(1, 1)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
        child: Column(
          children: [
            ShimmerWidget2.rectangular(height: screenHeight * 0.1),
            SizedBox(height: screenHeight * 0.008),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.06),
                  child: ShimmerWidget2.rectangular(
                    height: screenHeight * 0.02,
                    width: screenWidth * 0.1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.07),
                  child: ShimmerWidget2.rectangular(
                    height: screenHeight * 0.02,
                    width: screenWidth * 0.1,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05,right: screenWidth * 0.05),
              child: ShimmerWidget2.rectangular(height: screenHeight * 0.03),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05,right: screenWidth * 0.05),
              child: ShimmerWidget2.rectangular(height: screenHeight * 0.05),
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: ShimmerWidget2.rectangular(
                    height: screenHeight * 0.024,
                    width: screenWidth * 0.15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: ShimmerWidget2.rectangular(
                    height: screenHeight * 0.024,
                    width: screenWidth * 0.2,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    ),
  );
}

class ShimmerWidget2 extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget2.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade200,
    highlightColor: Colors.grey[400]!,
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(shape: shapeBorder, color: Colors.grey),
    ),
  );
}
