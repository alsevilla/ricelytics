from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='HomePage'),
    path('profile', views.profile, name='Profile'),
    path('productions', views.riceproduction, name='RiceProductions'),
    path('harvestareas', views.areaharvested, name='HarvestAreas'),
    path('estyields', views.estimatedyield, name='EstYields'),
    path('supplyUtilization', views.supplyUtilization, name='SupplyUtilization'),
    path('consumption', views.consumption, name='Consumption'),
    path('importExport', views.importExport, name='ImportExport'),
    path('prices', views.prices, name='Prices'),
    path('valuations', views.valuations, name='Valuations'),
    path('incomes', views.incomes, name='Incomes'),
    path('yieldcost', views.yieldcost, name='YieldCost'),
]
