import 'package:flutter/material.dart';
import 'dart:ui';

double ScreenWidth() => window.physicalSize.width / window.devicePixelRatio;

double ScreenHeight() => window.physicalSize.height / window.devicePixelRatio;

double WidgetWidth(context) => MediaQuery.of(context).size.width;

double WidgetHeight(context) => MediaQuery.of(context).size.height;


