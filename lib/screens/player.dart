import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/close_square_button.dart';
import 'package:codeitapp/widgets/custom_safe_area.dart';

class PlayerScreen extends StatefulWidget {
  static const routeName = '/player';

  final VideoPlayerController videoPlayerController;

  const PlayerScreen({
    Key key,
    this.videoPlayerController,
  }) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomSafeArea(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    Theme.of(context).brightness == Brightness.light
                        ? BoxShadow(
                            offset: Offset(0, 12),
                            blurRadius: 16,
                            color: Colors.black.withOpacity(0.2),
                          )
                        : BoxShadow(),
                  ],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
            ),
          ),
          CustomSafeArea(
            alignment: Alignment.topRight,
            child: CloseSquareButton(),
          ),
        ],
      ),
    );
  }
}
