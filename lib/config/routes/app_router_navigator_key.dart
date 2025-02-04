import 'package:flutter/material.dart';
class AppRouterNavigatorKey
{



 static final rootNavigatorKey = GlobalKey<NavigatorState>();
 static final shellNavigatorExploreKey = GlobalKey<NavigatorState>(debugLabel: 'explore');
 static final shellNavigatorVehicleKey = GlobalKey<NavigatorState>(debugLabel: 'Vehicle');
 static final shellNavigatorActivityKey = GlobalKey<NavigatorState>(debugLabel: 'Activity');
 static final shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

}