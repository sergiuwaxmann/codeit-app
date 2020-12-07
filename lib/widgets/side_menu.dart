import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final Widget sideMenuContent;

  const SideMenu({
    Key key,
    @required this.sideMenuContent,
  }) : super(key: key);
  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  AnimationController _sideMenuAnimationController;
  Animation<Offset> _sideMenuAnimation;
  Animation<double> _fadeAnimation;

  bool _sideMenuHidden;

  @override
  void initState() {
    _sideMenuHidden = true;
    _sideMenuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _sideMenuAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _sideMenuAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _sideMenuAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  Future<void> showSideMenu() async {
    setState(() {
      _sideMenuHidden = !_sideMenuHidden;
    });
    await _sideMenuAnimationController.forward();
  }

  @override
  void dispose() {
    _sideMenuAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _sideMenuHidden,
      child: Stack(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: GestureDetector(
              onTap: () {
                setState(
                  () {
                    _sideMenuHidden = !_sideMenuHidden;
                  },
                );
                _sideMenuAnimationController.reverse();
              },
              child: Container(
                color: Colors.black.withOpacity(0.25),
              ),
            ),
          ),
          SlideTransition(
            position: _sideMenuAnimation,
            child: SafeArea(
              left: false,
              right: false,
              // top: SizeConfig.isPortrait ? true : false,
              bottom: false,
              child: widget.sideMenuContent,
            ),
          ),
        ],
      ),
    );
  }
}
