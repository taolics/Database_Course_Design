from django.contrib import admin
from django.urls import path
from login import views as loginviews
from market import views as marketviews

urlpatterns = [
    path('search/',marketviews.search),
    path('delete/<int:id>',marketviews.delete),
    path('personal/',marketviews.personal),
    path('list/',marketviews.list),
    path('issue/',marketviews.issue),
    path('',loginviews.index),
    path('index/',loginviews.index),
    path('login/',loginviews.login),
    path('register/',loginviews.register),
    path('logout/',loginviews.logout),
    path('admin/', admin.site.urls),
	path('order/<int:id>', marketviews.order),
    path('admincenter/', marketviews.admin),
	path('cancel/<int:id>',marketviews.cancel),
    path('complaints/',marketviews.complaints),
    path('identifys/',marketviews.identifys),
    path('compprocess/',marketviews.compprocess),
    path('compprocess/<int:id>/pass',marketviews.comppass),
    path('compprocess/<int:id>/reject',marketviews.compreject),
    path('identprocess/',marketviews.identprocess),
    path('identprocess/<int:id>/pass',marketviews.idprpass),
    path('identprocess/<int:id>/reject',marketviews.idprreject),
    path('check/<int:id>', marketviews.check),
    path('not_exist/', marketviews.not_exist),
    path('terms/', loginviews.terms),
]
