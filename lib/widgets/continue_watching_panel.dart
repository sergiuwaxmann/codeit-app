import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/certificates_viewer.dart';
import 'package:codeitapp/widgets/continue_watching_courses.dart';

class ContinueWatchingPanel extends StatefulWidget {
  @override
  _ContinueWatchingPanelState createState() => _ContinueWatchingPanelState();
}

class _ContinueWatchingPanelState extends State<ContinueWatchingPanel> {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      backdropColor: Colors.black.withOpacity(0.25),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          30,
        ),
      ),
      color: Theme.of(context).highlightColor,
      boxShadow: [
        Theme.of(context).brightness == Brightness.light
            ? BoxShadow(
                offset: Offset(0, -12),
                blurRadius: 32,
                color: Colors.black.withOpacity(0.2),
              )
            : BoxShadow(),
      ],
      minHeight: 0.1 * SizeConfig.screenHeight,
      maxHeight: (!SizeConfig.isTablet
              ? (SizeConfig.isPortrait ? 0.7 : 0.6)
              : SizeConfig.isPortrait
                  ? 0.4
                  : 0.5) *
          SizeConfig.screenHeight,
      onPanelSlide: (position) => setState(
        () {
          _isOpened = position > 0.1 ? true : false;
        },
      ),
      panel: SafeArea(
        top: false,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 0.05 *
                (SizeConfig.isPortrait
                    ? SizeConfig.screenWidth
                    : SizeConfig.screenHeight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: !_isOpened ? 0.1 * SizeConfig.screenHeight : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 42,
                        height: 4,
                        margin: EdgeInsets.symmetric(
                          vertical: (SizeConfig.isPortrait ? 0.015 : 0.01) *
                              SizeConfig.screenHeight,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Text(
                      'Continue Watching',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 2.5 * SizeConfig.textMultiplier),
                    ),
                  ],
                ),
              ),
              !SizeConfig.isPortrait ? Spacer() : SizedBox.shrink(),
              ContinueWatchingCourses(),
              !SizeConfig.isTablet && SizeConfig.isPortrait
                  ? Container(
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                      child: Text(
                        'Certificates',
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 2.5 * SizeConfig.textMultiplier),
                      ),
                    )
                  : SizedBox.shrink(),
              !SizeConfig.isTablet && SizeConfig.isPortrait
                  ? Expanded(
                      child: CertificatesViewer(),
                    )
                  : SizedBox.shrink(),
              SizeConfig.isTablet || !SizeConfig.isPortrait
                  ? Spacer()
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
