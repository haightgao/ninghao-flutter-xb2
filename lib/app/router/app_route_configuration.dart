/// 路由配置
class AppRouteConfiguration {
  final String pageName;
  final String? resourceId;

  AppRouteConfiguration.home()
      : pageName = '',
        resourceId = null;
  AppRouteConfiguration.appAbout()
      : pageName = 'AppAbout',
        resourceId = null;

  AppRouteConfiguration.postShow(this.resourceId) : pageName = 'PostShow';

  bool get isHomePage => pageName == '';
  bool get isAppAboutPage => pageName == 'AppAbout';
  bool get isPostShow => pageName == 'PostShow' && resourceId != null;
}
