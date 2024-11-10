import 'package:go_router/go_router.dart';
import '../../features/categories/data/models/categories_response_model.dart';
import '../../features/categories/presentation/view/add_category_view.dart';
import '../../features/categories/presentation/view/categories_view.dart';
import '../../features/categories/presentation/view/edit_category_view.dart';
import '../../features/controll_panel/control_panel_view.dart';
import '../../features/countries/data/models/countries_response_model.dart';
import '../../features/countries/presentation/view/add_country_view.dart';
import '../../features/countries/presentation/view/countries_view.dart';
import '../../features/countries/presentation/view/edit_country_view.dart';
import '../../features/coupons/data/models/coupons_response_model.dart';
import '../../features/coupons/presentation/view/add_coupon_view.dart';
import '../../features/coupons/presentation/view/edit_coupon_view.dart';
import '../../features/governorates/data/models/governorates_response_model.dart';
import '../../features/governorates/presentation/pages/add_governorate_view.dart';
import '../../features/governorates/presentation/pages/edit_governorate_view.dart';
import '../../features/governorates/presentation/pages/governorates_view.dart';
import '../../features/offres/data/models/offers_response_model.dart';
import '../../features/offres/presentation/screens/add_offer_view.dart';
import '../../features/offres/presentation/screens/edit_offer_view.dart';
import '../../features/offres/presentation/screens/offers_view.dart';
import '../../features/stores/data/models/stores_response_model.dart';
import '../../features/stores/presentation/screens/add_store_view.dart';
import '../../features/stores/presentation/screens/edit_store_view.dart';
import '../../features/stores/presentation/screens/stores_view.dart';
import '../../features/sub_categories/data/models/sub_categories_response_model.dart';
import '../../features/sub_categories/presentation/view/add_sub_category_view.dart';
import '../../features/sub_categories/presentation/view/edit_sub_category_view.dart';
import '../../features/sub_categories/presentation/view/sub_categories_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const ControlPanel();
      },
    ),
    //! /Countries
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
      path: '/EditCountryView',
      builder: (context, state) {
        final country = state.extra as Country;
        return EditCountryView(
          country: country,
        );
      },
    ),
    //! Governorates
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
      path: '/EditGovernorateView',
      builder: (context, state) {
        final governorate = state.extra as Governorate;
        return EditGovernorateView(
          governorate: governorate,
        );
      },
    ),
    //! Stores
    GoRoute(
      path: '/StoresView',
      builder: (context, state) {
        return const StoresView();
      },
    ),
    GoRoute(
      path: '/AddStoreView',
      builder: (context, state) {
        return AddStoreView();
      },
    ),
    GoRoute(
      path: '/EditStoreView',
      builder: (context, state) {
        final store = state.extra as Store;
        return EditStoreView(
          store: store,
        );
      },
    ),

    //! Categories
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
      path: '/EditCategoryView',
      builder: (context, state) {
        final category = state.extra as Category;
        return EditCategoryView(
          category: category,
        );
      },
    ),
    //! SubCategories
    GoRoute(
      path: '/SubCategoriesView',
      builder: (context, state) {
        return const SubCategoriesView();
      },
    ),
    GoRoute(
      path: '/AddSubCategoryView',
      builder: (context, state) {
        return const AddSubCategoryView();
      },
    ),
    GoRoute(
      path: '/EditSubCategoryView',
      builder: (context, state) {
        final subCategory = state.extra as SubCategory;
        return EditSubCategoryView(
          subCategory: subCategory,
        );
      },
    ),
    //! Offers
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
    GoRoute(
      path: '/EditOfferView',
      builder: (context, state) {
        final offer = state.extra as Offer;
        return EditOfferView(
          offer: offer,
        );
      },
    ),

    //! Coupons
    GoRoute(
      path: '/CouponsView',
      builder: (context, state) {
        return const AddOfferView();
      },
    ),
    GoRoute(
      path: '/AddCouponView',
      builder: (context, state) {
        return const AddCouponView();
      },
    ),
    GoRoute(
      path: '/EditCouponView',
      builder: (context, state) {
        final coupon = state.extra as Coupon;
        return EditCouponView(
          coupon: coupon,
        );
      },
    ),
  ],
);
