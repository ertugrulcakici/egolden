abstract class INavigationService {
  Future<void> navigateToPage(
      {String? title, required String path, Object? data});
  Future<void> navigateToPageClear(
      {String? title, required String path, Object? data});
}
