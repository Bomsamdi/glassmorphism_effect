library glassmorphism_effect;

//  Created by Bomsamdi on 2022
//  Copyright © 2022 Bomsamdi. All rights reserved.
import 'dart:ui';

import 'package:flutter/material.dart';

/// Widget with Glassmorphism Effect that combines [CustomPainter] class,[BackdropFilter], [Expanded], and [Flex].
/// ```dart
/// GMEFlexContainer(
///   flex:2
///   borderRadius: 20,
///   blur: 3,
///   alignment: Alignment.bottomCenter,
///   border: 2,
///   linearGradient: LinearGradient(
///     begin: Alignment.topLeft,
///     end: Alignment.bottomRight,
///     colors: [
///         Color(0xFFffffff).withOpacity(0.5),
///         Colors.red.withOpacity(0.2),
///       ],
///     stops: [
///       0.1,
///       1,
///     ]),
///   borderGradient: LinearGradient(
///     begin: Alignment.topLeft,
///     end: Alignment.bottomRight,
///     colors: [
///         Color(0xFFffffff).withOpacity(0.5),
///         Colors.red.withOpacity(0.5),
///       ],
///     ),
///   child: SizedBox()
/// ),
/// ```
class GMEFlexContainer extends StatelessWidget {
  /// Align the [child] within the container.
  ///
  /// If non-null, the container will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Ignored if [child] is null.
  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final int? flex;

  final EdgeInsetsGeometry? margin;

  /// The transformation matrix to apply before painting the container.
  /// it is similar to all the containers
  final Matrix4? transform;

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child
  final Widget? child;

  final double borderRadius;
  final BoxShape shape;
  final BoxConstraints? constraints;
  final double border;
  final double blur;
  final LinearGradient linearGradient;
  final LinearGradient? borderGradient;
  GMEFlexContainer({
    super.key,
    this.child,
    this.alignment,
    this.padding,
    this.shape = BoxShape.rectangle,
    this.margin,
    this.transform,
    required this.linearGradient,
    this.borderGradient,
    this.borderRadius = 20,
    this.border = 2,
    this.blur = 2,
    this.constraints,
    this.flex = 1,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(
          flex! >= 1,
          'Flex value can be less than 1 : $flex. Please Provide a flex value > 1',
        ),
        assert(constraints == null || constraints.debugAssertIsValid());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: Container(
        key: key,
        alignment: alignment,
        padding: padding,
        constraints: const BoxConstraints.tightForFinite(),
        transform: transform,
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
                child: Container(
                  alignment: alignment ?? Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: linearGradient,
                  ),
                ),
              ),
            ),
            if (borderGradient != null)
              GMEBorder(
                strokeWidth: border,
                radius: borderRadius,
                gradient: borderGradient!,
              ),
            if (child != null)
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(borderRadius),
                child: Container(
                  child: child,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Creates a widget with Glassmorphism Effect that combines [CustomPainter] class, [ClipRect],[BackdropFilter]
/// ```dart
/// GMEContainer(
/// width: 250,
/// height: 250,
///  borderRadius: 20,
///  blur: 3,
///  alignment: Alignment.bottomCenter,
///  border: 2,
///  linearGradient: LinearGradient(
///  begin: Alignment.topLeft,
///      end: Alignment.bottomRight,
///      colors: [
///        Color(0xFFffffff).withOpacity(0.5),
///        Colors.red.withOpacity(0.2),
///      ],
///      stops: [
///        0.1,
///        1,
///      ]),
///  borderGradient: LinearGradient(
///    begin: Alignment.topLeft,
///    end: Alignment.bottomRight,
///    colors: [
///      Color(0xFFffffff).withOpacity(0.5),
///      Colors.red.withOpacity(0.5),
///    ],
///  ),
/// ),
/// ```
class GMEContainer extends StatelessWidget {
  /// Align the [child] within the container.
  /// Ignored if [child] is null.
  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final double width;
  final double height;

  /// Empty space to surround the [child].
  final EdgeInsetsGeometry? margin;

  /// The transformation matrix to apply before painting the container.
  /// it is similar to all the containers
  final Matrix4? transform;

  /// The [child] contained by the container.
  final Widget? child;

  final double borderRadius;
  final BoxShape shape;
  final BoxConstraints? constraints;

  final double border;
  final double blur;
  final LinearGradient linearGradient;
  final LinearGradient? borderGradient;
  GMEContainer({
    super.key,
    this.child,
    this.alignment,
    this.padding,
    this.shape = BoxShape.rectangle,
    BoxConstraints? constraints,
    this.margin,
    this.transform,
    required this.width,
    required this.height,
    required this.linearGradient,
    this.borderGradient,
    this.borderRadius = 20,
    this.border = 2,
    this.blur = 2,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(constraints == null || constraints.debugAssertIsValid()),
        constraints = constraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: width,
      margin: margin,
      alignment: alignment,
      constraints: constraints,
      height: height,
      transform: transform,
      child: Stack(
        alignment: alignment ?? Alignment.topLeft,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
              child: Container(
                alignment: alignment ?? Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: linearGradient,
                ),
              ),
            ),
          ),
          if (borderGradient != null)
            GMEBorder(
              strokeWidth: border,
              radius: borderRadius,
              width: width,
              height: height,
              gradient: borderGradient!,
            ),
          if (child != null)
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                alignment: alignment,
                child: child,
              ),
            ),
        ],
      ),
    );
  }
}

