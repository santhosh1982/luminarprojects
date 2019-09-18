from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from . import views as ind_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
  url(r'^$',ind_views.home,name='home'),
  url(r'Messages/(?P<pk>\d+)$',ind_views.messages,name='messages'),
  url(r'Profile/$',ind_views.studentprofile,name='studentprofile'),
  url(r'Exam/Results/$',ind_views.results,name='results'),
  url(r'Chart$',ind_views.chart,name='chart'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)