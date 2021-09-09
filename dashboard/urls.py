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
    path('National/RiceProductions', views.riceproduction, name='RiceProductions'),
    path('National/HarvestAreas', views.areaharvested, name='HarvestAreas'),
    path('National/EstYields', views.estimatedyield, name='EstYields'),
    path('National/SupplyUtilization', views.supplyUtilization, name='SupplyUtilization'),
    path('National/Consumption', views.consumption, name='Consumption'),
    path('National/ImportExport', views.importExport, name='ImportExport'),
    path('National/Prices', views.prices, name='Prices'),
    path('National/Valuations', views.valuations, name='Valuations'),
    path('National/Incomes', views.incomes, name='Incomes'),
    path('National/YieldCost', views.yieldcost, name='YieldCost'),
    # ################################################# #
    #             Rice Industry (National)              #
    # ################################################# #
    path('Regional',views.regional, name='Regional'),
    path('Regional/RegionRiceProduction', views.regionriceproduction, name='RegionRiceProduction'),
    path('Regional/RegionAreaHarvested', views.regionareaharvested, name = 'RegionAreaHarvested'),
    path('Regional/RegionEstYields', views.regionestyields, name = 'RegionEstYields'),
    path('Regional/RegionValuations', views.regionvaluations, name = 'RegionValuations'),
    path('Regional/RegionIncomes', views.regionincomes, name = 'RegionIncomes'),
    path('Regional/RegionYieldCost', views.regionyieldcost, name = 'RegionYieldCost'),
    path('Regional/RegionPrices', views.regionprices, name = 'RegionPrices'),
    # ################################################# #
    #             Rice Farmer (National)                #
    # ################################################# #
    path('NationalFarmer/Profile', views.profile, name='Profile'),
    path('NationalFarmer/EstimatedNetIncome', views.estimatedNetIncome, name='EstimatedNetIncome'),
    path('NationalFarmer/AgeSexCivilStatus', views.agesexcivilstatus, name='AgeSexCivilStatus'),
    path('NationalFarmer/FarmAverageSize', views.farmaveragesize, name='FarmAverageSize'),
    path('NationalFarmer/FormalEducation', views.formalEducation, name='FormalEducation'),
    path('NationalFarmer/Household', views.household, name='Household'),
    path('NationalFarmer/OrganizationTraining', views.organizationTraining, name='OrganizationTraining'),
    # ################################################# #
    #             Rice Farmer (Regional)                #
    # ################################################# #
    path('RegionalFarmer/RegionProfile', views.regionprofile, name='RegionProfile'),
    path('RegionalFarmer/RegionEstimatedNetIncome', views.regionestimatedNetIncome, name='RegionEstimatedNetIncome'),
    path('RegionalFarmer/RegionAgeSexCivilStatus', views.regionagesexcivilstatus, name='RegionAgeSexCivilStatus'),
    path('RegionalFarmer/RegionFarmAverageSize', views.regionfarmaveragesize, name='RegionFarmAverageSize'),
    path('RegionalFarmer/RegionFormalEducation', views.regionformalEducation, name='RegionFormalEducation'),
    path('RegionalFarmer/RegionHousehold', views.regionhousehold, name='RegionHousehold'),
    path('RegionalFarmer/RegionOrganizationTraining', views.regionorganizationTraining, name='RegionOrganizationTraining'),
]
