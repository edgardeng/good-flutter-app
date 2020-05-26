import 'package:flutter/material.dart';
import 'package:good_flutter_app/util/utility.dart';

class ActorDetailSummary extends StatelessWidget {
  final String summary;
  final bool isUnfold;
  final VoidCallback onPressed;

  const ActorDetailSummary(this.summary, this.isUnfold, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('简介',
              style: TextStyle(
                  fontSize: fixedFontSize(16),
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
          ),
          SizedBox(height: 15,),
          Text(
            summary,
            style:
                TextStyle(fontSize: fixedFontSize(14), color: Colors.white, ),
            maxLines: isUnfold ? null : 4,
            overflow: TextOverflow.clip,
            
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(isUnfold ? '收起' : '显示全部', style:TextStyle(fontSize:fixedFontSize(14), color: Colors.white),),
                Icon(isUnfold ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}