# Extension URLs of the program
# The mail URLs are in "ricelytics/urls.py"
# Before declaring a URL path django needs to define a class first in django views.py
from django.urls import path
from . import views # Calls all define classes from views.py

urlpatterns = [
    # ################################################# #
    #             Rice Industry (National)              #
    # ################################################# #
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

    # ################################################# #
    #             Rice Farmer (National)                #
    # ################################################# #
    path('profile', views.profile, name='Profile'),
    path('estimatedNetIncome', views.estimatedNetIncome, name='EstimatedNetIncome'),
    path('agesexcivilstatus', views.agesexcivilstatus, name='AgeSexCivilStatus'),
    path('farmaveragesize', views.farmaveragesize, name='FarmAverageSize'),
    path('formalEducation', views.formalEducation, name='FormalEducation'),
    path('household', views.household, name='Household'),
    path('organizationTraining', views.organizationTraining, name='OrganizationTraining'),
]
