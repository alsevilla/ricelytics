from django.db import models

# Database tables of the Program
# Create your models here.
#  Django requires non null value as default
# declare null=true, blank=true to make the django accept blank data or null data
class ids_ecosystem(models.Model):
    eco = models.CharField(max_length=1)
    ecoName = models.CharField(max_length=255)

    class Meta:
        # Name of the table
        db_table = 'ids_ecosystem'

class ids_location(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    locName = models.CharField(max_length=255, null=True, blank=True)
    sort = models.SmallIntegerField(null=True, blank=True)
    parent = models.SmallIntegerField(null=True, blank=True)

    class Meta:
        db_table = 'ids_location'
    # use this funtion if using foreinKey to view the locCode value instead of '[ids_location:value[0]]'
    def __self__(self):
        return '%s' % (self.locCode)

class kpi_costs(models.Model):
    # locCode = models.ForeignKey(ids_location,to_field="locCode", db_column="locCode", on_delete=models.CASCADE)
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    costProduction = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_costs'

class kpi_cpi(models.Model):
    # locCode =  models.ForeignKey(ids_location,to_field="locCode", db_column="locCode", on_delete=models.CASCADE)
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    cpiAll = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    cpiFood = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    cpiRice = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_cpi'

class kpi_pay(models.Model):
    # locCode =  models.ForeignKey(ids_location,to_field="locCode", db_column="locCode", on_delete=models.CASCADE)
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    semester = models.CharField(max_length=1, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    estProduction = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    areaHarv = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    yieldEst = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_pay'

class kpi_prices(models.Model):
    # locCode =  models.ForeignKey(ids_location,to_field="locCode", db_column="locCode", on_delete=models.CASCADE)
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    farmgatePrice = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    wholesalePrice = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    WholesaleSpPrice = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    retailPrice = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    retailSpPrice = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_prices'

class kpi_sua(models.Model):
    # locCode =  models.ForeignKey(ids_location,to_field="locCode", db_column="locCode", on_delete=models.CASCADE)
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    SUBeginningStocks = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    SUProduction = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    SUImports = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTExports = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTSeeds = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTFeedsWaste = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTProcessing = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTEndingStocks = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTPerCapitaKg = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    UTPerCapitaGram = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_sua'

class kpi_value(models.Model):
    # locCode =  models.ForeignKey(ids_location,to_field="locCode", db_column="locCode", on_delete=models.CASCADE)
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    palayValue = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    agriValue = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    gdpValue = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_value'

class kpi_costscom(models.Model):
    locName = models.CharField(max_length=255, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    materialInputs = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    hiredLabor = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    OFELabor = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    machine = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    irrigation = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    landRent = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    interestCapital = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    otherInputs = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_costscom'

class kpi_npk(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    nperha = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    pperha = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    kperha = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_npk'

class kpi_percapita(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    PerCapitaKg = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    PerCapitaGram = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_percapita'

class rb_farm(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    aveFarmSize = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    tstatusOwned = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    tstatusAmort = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    tstatusLessee = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    tstatusTenant = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    tstatusOthers = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    areaLessOne = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    areaOneTwo = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    areaTwoThree = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    areaMoreThree = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_farm'

class rb_income(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    monthlyIncome = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    riceSource = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    vegetableSource = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    selfEmployesSource = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    liveStockSource = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    salarySource = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    otheSource = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    abovePovertyShare = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    belowPovertShare = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_income'

class rb_socio(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    count = models.IntegerField(null=True, blank=True)
    age = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    sexMale = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    sexFemale = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    cstatusSingle = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    cstatusMarried = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    cstatusWidow = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    cstatusSeparated = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    yrsSchooling = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    yrsFarmExp = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    hhSize = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    orgMember = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    withTraining = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_socio'

class kpi_pop(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    population = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'kpi_pop'

class rb_ycost(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    yieldEst = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    costperkg = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    
    class Meta:
        db_table = 'rb_ycost'

class rb_cropest(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    transplant = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    wetDirect = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    dryDirect = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    totalDirect = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    bothMethod = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    transSeedingRate = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    directSeedingRate = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    aveSeedingRate = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    
    class Meta:
        db_table = 'rb_cropest'

class rb_cropsched(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    month = models.DecimalField(max_digits=2, decimal_places=0, null=True, blank=True)
    plant1 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    plant2 = models.DecimalField(max_digits=10, decimal_places=0,null=True, blank=True)
    plant3 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    harv1 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    harv2 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    harv3 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_cropsched'

class rb_cropsched(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    month = models.DecimalField(max_digits=2, decimal_places=0, null=True, blank=True)
    plant1 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    plant2 = models.DecimalField(max_digits=10, decimal_places=0,null=True, blank=True)
    plant3 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    harv1 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    harv2 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    harv3 = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_cropsched'

class rb_fertgrade(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    rank = models.DecimalField(max_digits=2, decimal_places=0, null=True, blank=True)
    grade = models.CharField(max_length=500, null=True, blank=True)
    percent = models.DecimalField(max_digits=10, decimal_places=0,null=True, blank=True)

    class Meta:
        db_table = 'rb_fertgrade'

class rb_fertilizer(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    nPerHa = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    pPerHa = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    kPerHa = models.DecimalField(max_digits=10, decimal_places=2,null=True, blank=True)
    fertPerHa = models.DecimalField(max_digits=10, decimal_places=2,null=True, blank=True)

    class Meta:
        db_table = 'rb_fertilizer'

class rb_labor(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    totalLabor = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    preHarvest = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    harvThreshing = models.DecimalField(max_digits=10, decimal_places=2,null=True, blank=True)
    postHarvest = models.DecimalField(max_digits=10, decimal_places=2,null=True, blank=True)
    permLabor = models.DecimalField(max_digits=10, decimal_places=2,null=True, blank=True)

    class Meta:
        db_table = 'rb_labor'

class rb_machine(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    adoptionRHandtractor = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    adoptionFTiller = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    adoptionMicrotiller = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    adoptionDrumseeder = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    adoptionTransplanter = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    adoptionReaper = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    adoptionCHarvester = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_machine'

class rb_pest(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    rank = models.DecimalField(max_digits=2, decimal_places=0, null=True, blank=True)
    brand = models.CharField(max_length=500, null=True, blank=True)
    percent = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_pest'

class rb_seedclass(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    hybrid = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    highInbred = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    goodSeeds = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    farmerSeeds = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_seedclass'

class rb_variety(models.Model):
    locCode = models.SmallIntegerField()
    locType = models.CharField(max_length=1, null=True, blank=True)
    year = models.CharField(max_length=4, null=True, blank=True)
    eco = models.CharField(max_length=1, null=True, blank=True)
    rank = models.DecimalField(max_digits=2, decimal_places=0, null=True, blank=True)
    variety = models.CharField(max_length=500, null=True, blank=True)
    percent = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)

    class Meta:
        db_table = 'rb_variety'