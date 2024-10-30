import 'package:go_router/go_router.dart';
import '../../features/categories/presentation/view/add_category_view.dart';
import '../../features/categories/presentation/view/categories_view.dart';
import '../../features/controll_panel/control_panel_view.dart';
import '../../features/countries/presentation/view/add_country_view.dart';
import '../../features/countries/presentation/view/countries_view.dart';
import '../../features/governorates/presentation/pages/add_governorates_view.dart';
import '../../features/governorates/presentation/pages/governorates_view.dart';
import '../../features/offres/presentation/screens/add_offer_view.dart';
import '../../features/offres/presentation/screens/offers_view.dart';
import '../../features/stores/presentation/screens/add_store_view.dart';
import '../../features/stores/presentation/screens/stores_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const ControlPanel();
      },
    ),
    GoRoute(
      path: '/CountriesView',
      builder: (context, state) {
        return const CountriesView();
      },
    ),
    GoRoute(
      path: '/AddCountryView',
      builder: (context, state) {
        return const AddCountryView();
      },
    ),

    GoRoute(
      path: '/GovernoratesView',
      builder: (context, state) {
        return const GovernoratesView();
      },
    ),
    GoRoute(
      path: '/AddGovernorateView',
      builder: (context, state) {
        return const AddGovernorateView();
      },
    ),
    GoRoute(
      path: '/StoresView',
      builder: (context, state) {
        return const StoresView();
      },
    ),
    GoRoute(
      path: '/AddStoreView',
      builder: (context, state) {
        return const AddStoreView();
      },
    ),
    GoRoute(
      path: '/CategoriesView',
      builder: (context, state) {
        return const CategoriesView();
      },
    ),
    GoRoute(
      path: '/AddCategoryView',
      builder: (context, state) {
        return const AddCategoryView();
      },
    ),
    GoRoute(
      path: '/OffersView',
      builder: (context, state) {
        return const OffersView();
      },
    ),
    GoRoute(
      path: '/AddOfferView',
      builder: (context, state) {
        return const AddOfferView();
      },
    ),

    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) {
    //     return const HomeView();
    //   },
    // ),
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) {
    //     return const LoginView();
    //   },
    // ),
    // GoRoute(
    //   path: '/sign_up',
    //   builder: (context, state) {
    //     return const SignUpView();
    //   },
    // ),
  ],
);
