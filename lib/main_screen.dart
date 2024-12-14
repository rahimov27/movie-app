import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/router/router.gr.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          TicketRoute(),
          MovieRoute(),
          ProfileRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                unselectedItemColor: AppColors.textColor,
                selectedItemColor: AppColors.yellow,
                backgroundColor: AppColors.splashBlackColor,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  final tabsRouter = AutoTabsRouter.of(context);
                  tabsRouter.setActiveIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    activeIcon:
                        SvgPicture.asset("assets/images/svg/active-home.svg"),
                    icon: SvgPicture.asset("assets/images/svg/home.svg"),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    activeIcon:
                        SvgPicture.asset("assets/images/svg/active-ticket.svg"),
                    icon: SvgPicture.asset("assets/images/svg/ticket.svg"),
                    label: "Ticket",
                  ),
                  BottomNavigationBarItem(
                    activeIcon:
                        SvgPicture.asset("assets/images/svg/active-video.svg"),
                    icon: SvgPicture.asset("assets/images/svg/video-nav.svg"),
                    label: "Movie",
                  ),
                  BottomNavigationBarItem(
                    activeIcon:
                        SvgPicture.asset("assets/images/svg/active-user.svg"),
                    icon: SvgPicture.asset("assets/images/svg/user.svg"),
                    label: "User",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
