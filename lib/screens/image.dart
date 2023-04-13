import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/services.dart';
import 'package:silvertime/include.dart';

class ImageScreen extends StatefulWidget {
  final Uint8List? imageBytes;
  final String? url;
  final String filename;
  final String hero;
  const ImageScreen({super.key, this.url, this.imageBytes, required this.hero, required this.filename}) 
  : assert (url != null || imageBytes != null);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      appBar: AppBar (
        title: AutoScrollText (
          widget.filename,
          style: Theme.of(context).textTheme.bodyLarge,
          curve: Curves.ease,
          velocity: const Velocity(pixelsPerSecond: Offset (30,0)),
        ),
      ),
      body: InteractiveViewer(
        minScale: 1.0,
        maxScale: 5.0,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Hero(
            tag: widget.hero,
            child: widget.imageBytes != null
            ? Image.memory(
              widget.imageBytes!,
              fit: BoxFit.contain,
            )
            : Image.network (
              widget.url!,
              fit: BoxFit.contain,
            )
          ),
        ),
      ),
    );
  }
}