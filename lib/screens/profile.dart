import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/certificates_viewer.dart';
import 'package:codeitapp/widgets/profile_badges.dart';
import 'package:codeitapp/widgets/header_navigation.dart';
import 'package:codeitapp/widgets/profile_section.dart';
import 'package:codeitapp/widgets/profile_timeline_courses.dart';
import 'package:codeitapp/widgets/profile_user_details.dart';
import 'package:codeitapp/widgets/custom_size_widget.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Size _headerSize;

  @override
  void initState() {
    _headerSize = Size(0, 0);
    super.initState();
  }

  double _calculateMargin() {
    return 0.05 *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _margin = _calculateMargin();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: _headerSize.height,
              ),
              child: SafeArea(
                top: false,
                child: Container(
                  margin: EdgeInsets.all(
                    _margin,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizeConfig.isPortrait
                          ? ProfileSection(
                              title: 'Certificates',
                            )
                          : SizedBox.shrink(),
                      SizeConfig.isPortrait
                          ? CertificatesViewer()
                          : SizedBox.shrink(),
                      ProfileSection(
                        title: 'Your Timeline',
                      ),
                      ProfileTimelineCourses(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              CustomSizeWidget(
                onChange: (Size size) {
                  setState(() {
                    _headerSize = size;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                    boxShadow: [
                      Theme.of(context).brightness == Brightness.light
                          ? BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 12),
                              blurRadius: 32,
                            )
                          : BoxShadow(),
                    ],
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: _margin,
                        left: _margin,
                        right: _margin,
                      ),
                      child: Column(
                        children: [
                          HeaderNavigation(
                            title: 'Profile',
                            settingsButton: true,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: _margin,
                            ),
                            child: ProfileUserDetails(),
                          ),
                          SizeConfig.isPortrait
                              ? ProfileBadges()
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
