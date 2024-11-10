import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/offers_response_model.dart';
import '../../domain/use_cases/add_offer_use_case.dart';
import '../../domain/use_cases/delete_offer_use_case.dart';
import '../../domain/use_cases/edit_offer_image_use_case.dart';
import '../../domain/use_cases/edit_offer_use_case.dart';
import '../../domain/use_cases/get_offres_use_case.dart';
import 'offers_event.dart';
import 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final GetOffersUseCase getOffersUseCase;
  final AddOfferUseCase addOffersUseCase;
  final EditOfferUseCase editUseCase;
  final EditOfferImageUseCase editImageUseCase;
  final DeleteOfferUseCase deleteUseCase;
  OffersBloc(
    this.getOffersUseCase,
    this.addOffersUseCase,
    this.editUseCase,
    this.editImageUseCase,
    this.deleteUseCase,
  ) : super(
          const OffersState.initial(),
        ) {
    on<OffersEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const OffersState.loading(),
            );
            final result = await getOffersUseCase.getOffers();
            await result.when(
              success: (offers) async {
                await OffersResponseModel().load(
                  offers: offers,
                );
                emit(
                  OffersState.offersLoaded(
                    offers: offers,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  OffersState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (formData) async {
            emit(
              const OffersState.loading(),
            );
            final result = await addOffersUseCase.addOffer(
              formData: formData,
            );
            await result.when(
              success: (
                offer,
              ) async {
                await OffersResponseModel().add(
                  offer: offer,
                );
                emit(
                  const OffersState.success(),
                );
              },
              failure: (error) async {
                emit(
                  OffersState.failure(
                    apiErrorModel: error,
                  ),
                );
              },
            );
          },
          edit: (offer) async {
            emit(
              const OffersState.loading(),
            );
            final result = await editUseCase.edit(
              offer: offer,
            );
            await result.when(
              success: (
                offer,
              ) async {
                emit(
                  const OffersState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  OffersState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          editImage: (
            id,
            formData,
          ) async {
            emit(
              const OffersState.loading(),
            );
            final result = await editImageUseCase.edit(
              id: id,
              formData: formData,
            );
            await result.when(
              success: (
                offer,
              ) async {
                emit(
                  const OffersState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  OffersState.failure(
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
              const OffersState.loading(),
            );
            final result = await deleteUseCase.delete(
              id: id,
            );
            await result.when(
              success: (_) async {
                OffersResponseModel().offers!.removeWhere(
                      (offer) => offer.id == id,
                    );
                emit(
                  const OffersState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  OffersState.failure(
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
