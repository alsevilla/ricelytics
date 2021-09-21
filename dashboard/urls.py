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
    #             Rice Industry (Regional)              #
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
    #             Rice Industry (Provincial)              #
    # ################################################# #
    path('Provincial', views.provincial, name = 'Provincial'),
    path('Provincial/ProvinceProduction', views.provinceproductions, name = 'ProvinceProduction'),
    path('Provincial/ProvinceAreaHarvested', views.provinceharvestareas, name = 'ProvinceAreaHarvested'),
    path('Provincial/ProvinceEstYields', views.provinceestyields, name = 'ProvinceEstYields'),
    path('Provincial/ProvinceIncomes', views.provinceincomes, name = 'ProvinceIncomes'),
    path('Provincial/ProvinceYieldCost', views.provinceyieldcost, name = 'ProvinceYieldCost'),
    path('Provincial/ProvincePrices', views.provinceprices, name = 'ProvincePrices'),
    # ################################################# #
    #             Rice Farmer (National)                #
    # ################################################# #
    path('NationalFarmer/Profile', views.profile, name='Profile'),
    path('NationalFarmer/EstimatedNetIncome', views.estimatedNetIncome, name='EstimatedNetIncome'),
    path('NationalFarmer/Age', views.age, name='Age'),
    path('NationalFarmer/SexAndCivilStatus', views.sexcivilstatus, name='SexAndCivilStatus'),
    path('NationalFarmer/FarmAverageSize', views.farmaveragesize, name='FarmAverageSize'),
    path('NationalFarmer/FormalEducation', views.formalEducation, name='FormalEducation'),
    path('NationalFarmer/Household', views.household, name='Household'),
    path('NationalFarmer/OrganizationTraining', views.organizationTraining, name='OrganizationTraining'),
    # ################################################# #
    #             Rice Farmer (Provincial)              #
    # ################################################# #
    path('ProvincialFarmer/ProvinceProfile', views.provinceprofile, name='ProvinceProfile'),
    path('ProvincialFarmer/ProvinceEstimatedNetIncome', views.provinceestimatedNetIncome, name='ProvinceEstimatedNetIncome'),
    path('ProvincialFarmer/ProvinceAge', views.provinceage, name='ProvinceAge'),
    path('ProvincialFarmer/ProvinceSexAndCivilStatus', views.provincesexcivilstatus, name='ProvinceSexAndCivilStatus'),
    path('ProvincialFarmer/ProvinceFarmAverageSize', views.provincefarmaveragesize, name='ProvinceFarmAverageSize'),
    path('ProvincialFarmer/ProvinceFormalEducation', views.provinceformalEducation, name='ProvinceFormalEducation'),
    path('ProvincialFarmer/ProvinceHousehold', views.provincehousehold, name='ProvinceHousehold'),
    path('ProvincialFarmer/ProvinceOrganizationTraining', views.provinceorganizationTraining, name='ProvinceOrganizationTraining'),
    # ################################################# #
    #             Rice Practices (National)             #
    # ################################################# #
    path('NationalPractices/RicePractices', views.practices, name='RicePractices'),
    path('NationalPractices/CropEstablishment', views.cropestablishment, name='CropEstablishment'),
    path('NationalPractices/SeedingRate', views.seedingrate, name='SeedingRate'),
    path('NationalPractices/FertilizerApplication', views.fertilizerapplication, name='FertilizerApplication'),
    path('NationalPractices/CroppingCalendar', views.croppingcalendar, name='CroppingCalendar'),
    path('NationalPractices/SeedClass', views.seedclass, name='SeedClass'),
    path('NationalPractices/LaborManagement', views.labormanagement, name='LaborManagement'),
    path('NationalPractices/PesticideApplication', views.pesticideapplication, name='PesticideApplication'),
    path('NationalPractices/VarietalSelection', views.varietalselection, name='VarietalSelection'),
    path('NationalPractices/Fertilizer', views.fertilizer, name='Fertilizer'),
    path('NationalPractices/Machine', views.machine, name='Machine'),
    # ################################################# #
    #             Rice Practices (Provincial)           #
    # ################################################# #
    path('ProvincialPractices/RicePractices', views.provincepractices, name='ProvincialRicePractices'),
    path('ProvincialPractices/CropEstablishment', views.provincecropestablishment, name='ProvincialCropEstablishment'),
    path('ProvincialPractices/SeedingRate', views.provinceseedingrate, name='ProvincialSeedingRate'),
    path('ProvincialPractices/FertilizerApplication', views.provincefertilizerapplication, name='ProvincialFertilizerApplication'),
    path('ProvincialPractices/CroppingCalendar', views.provincecroppingcalendar, name='ProvincialCroppingCalendar'),
    path('ProvincialPractices/SeedClass', views.provinceseedclass, name='ProvincialSeedClass'),
    path('ProvincialPractices/LaborManagement', views.provincelabormanagement, name='ProvincialLaborManagement'),
    path('ProvincialPractices/PesticideApplication', views.provincepesticideapplication, name='ProvincialPesticideApplication'),
    path('ProvincialPractices/VarietalSelection', views.provincevarietalselection, name='ProvincialVarietalSelection'),
    path('ProvincialPractices/Fertilizer', views.provincefertilizer, name='ProvincialFertilizer'),
    path('ProvincialPractices/Machine', views.provincemachine, name='ProvincialMachine'),
]
