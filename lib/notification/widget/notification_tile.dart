import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // SizedBox(
          //   height: 30,
          //   width: 30,
          //   child: CachedNetworkImage(
          //     imageUrl: notification.forecast.weather[0].imageUrl,
          //     placeholder: (context, url) => Center(
          //       child: SizedBox(
          //         height: 24,
          //         width: 24,
          //         child: CircularProgressIndicator(),
          //       ),
          //     ),
          //     errorWidget: (context, url, error) => Icon(Icons.error),
          //   ),
          // ),
          SizedBox(
            width: 9,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '12.00',
                  style: TextStyle(fontSize: 10, color: Color(0xff737272)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Looks like sss in your location',
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
