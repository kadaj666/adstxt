from django.contrib import admin
from django.urls import path
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import url
from django.contrib.auth import views as auth_views
from .forms import UserLoginForm
from dashboard.urls import router as dashboard_router
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.registry.extend(dashboard_router.registry)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('', include('dashboard.urls')),
    path('login', auth_views.LoginView.as_view(template_name='auth/login.html', authentication_form=UserLoginForm), name='login'),
    path('logout', auth_views.LogoutView.as_view(template_name='auth/logout.html'), name='logout'),


]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)