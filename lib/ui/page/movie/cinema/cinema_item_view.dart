import 'package:flutter/material.dart';
import 'package:good_flutter_app/model/cinema.dart';

class CinemaItemView extends StatelessWidget {

  final Cinema cinema;

  CinemaItemView(this.cinema);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String path = "/cinema/" + cinema.id;
//        RouterHelper.push(context, path);
      },
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(cinema.name, style: TextStyle(fontSize: 18))
                ),
              ]),
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Text(cinema.address),
                Text(cinema.distance)
              ]),
              Row(
                  children: _buildTagViews()
              ),
              Divider(
                height: 1,
                indent: 0.0
              ),
            ],
          )),

    );
  }

  List<Widget> _buildTagViews() {
    List<Widget> widgets = [];
    if (cinema.refund) {
      widgets.add(Chip(
        label: Text("可退", style: TextStyle(fontSize: 12)),
        labelPadding: EdgeInsets.only(left: 2),
        backgroundColor: Colors.greenAccent));
    }
    if (cinema.endorse) {
      widgets.add(Chip(
          label: Text("可改", style: TextStyle(fontSize: 12)),
          labelPadding: EdgeInsets.only(left: 2),
          backgroundColor: Colors.greenAccent));
    }
    if (cinema.snack) {
      widgets.add(Chip(
          label: Text("小吃", style: TextStyle(fontSize: 12)),
          labelPadding: EdgeInsets.only(left: 2),
          backgroundColor: Colors.orange));
    }
    if (cinema.vip) {
      widgets.add(Chip(
          label: Text("折扣卡", style: TextStyle(fontSize: 12)),
          labelPadding: EdgeInsets.only(left: 2),
          backgroundColor: Colors.orange));
    }
    return widgets;
  }
}