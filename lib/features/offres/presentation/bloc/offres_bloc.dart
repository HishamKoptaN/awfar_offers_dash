import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/offers_response_model.dart';
import '../../domain/use_cases/add_offer_use_case.dart';
import '../../domain/use_cases/get_offres_use_case.dart';
import 'offers_event.dart';
import 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final GetOffersUseCase getOffersUseCase;
  final AddOfferUseCase addOffersUseCase;

  OffersBloc(
    this.getOffersUseCase,
    this.addOffersUseCase,
  ) : super(
          const OffersState.initial(),
        ) {
    on<OffersEvent>(
      (event, emit) async {
        await event.when(
          getOffersEvent: () async {
            final result = await getOffersUseCase.getOffers();
            await result.when(
              success: (offers) async {
                var offersResponseModel = OffersResponseModel();

                await offersResponseModel.loadOffers(
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
          addOfferEvent: (formData) async {
            emit(
              const OffersState.loading(),
            );
            final result = await addOffersUseCase.addOffer(
              formData: formData,
            );
            await result.when(
              success: (
                governoratesResponseModel,
              ) async {
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
        );
      },
    );
  }
}
