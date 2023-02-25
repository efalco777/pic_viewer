import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:pic_viewer/app/widgets/image_placeholder.dart';

class PicDetailsPage extends StatelessWidget {
  final Pic pic;

  const PicDetailsPage({
    super.key,
    required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pic.author)),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: pic.width / pic.height,
            child: CachedNetworkImage(
              imageUrl: pic.downloadUrl,
              placeholder: (_, __) => const ImagePlaceholder(),
              errorWidget: (_, __, ___) => Container(
                alignment: Alignment.center,
                child: const Icon(Icons.hide_image_outlined),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
