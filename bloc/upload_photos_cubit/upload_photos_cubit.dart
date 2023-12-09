import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:mightyfood_admin/3_data_layer/services/storage/general_firebase_storage_crud.dart';
part 'upload_photos_state.dart';

class UploadPhotosCubit extends Cubit<UploadPhotosState> {
  UploadPhotosCubit() : super(UploadPhotosInitial());
  final GeneralFirebaseStorageCrud _generalFirebaseStorageCrud =
      GeneralFirebaseStorageCrud();
  Future<void> uploadPhotos(
      {required StorageEntity storageEntity,
      required String restaurantUid,
      required Map<String, String> photosnamesWithCorrespondingPaths}) async {
    emit(UploadPhotosLoading());
    try {
      Map<String, String> photoNamesWithCorrespondingdownloadLinks = {};

      if (kIsWeb) {
        for (var element in photosnamesWithCorrespondingPaths.entries) {
          photoNamesWithCorrespondingdownloadLinks[element.key] =
              await _generalFirebaseStorageCrud.uploadPhotoWeb(
                  storageEntity: storageEntity,
                  localImagePath: element.value,
                  restaurantUid: restaurantUid,
                  nameOfFile: "${element.key}.jpg");
        }
      } else {
        for (var element in photosnamesWithCorrespondingPaths.entries) {
          photoNamesWithCorrespondingdownloadLinks[element.key] =
              await _generalFirebaseStorageCrud.uploadPhotoAndroidAndIos(
                  storageEntity: storageEntity,
                  localImagePath: element.value,
                  restaurantUid: restaurantUid,
                  nameOfFile: "${element.key}.jpg");
        }
      }

      emit(UploadPhotosLoaded(
          photosnamesWithCorrespondingDownloadLinks:
              photoNamesWithCorrespondingdownloadLinks));
    } catch (e) {
      print(e);
      emit(UploadPhotosError());
    }
  }
}
