import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: ClipWidget(),
  ));
}

class ClipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ClipRect(
                child: Container(
              child: Align(
                  widthFactor: .4,
                  heightFactor: .6,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://media.istockphoto.com/id/1454563185/photo/gantantra-diwas-happy-republic-day-and-republic-day-background-abstraction.jpg?s=612x612&w=0&k=20&c=fRvWvC3Z4H0JG3EyxHOhcjGwceh6a1s9g73EorJVim4=")),
            )),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Container(
                  // width: 200,
                  // height: 200,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://media.istockphoto.com/id/1251679966/photo/empty-floor-and-green-forest-in-natural-park.webp?b=1&s=170667a&w=0&k=20&c=CbZh-DSFcsebimv6mne-FafzCPQIlraoAI5kzZX8f6w=")),
            ),
            SizedBox(
              height: 20,
            ),
            ClipOval(
              child: Image.network(
                  "https://media.istockphoto.com/id/1137402783/photo/dandelion-in-field-at-sunset-air-and-blowing.jpg?s=1024x1024&w=is&k=20&c=jvunad4unjMU9tNinVNole7bpwTcb532v68eey713So="),
            ),
            SizedBox(
              height: 20,
            ),
            ClipPath(
              clipper: StarClipper(5),
              child: Image.network(
                  "https://media.istockphoto.com/id/1539829917/photo/dandelion-seeds-on-an-abstract-bright-background.jpg?s=612x612&w=0&k=20&c=92tDKh_KkkUBvBo-JtU15rlg_rVi2D2wzDumO3vIxPc="),
            )
          ],
        ),
      ),
    );
  }
}
