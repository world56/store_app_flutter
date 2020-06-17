import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDiy extends StatelessWidget {
  final List<dynamic> swiperList;

  SwiperDiy({
    Key key,
    this.swiperList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        itemCount: this.swiperList.length,
        itemBuilder: (BuildContext context, int i) {
          return Image.network(
            '${this.swiperList[i]['path']}',
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(
          margin: const EdgeInsets.all(5.0),
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          ),
        ),
        autoplay: true,
      ),
    );
  }
}
