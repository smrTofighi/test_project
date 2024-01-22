import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key, this.loadImage= false}) : super(key: key);  final bool loadImage;

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  OverlayEntry? entry;
  final layerLink = LayerLink();

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          link: layerLink,
          child: Center(child: buildOverlay()),
        ),
      ),
    );
    overlay.insert(entry!);
  }

  Widget buildOverlay() {
    return DelayedWidget(
        delayDuration: const Duration(milliseconds: 300),
        animationDuration: const Duration(milliseconds: 300),
        animation: DelayedAnimations.SLIDE_FROM_TOP,

          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black38, blurRadius: 5),
            ],
            color: Colors.white),
        child: Column(
          children: [
           Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/images/logo.png').image),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, mac…',
                maxLines: 3,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  bool isShowOverlay = false;
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: SizedBox(
        height: 100,
        width: MediaQuery.sizeOf(context).width / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is'),
            MouseRegion(
              onEnter: (event) {
                if (isShowOverlay == false) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => showOverlay());
                }
                isShowOverlay = true;
              },
              onExit: (event) {
                if (isShowOverlay) {
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      entry?.remove();
                      entry = null;
                      isShowOverlay = false;
                    },
                  );
                }
              },
              child: TextButton(
                onPressed: () {},
                child: const Text('Flutter'),
              ),
            ),
            const Text('and i loved it'),
          ],
        ),
      ),
    );
  }
}
