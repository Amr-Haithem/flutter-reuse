part of 'upload_photos_cubit.dart';

@immutable
sealed class UploadPhotosState {}

final class UploadPhotosInitial extends UploadPhotosState {}

final class UploadPhotosLoading extends UploadPhotosState {}

final class UploadPhotosLoaded extends UploadPhotosState {
  final Map<String,String> photosnamesWithCorrespondingDownloadLinks;

  UploadPhotosLoaded({required this.photosnamesWithCorrespondingDownloadLinks});
}

final class UploadPhotosError extends UploadPhotosState {}
