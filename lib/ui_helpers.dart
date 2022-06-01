import "package:flutter/material.dart";

bool isVertical(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}
