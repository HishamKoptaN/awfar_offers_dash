import 'package:awfar_offers_dash/features/sub_categories_items/data/models/marka.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login/present/view/login_view.dart';
import '../../features/categories/data/models/category.dart';
import '../../features/categories/presentation/view/add_category_view.dart';
import '../../features/categories/presentation/view/categories_view.dart';
import '../../features/categories/presentation/view/category_details_view.dart';
import '../../features/categories/presentation/view/edit_category_view.dart';
import '../../features/categories/presentation/view/subCategory_details_view.dart';
import '../../features/controll_panel/control_panel_view.dart';
import '../../features/countries/data/models/countries_res_model.dart';
import '../../features/countries/presentation/view/add_country_view.dart';
import '../../features/countries/presentation/view/countries_view.dart';
import '../../features/countries/presentation/view/edit_country_view.dart';
import '../../features/coupons/data/models/coupon.dart';
import '../../features/coupons/presentation/view/add_coupon_view.dart';
import '../../features/coupons/presentation/view/coupons_view.dart';
import '../../features/coupons/presentation/view/edit_coupon_view.dart';
import '../../features/governorates/data/models/governorates_response_model.dart';
import '../../features/governorates/presentation/pages/add_governorate_view.dart';
import '../../features/governorates/presentation/pages/edit_governorate_view.dart';
import '../../features/governorates/presentation/pages/governorates_view.dart';
import '../../../../core/models/offer.dart';
import '../../features/main/present/view/main_view.dart';
import '../../features/offer_groups/data/models/offer_group.dart';
import '../../features/offer_groups/presentation/view/add_offer_group_view.dart';
import '../../features/offer_groups/presentation/view/edit_offer_group_view.dart';
import '../../features/offer_groups/presentation/view/offer_groups_view.dart';
import '../../features/offers/presentation/screens/add_offer_view.dart';
import '../../features/offers/presentation/screens/edit_offer_view.dart';
import '../../features/offers/presentation/screens/offers_view.dart';
import '../../features/products/presentation/view/add_product_view.dart';
import '../../features/stores/data/models/store.dart';
import '../../features/stores/present/view/add_store_view.dart';
import '../../features/stores/present/view/edit_store_view.dart';
import '../../features/stores/present/view/stores_view.dart';
import '../../features/stores/present/view/widgets/offer_products_view.dart';
import '../../features/stores/present/view/widgets/store_details_view.dart';
import '../../features/sub_categories/data/models/sub_categories_response_model.dart';
import '../../features/categories/presentation/view/add_sub_category_view.dart';
import '../../features/categories/presentation/view/edit_sub_category_view.dart';
import '../../features/sub_categories_items/presentation/view/add_marka_view.dart';
import '../../features/sub_categories_items/presentation/view/edit_marka_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MainView();
      },
    ),
    GoRoute(
      path: '/LoginView',
      builder: (context, state) {
        return LoginView();
      },
    ),
    GoRoute(
      path: '/ControlPanelView',
      builder: (context, state) {
        return const ControlPanelView();
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
      path: '/StoreDetailsView',
      builder: (context, state) {
        final store = state.extra as Store;
        return StoreDetailsView(
          store: store,
        );
      },
    ),
    GoRoute(
      path: '/AddStoreView',
      builder: (context, state) {
        return const AddStoreView();
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
    GoRoute(
      path: '/OfferProductsView',
      builder: (context, state) {
        final offerId = state.extra as int;
        return OfferProductsView(
          offerId: offerId,
        );
      },
    ),

    //! AddOfferGroupView
    GoRoute(
      path: '/OfferGroupsView',
      builder: (context, state) {
        return const OfferGroupsView();
      },
    ),
    GoRoute(
      path: '/AddOfferGroupView',
      builder: (context, state) {
        final storeId = state.extra as int;
        return AddOfferGroupView(
          storeId: storeId,
        );
      },
    ),
    GoRoute(
      path: '/EditOfferGroupView',
      builder: (context, state) {
        final offerGroup = state.extra as OfferGroup;
        return EditOfferGroupView(
          offerGroup: offerGroup,
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
        final offerGroupId = state.extra as int;
        return AddOfferView(
          offerGroupId: offerGroupId,
        );
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
    //! AddPrdouctView
    GoRoute(
      path: '/AddPrdouctView',
      builder: (context, state) {
        final offerId = state.extra as int;
        return AddPrdouctView(
          offerId: offerId,
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
    //! Categories Details
    GoRoute(
      path: '/CategoryDetailsView',
      builder: (context, state) {
        final category = state.extra as Category;
        return CategoryDetailsView(
          category: category,
        );
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
    //! Sub Categories Details
    GoRoute(
      path: '/SubCategoryDetailsView',
      builder: (context, state) {
        final subCategory = state.extra as SubCategory;
        return SubCategoryDetailsView(
          subCategory: subCategory,
        );
      },
    ),

    GoRoute(
      path: '/SubCategoriesView',
      builder: (context, state) {
        final subCategory = state.extra as SubCategory;
        return SubCategoryDetailsView(
          subCategory: subCategory,
        );
      },
    ),
    GoRoute(
      path: '/AddSubCategoryView',
      builder: (context, state) {
        final categoryId = state.extra as int;
        return AddSubCategoryView(
          categoryId: categoryId,
        );
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

    //! Markas
    GoRoute(
      path: '/AddMarkaView',
      builder: (context, state) {
        final subCategoryId = state.extra as int;
        return AddMarkaView(
          subCategoryId: subCategoryId,
        );
      },
    ),
    GoRoute(
      path: '/EditMarkaView',
      builder: (context, state) {
        final marka = state.extra as Marka;
        return EditMarkaView(
          marka: marka,
        );
      },
    ),

    //! Coupons
    GoRoute(
      path: '/CouponsView',
      builder: (context, state) {
        return const CouponsView();
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
