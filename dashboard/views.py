from django.shortcuts import render
from django.http import HttpResponse

# home page
def index(request):
    title = 'State of the Rice Sector in the Philippines'
    searchbartype = '1'
    context = { 'title': title,
                'searchbartype': searchbartype,}
    return render(request, 'index.html', context)

#Profile
def profile(request):
    title = 'State of the Rice Sector in the Philippines'
    searchbartype = '1'
    context = { 'title': title,
                'searchbartype': searchbartype,}
    return render(request, 'profile.html', context)

# rice productions
def riceproduction(request):
    title = 'Rice Production'
    context = { 'title': title,}
    return render(request, 'productions.html', context)

# area harvested
def areaharvested(request):
    title = 'Area Harvested'
    context = { 'title': title}
    return render(request, 'harvestareas.html', context)

#estimated yield
def estimatedyield(request):
    title = 'Yield Per Hectare'
    context = { 'title': title}
    return render (request, 'estyields.html', context)

# supply and utilization
def supplyUtilization(request):
    title = 'Supply and Utilization'
    context = { 'title': title}
    return render (request,'supplies.html', context)

# consumption
def consumption(request):
    title = 'Rice Consumption'
    context = { 'title': title}
    return render(request,'consumption.html', context)

# import and export
def importExport(request):
    title = 'Imports and Exports'
    context = { 'title': title}
    return render(request,'impexports.html', context)

# Prices
def prices(request):
    title = 'Rice Market Prices'
    context = { 'title': title}
    return render(request,'prices.html', context)

# valuations
def valuations(request):
    title = 'Gross Value Added'
    context = { 'title': title}
    return render(request, 'valuations.html', context)

# incomes
def incomes(request):
    title = "Farmer's Income"
    context = { 'title': title}
    return render(request, 'incomes.html', context)

# yield and production cost
def yieldcost(request):
    title = 'Yield and Production Cost'
    context = { 'title': title}
    return render(request, 'yieldcost.html', context)
