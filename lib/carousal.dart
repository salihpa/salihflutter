import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:salihflutter/fi%20card.dart';

void main() {
  runApp(MaterialApp(
    home: carosel(),
  ));
}

class carosel extends StatelessWidget {
  carosel({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("carousel")),
      body: CarouselSlider(
          items: [
            GestureDetector(
              onLongPress: () {},
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1127245421/photo/woman-hands-praying-for-blessing-from-god-on-sunset-background.jpg?s=1024x1024&w=is&k=20&c=faoiFapQkhucuLuor9gBnblJ4KJpqvEgariqalvzRas=")),
              )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ficard()));
              },
            ),
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1198320908/photo/peaceful-meditation.jpg?s=1024x1024&w=is&k=20&c=8OiAworzck5oo6V8rlt0wwLbbV-xiPULkdRNeAKuo1o=")),
            )),
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/641491966/photo/heart-at-sunset.jpg?s=1024x1024&w=is&k=20&c=BefFdpCIacRNwY5ZLPuN7Hmr3-i4kDRM7BkObr2OL5c=")),
            )),
            Container(
                decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage("")),
            )),
          ],
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: .5,
              height: 270,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayCurve: Curves.easeInCirc,
              autoPlayAnimationDuration: Duration(seconds: 2))),
    );
  }
}
