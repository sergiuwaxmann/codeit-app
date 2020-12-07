import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CertificatesViewer extends StatefulWidget {
  @override
  _CertificatesViewerState createState() => _CertificatesViewerState();
}

class _CertificatesViewerState extends State<CertificatesViewer> {
  final List<String> _certificatesPaths = [
    'assets/certificates/certificate-01.svg',
    'assets/certificates/certificate-02.svg',
    'assets/certificates/certificate-03.svg',
  ];

  Widget _certificatesViewer;

  @override
  void initState() {
    super.initState();
    List<Widget> _imageChildren = [];

    _certificatesPaths.reversed.toList().asMap().forEach(
      (index, certificate) {
        int angleDegree;

        if (index == _certificatesPaths.length - 1)
          angleDegree = 0;
        else
          angleDegree = Random().nextInt(10) - 5;

        _imageChildren.add(
          Container(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: angleDegree * (pi / 180),
              child: SvgPicture.asset(
                certificate,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );

    _certificatesViewer = Stack(
      children: _imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: _certificatesViewer,
    );
  }
}
