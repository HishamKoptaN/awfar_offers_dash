import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/offer_groups_singleton.dart';
import '../../../../core/singletons/offers_singleton.dart';
import '../../domain/use_cases/add_offer_group_use_case.dart';
import '../../domain/use_cases/delete_offer_group_use_case.dart';
import '../../domain/use_cases/edit_offer_group_use_case.dart';
import '../../domain/use_cases/get_offer_groups_use_case.dart';
import 'offer_groups_event.dart';
import 'offer_groups_state.dart';

class OfferGroupsBloc extends Bloc<OfferGroupsEvent, OfferGroupsState> {
  final GetOfferGroupsUseCase getOfferGroupsUseCase;
  final AddOfferGroupUseCase addOfferGroupsUseCase;
  final EditOfferGroupUseCase editUseCase;
  final DeleteOfferGroupUseCase deleteUseCase;
  OfferGroupsBloc(
    this.getOfferGroupsUseCase,
    this.addOfferGroupsUseCase,
    this.editUseCase,
    this.deleteUseCase,
  ) : super(
          const OfferGroupsState.initial(),
        ) {
    on<OfferGroupsEvent>(
      (event, emit) async {
        await event.when(
          get: (storeId) async {
            emit(
              const OfferGroupsState.loading(),
            );
            final result = await getOfferGroupsUseCase.get(
              storeId: storeId,
            );
            await result.when(
              success: (offersGroups) async {
                OfferGroupsSingleton.instance.offersGroups = offersGroups!;
                emit(
                  const OfferGroupsState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  OfferGroupsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (addOfferGroupReqBodyModel) async {
            emit(
              const OfferGroupsState.loading(),
            );
            final result = await addOfferGroupsUseCase.addOfferGroup(
              addOfferGroupReqBodyModel: addOfferGroupReqBodyModel,
            );
            await result.when(
              success: (
                offerGroup,
              ) async {
                OfferGroupsSingleton.instance.offersGroups.add(
                  offerGroup,
                );
                emit(
                  const OfferGroupsState.success(),
                );
              },
              failure: (error) async {
                emit(
                  OfferGroupsState.failure(
                    apiErrorModel: error,
                  ),
                );
              },
            );
          },
          edit: (offerGroup) async {
            emit(
              const OfferGroupsState.loading(),
            );
            final result = await editUseCase.edit(
              offerGroup: offerGroup,
            );
            await result.when(
              success: (
                offerGroup,
              ) async {
                emit(
                  const OfferGroupsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  OfferGroupsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          delete: (
            id,
          ) async {
            emit(
              const OfferGroupsState.loading(),
            );
            final result = await deleteUseCase.delete(
              id: id,
            );
            await result.when(
              success: (_) async {
                OffersSingleton.instance.offers.removeWhere(
                  (offer) => offer.id == id,
                );
                emit(
                  const OfferGroupsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  OfferGroupsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
