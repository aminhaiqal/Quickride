import 'package:flutter/material.dart';
import 'package:quickride/src/utils/firebase_repository.dart' as firebase;
import 'package:quickride/src/utils/shared.dart' as shared;
import 'package:quickride/src/widgets/image_retriever.dart';

class AuthMethodButton extends StatelessWidget {
  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  const AuthMethodButton({
    required this.label,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: MediaQuery.of(context).size.width / 2 - 32,
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF5E6368),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageWidget(
                  imageUrlFuture:
                      firebase.AssetsFolder().getDownloadURL(imageUrl),
                  width: 24,
                  aspectRatio: 1/1,
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: shared.TextTheme.description(FontWeight.w500),
                )
              ],
            ))));
  }
}
