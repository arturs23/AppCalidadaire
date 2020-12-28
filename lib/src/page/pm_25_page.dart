import 'package:mapbox_mapas/src/page/pagina_videos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MaterialPm25 extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Video MP 2.5 y MP 10'),
    ),
    body: ListView(
      children: <Widget>[
        ChewieListItem(
        videoPlayerController: VideoPlayerController.asset(
        'videos/contaminantes.mp4'
        ),
        looping: true, 
        ),
        ChewieListItem( 
          videoPlayerController : VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'
        ),
        ),
      ],
    ),
  ) ;
}
}
