import 'package:flutter/material.dart';

SnackBar textSnackBar(String content) => SnackBar(
      content: SizedBox(
        height: 125.0,
        child: Center(
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: const Color(0xFFC200FB),
    );