class GMEListTile extends ListTile {
  /// Padding of GMEListTile; Use [EdgeInsets] to set padding; Default [EdgeInsets] value 0
  final EdgeInsets padding;
  /// Margin of GMEListTile; Use [EdgeInsets] to set margin; Default [EdgeInsets] value 0
  final EdgeInsets margin;
  const GMEListTile({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.isThreeLine,
    super.dense,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  });

  double get _defaultTileHeight {
    final bool hasSubtitle = subtitle != null;
    final bool isTwoLine = !isThreeLine && hasSubtitle;
    final bool isOneLine = !isThreeLine && !hasSubtitle;

    final Offset? baseDensity = visualDensity?.baseSizeAdjustment;
    if (isOneLine) {
      return (dense ?? false ? 48.0 : 56.0) +
          (baseDensity != null ? baseDensity.dy : 0);
    }
    if (isTwoLine) {
      return (dense ?? false ? 64.0 : 72.0) +
          (baseDensity != null ? baseDensity.dy : 0);
    }
    return (dense ?? false ? 76.0 : 88.0) +
        (baseDensity != null ? baseDensity.dy : 0);
  }

  @override
  Widget build(BuildContext context) {
    return GMEContainer(
      width: double.infinity,
      height: _defaultTileHeight,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade300.withOpacity(0.2),
          Colors.blue.withOpacity(0.1),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.green.shade300.withOpacity(0.4),
          Colors.purple.withOpacity(0.3),
        ],
      ),
      padding: padding,
      margin: margin,
      child: super.build(context),
    );
  }
}

class GMEBorder extends StatelessWidget {
  final _GradientPainter _painter;
  final double _radius;
  final double width;
  final double height;
  GMEBorder({
    super.key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    this.height = double.infinity,
    this.width = double.infinity,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      size: MediaQuery.of(context).size,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
        ),
        width: width,
        height: height,
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;
  final Paint paintObject = Paint();

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    RRect innerRect2 = RRect.fromRectAndRadius(
        Rect.fromLTRB(strokeWidth, strokeWidth, size.width - (strokeWidth),
            size.height - (strokeWidth)),
        Radius.circular(radius - strokeWidth));

    RRect outerRect = RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, size.width, size.height), Radius.circular(radius));
    paintObject.shader = gradient.createShader(Offset.zero & size);

    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath2 = Path()..addRRect(innerRect2);
    canvas.drawPath(
        Path.combine(PathOperation.difference, outerRectPath, innerRectPath2),
        paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
