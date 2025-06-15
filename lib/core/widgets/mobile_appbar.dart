import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/text_button.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarDrawer extends StatefulWidget {
  @override
  State<CustomAppBarDrawer> createState() => _CustomAppBarDrawerState();
}

class _CustomAppBarDrawerState extends State<CustomAppBarDrawer>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _drawerOverlay;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleDrawer() {
    if (_drawerOverlay == null) {
      _showDrawer();
    } else {
      _closeDrawer();
    }
  }

  void _showDrawer() {
    _drawerOverlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withOpacity(0.3),
        child: Stack(
          children: [
            GestureDetector(
              onTap: _closeDrawer,
              child: Container(color: Colors.transparent),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: BlocBuilder<ScreenCubit, ScreenState>(
                    builder: (context, state) {
                      int index = (state is ScreenUpdated)
                          ? state.screenIndex
                          : 0;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextButton(
                            label: "Home",
                            onTap: () => _onItemTap(0),
                            isActive: index == 0,
                          ),
                          CustomTextButton(
                            label: "Projects",
                            onTap: () => _onItemTap(1),
                            isActive: index == 1,
                          ),
                          CustomTextButton(
                            label: "About",
                            onTap: () => _onItemTap(2),
                            isActive: index == 2,
                          ),
                          CustomTextButton(
                            label: "Contact",
                            onTap: () {
                              _onItemTap(3);
                            },
                            isActive: index == 3,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_drawerOverlay!);
    _controller.forward();
    setState(() {}); // To update the icon
  }

  void _closeDrawer() async {
    await _controller.reverse();
    _drawerOverlay?.remove();
    _drawerOverlay = null;
    setState(() {}); // To update the icon
  }

  void _onItemTap(int index) {
    context.read<ScreenCubit>().updateScreen(index);
    _closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleName(),
            IconButton(
              icon: Icon(_drawerOverlay == null ? Icons.menu : Icons.close),
              onPressed: _toggleDrawer,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
