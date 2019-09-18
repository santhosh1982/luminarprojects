from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from . import views as ind_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
  url(r'^$',ind_views.home,name='home'),
  url(r'^Upload/AnswerSheets$',ind_views.UploadAnswerSheets,name='uploadanswers'),
  url(r'^Upload/StudentDetails$',ind_views.simple_upload,name='uploadStudentDetials'),
  url(r'^View/StudentDetails$',ind_views.viewstudentslist,name='viewstudentslist'),
  url(r'^Corrected/AnswerSheets$',ind_views.correctedpapersList,name='correctedpapersList'),
  url(r'Messages/(?P<pk>\d+)$',ind_views.messages,name='messages'),
  url(r'chart/$',ind_views.chart,name='chart'),
  url(r'chart1/$',ind_views.chart1,name='chart1'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)