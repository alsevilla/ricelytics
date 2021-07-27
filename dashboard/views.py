from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from django.db.models.functions import Concat
from django.db.models import Value, Sum
import django.utils.timezone as timezone
from django.db import connection
import json
import decimal

# DecimalEncoder converts DecimalField of Django Models to json.dumps
class DecimalEncoder(json.JSONEncoder):
    def default(self,o):
        if isinstance(o,decimal.Decimal):
            return float(o)
        super(DecimalEncoder,self).default(o)

# home page
def index(request):
    title = 'State of the Rice Sector in the Philippines' # Declared the title for the page title and tab title
    searchbartype = '1' # for differentiate the nav bar
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2020' # end Date, for Range
    ecosystem = '2' # type of eco in ids_ecosystem, All ecosystem
    # Rice Production
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value of rice production
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, ids_ecosystem, kpi_pay
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= %s
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= %s
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]):# assign values to %s (apples to apples type)
        rp_year = data.year # assign year value of the query to rp_year
        rp_value = data.value # assign value value of the query to rp_value
        rp_compare = data.compare # assign compare value of the query to rp_compare
    # Area Harvested
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value of Area Harvested
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, ids_ecosystem, kpi_pay
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= %s
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= %s
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""",
                                        [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]): # assign values to %s (apples to apples type)
        ah_year = data.year # assign year value of the query to ah_year
        ah_value = data.value # assign value value of the query to ah_value
        ah_compare = data.compare # assign compare value of the query to ah_compare

    # Yield per hectare
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value, compare pg Yield per hectare
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay, ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= %s
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= %s
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]): # assign values to %s (apples to apples type)
        yph_year = data.year # assigned year of the query to yph_year
        yph_value = data.value # assigned value of the query to yph_value
        yph_compare = data.compare # assigned compare of the query to yph_compare

    # Supply and Utilization
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare of supply
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_sua, ids_location
    for data in kpi_pay.objects.raw("""SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."supply", ("t1"."supply" - "t2"."supply") as supply_compare, "t1"."utilization", ("t1"."utilization" - "t2"."utilization") as utilization_compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS supply, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) +
                                                    COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS utilization
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS supply, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) +
                                                    COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS utilization
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        supply_value = data.supply # assigned supply of the query to supply_ value
        supply_compare = data.supply_compare # assigned supply_compare of the query to supply_supply_compare
        utilization_value = data.utilization # assigned utilization of the query to utilization_value
        utilization_compare = data.utilization_compare # assigned utilization_compare of the query to utilization_compare

    # locally Produced and Net Food Disposable
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # get the location_name, year, suproduction, uttotalnet, suproduction_compare, uttotalnet_compare
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_sua, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."suproduction", "t1"."uttotalnet", ("t1"."suproduction" - "t2"."suproduction") as suproduction_compare, ("t1"."uttotalnet" - "t2"."uttotalnet") as uttotalnet_compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND(("s"."SUProduction")/1000::numeric,2) AS SUProduction, ROUND(((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)))/1000::numeric,2) AS UTTotalNet
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND(("s"."SUProduction")/1000::numeric,2) AS SUProduction, ROUND(((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)))/1000::numeric,2) AS UTTotalNet
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        lp_value = data.suproduction # assigned suproduction of the query to lp_value
        lp_compare = data.suproduction_compare # assigned suproduction_compare of the query to lp_compare
        nf_value = data.uttotalnet # assigned uttotalnet of the query to nf_value
        nf_compare = data.uttotalnet_compare # assigned uttotalnet_compareof the query to nf_compare

    # Import and Export
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # get the location_name, year, suimports, UTExports, suimports_compare, utexports_compare
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_sua, ids_location
    # separate from locally Produced and Net Food Disposable for the reason of diffetent modules used but it can be unified if necessary
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."suimports", "t1"."UTExports", ("t1"."suimports" - "t2"."suimports") AS suimports_compare, ("t1"."UTExports" - "t2"."UTExports") AS utexports_compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND(("s"."SUImports")/1000::numeric,2) AS SUImports, "s"."UTExports"
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND(("s"."SUImports")/1000::numeric,2) AS SUImports, "s"."UTExports"
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                                    """, [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        import_value = data.suimports # assigned suimports of the query to import_value
        import_compare = data.suimports_compare # assigned suimports_compare of the query to import_compare
        export_value = data.UTExports # assigned UTExports of the query to export_value
        export_compare = data.utexports_compare # assigned utexports_compare of the query to export_compare

    # Farmgate Price, Wholesale Price, Retail Price
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, farmgatePrice, wholesalePrice, retailPrice, farmgaterice_compare, wholesalePrice_compare, retailPrice_compare
    # Used tables kpi_prices, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."farmgatePrice", "t1"."wholesalePrice", "t1"."retailPrice", "t1"."WholesaleSpPrice", "t1"."retailSpPrice", ("t1"."farmgatePrice" - "t2"."farmgatePrice") AS farmgaterice_compare, ("t1"."wholesalePrice" - "t2"."wholesalePrice") AS wholesalePrice_compare, ("t1"."WholesaleSpPrice" - "t2"."WholesaleSpPrice") AS wholesaleSpPrice_compare, ("t1"."retailPrice" - "t2"."retailPrice") AS
                                            retailPrice_compare, ("t1"."retailSpPrice" - "t2"."retailSpPrice") AS retailSpPrice_compare
                                            FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice", "k"."wholesalePrice", "k"."WholesaleSpPrice", "k"."retailPrice", "k"."retailSpPrice"
                                            			FROM "kpi_prices" "k"
                                            			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                            			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                            			ORDER BY "k"."year" DESC
                                            			LIMIT 2) "t1"
                                            INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice", "k"."wholesalePrice", "k"."WholesaleSpPrice", "k"."retailPrice", "k"."retailSpPrice"
                                            			FROM "kpi_prices" "k"
                                            			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                            			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                            			ORDER BY "k"."year" DESC
                                            			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        """, [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        farmgate_value = data.farmgatePrice  # assigned farmgatePrice of the query to farmgate_value
        farmgate_compare = data.farmgaterice_compare  # assigned farmgaterice_compare of the query to farmgate_compare
        wholesale_value = data.wholesalePrice  # assigned wholesalePrice of the query to wholesale_value
        wholesale_compare = data.wholesaleprice_compare  # assigned wholesaleprice_compare of the query to wholesale_compare
        wholesaleSp_value = data.WholesaleSpPrice  # assigned WholesaleSpPrice of the query to wholesaleSp_value
        wholesaleSp_compare = data.wholesalespprice_compare  # assigned wholesaleSpPrice_compare of the query to wholesaleSp_compare
        retail_value = data.retailPrice  # assigned retailPrice of the query to retail_value
        retailSp_value = data.retailSpPrice  # assigned retailSpPrice of the query to retailSp_value
        retail_compare = data.retailprice_compare  # assigned retailprice_compare of the query to retail_compare
        retailSp_compare = data.retailspprice_compare  # assigned retailSpPrice_compare of the query to retailSp_compare

    # Gross Value Added, Share to Agri. GVA, Share to Nat. GDP
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    #  get location_name, year, gva, gvashare, gdpshare, gva_compare
    # Used tables kpi_value, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."gva",  "t1"."gvashare",  "t1"."gdpshare", ("t1"."gva" - "t2"."gva") AS gva_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year", ROUND(("k"."palayValue")/1000::numeric,3) as gva, ROUND((("k"."palayValue"/"k"."agriValue")*100)::numeric,1) AS gvashare, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,2) AS gdpshare
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year", ROUND(("k"."palayValue")/1000::numeric,3) as gva, ROUND((("k"."palayValue"/"k"."agriValue")*100)::numeric,1) AS gvashare, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,2) AS gdpshare
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                                    """, [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        gva_value = data.gva # assigned gva of the query to gva_value
        gva_compare = data.gva_compare # assigned gva_compare of the query to gva_compare
        gvashare_value = data.gvashare # assigned gvashare of the query to gvashare_value
        gdpshare_value = data.gdpshare # assigned gdpshare of the query to gdpshare_value

    # Net Returns, Gross Return
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # Get location_name, year, gross, net, gross_compare, net_compare
    # Used sub query for yieldEst in kpi_pay table, Used tables kpi_pay, kpi_costs, kpi_prices, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", TO_CHAR(("t1"."gross"),'999,999') AS gross, TO_CHAR(("t1"."net"),'999,999') AS net, ("t1"."gross" - "t2"."gross") AS gross_compare, ("t1"."net" - "t2"."net") AS net_compare
                                        FROM (		SELECT "c"."id" AS id, "l"."locName" AS location_name, "y"."year" AS year, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice")) AS gross, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice") - "c"."costProduction") AS net
                                        			FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                                        				FROM "kpi_pay"
                                        				WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= '2019'
                                        				GROUP BY "locCode", "locType", "year", "eco") "y"
                                        			FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                                        			FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                                        			FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                                        			WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<='2019'
                                        			ORDER BY "y"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "c"."id" AS id, "l"."locName" AS location_name, "y"."year" AS year, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice")) AS gross, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice") - "c"."costProduction") AS net
                                        			FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                                        				FROM "kpi_pay"
                                        				WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= '2019'
                                        				GROUP BY "locCode", "locType", "year", "eco") "y"
                                        			FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                                        			FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                                        			FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                                        			WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<='2019'
                                        			ORDER BY "y"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        """, [location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start,location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start]): # assign values to %s (apples to apples type)
        gr_value = data.gross # assigned gross of the query to gr_value
        gr_compare = data.gross_compare # assigned gross_compare of the query to gr_compare
        nr_value = data.net # assigned net of the query to nr_value
        nr_compare = data.net_compare # assigned net_compare of the query to nr_compare

        # Unit Cost
        # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
        # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
        # get location_name, year, value, compare
        # Used sub query to get value in kpi_cost joining ids_location
        # Used tables kpi_pay, ids_location, ids_ecosystem, kpi_costs
        for data in kpi_pay.objects.raw("""SELECT "t1"."id" AS id, "t1"."location_name", "t1"."year", ("t1"."value") AS value, ("t1"."value" - "t2"."value") AS compare
                                            FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("x"."costProduction"/AVG("k"."yieldEst"))/1000::numeric,2) AS value
                                            			FROM  ( SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."costProduction","k"."locCode", "k"."locType"
                                            					FROM "kpi_costs" "k"
                                            					FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                            					WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year" >= %s AND "k"."year" <= '2019'
                                            					ORDER BY year DESC
                                            					LIMIT 1
                                            			) "x"
                                            			FULL JOIN "kpi_pay" "k" ON "k"."locType" = "x"."locType" AND "k"."locCode" = "x"."locCode"
                                            			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                            			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                            			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND "k"."year" >=%s AND "k"."year" <= '2019' AND "k"."eco" = %s
                                            			GROUP BY "l"."id", "l"."locName", "k"."year", "k"."locCode", "k"."locType","x"."costProduction"
                                            			ORDER BY year DESC
                                            			LIMIT 2
                                            			) "t1"
                                            INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("x"."costProduction"/AVG("k"."yieldEst"))/1000::numeric,2) AS value
                                            			FROM  ( SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."costProduction","k"."locCode", "k"."locType"
                                            					FROM "kpi_costs" "k"
                                            					FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                            					WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year" >= %s AND "k"."year" <= '2019'
                                            					ORDER BY year DESC
                                            					LIMIT 1
                                            			) "x"
                                            			FULL JOIN "kpi_pay" "k" ON "k"."locType" = "x"."locType" AND "k"."locCode" = "x"."locCode"
                                            			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                            			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                            			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND "k"."year" >=%s AND "k"."year" <='2019' AND "k"."eco" = %s
                                            			GROUP BY "l"."id", "l"."locName", "k"."year", "k"."locCode", "k"."locType","x"."costProduction"
                                            			ORDER BY year DESC
                                            			LIMIT 2
                                            			) "t2" ON "t1"."location_name" = "t2"."location_name"
                                            LIMIT 1""", [location_code, location_type, year_start ,location_code, location_type, year_start, ecosystem,location_code, location_type, year_start,location_code, location_type, year_start, ecosystem]): # assign values to %s (apples to apples type)
            uc_value = data.value # assigned value of the query to uc_value
            uc_compare = data.compare # assigned compare of the query to uc_compare
    # pass declared variables to templates
    context = { 'title': title,
                'searchbartype': searchbartype,
                'rp_year':rp_year,
                'rp_value':rp_value,
                'rp_compare':rp_compare,
                'ah_year':ah_year,
                'ah_value':ah_value,
                'ah_compare':ah_compare,
                'yph_year':yph_year,
                'yph_value':yph_value,
                'yph_compare':yph_compare,
                'supply_value':supply_value,
                'supply_compare':supply_compare,
                'utilization_value':utilization_value,
                'utilization_compare':utilization_compare,
                'lp_value':lp_value,
                'lp_compare':lp_compare,
                'nf_value':nf_value,
                'nf_compare':nf_compare,
                'import_value':import_value,
                'import_compare':import_compare,
                'export_value':export_value,
                'export_compare':export_compare,
                'farmgate_value':farmgate_value,
                'farmgate_compare':farmgate_compare,
                'wholesale_value':wholesale_value,
                'wholesale_compare':wholesale_compare,
                'wholesaleSp_value':wholesaleSp_value,
                'wholesaleSp_compare':wholesaleSp_compare,
                'retail_value':retail_value,
                'retail_compare':retail_compare,
                'retailSp_value':retailSp_value,
                'retailSp_compare':retailSp_compare,
                'gva_value':gva_value,
                'gva_compare':gva_compare,
                'gvashare_value':gvashare_value,
                'gdpshare_value':gdpshare_value,
                'gr_value':gr_value,
                'gr_compare':gr_compare,
                'nr_value':nr_value,
                'nr_compare':nr_compare,
                'uc_value':uc_value,
                'uc_compare':uc_compare,}
    return render(request, 'index.html', context) # render the page with the context

#Profile
def profile(request):
    title = 'State of the Rice Sector in the Philippines'
    searchbartype = '1'
    context = { 'title': title,
                'searchbartype': searchbartype,}
    return render(request, 'profile.html', context)

# rice productions
def riceproduction(request):
    title = 'Palay Production'# Declared the title for the page title and tab title
    location_code = '999'# locCode in ids_location, Philippines
    location_type = '2'# locType in ids_location, Provinces
    year_start = '2000'# starting Date, for range
    year_end = '2020'# end Date, for Range
    keys = ('location_name','year','value') # for json dict labels
    # The 3 Main KPI queries are all the same except for the eco in the where statement
    # Main kpi Production - Irrigated (2020)
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, compare
    # Used tables ids_location, kpi_pay, ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '1'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '1'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        irrigated_year = data.year # assign year to irrigated_year
        irrigated_value = data.value # assign value to irrigated_value
        irrigated_compare = data.compare # assign compare to irrigated_compare
    # Main kpi Production - Rice Production (2020)
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, compare
    # Used tables ids_location, kpi_pay, ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '2'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '2'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        all_eco_year = data.year
        all_eco_value = data.value
        all_eco_compare = data.compare
    # Main kpi Production - Production - Non-Irrigated (2020)
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, compare
    # Used tables ids_location, kpi_pay, ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '0'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '0'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # Execute query (same Raw query execution as the precedent)
        non_irrigated_year = data.year # assign year to non_irrigated_year
        non_irrigated_value = data.value # assign value to non_irrigated_value
        non_irrigated_compare = data.compare # assign compare to non_irrigated_compare
    # All Ecosystem (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    aeCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    aeCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '2'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])  # assign values to %s (apples to apples type)
    aeRows = aeCursor.fetchall() # fetch all data of the executed query
    aeResult = []  # store the values as an array or data dictionary
    for row in aeRows:
        aeResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    aeData = json.dumps(aeResult,cls=DecimalEncoder) # dumps the data as a json

    # Irrigated (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    iCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    iCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '1'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    iRows = iCursor.fetchall() # fetch all data of the executed query
    iResult = [] # store the values as an array or data dictionary
    for row in iRows:
        iResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    iData = json.dumps(iResult,cls=DecimalEncoder) # dumps the data as a json

    #Lowland Rainfed (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rfCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    rfCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '0'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rfRows = rfCursor.fetchall() # fetch all data of the executed query
    rfResult = [] # store the values as an array or data dictionary
    for row in rfRows:
        rfResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    rfData = json.dumps(rfResult,cls=DecimalEncoder) # dumps the data as a json

    #Top Provincial Production, 2020 only, All Ecosystem (Chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    tpCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    tpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "l"."locCode"!=%s AND "k"."locType" = %s AND year = %s AND "k"."eco"= '2'
                        GROUP BY year, location_name
                        ORDER BY value DESC""", [location_code, location_type, year_end]) # assign values to %s (apples to apples type)
    tpRows = tpCursor.fetchall() # fetch all data of the executed query
    tpResult = [] # store the values as an array or data dictionary
    for row in tpRows:
        tpResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    tpData = json.dumps(tpResult, cls=DecimalEncoder) # dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'irrigated_year':irrigated_year,
                'irrigated_value':irrigated_value,
                'irrigated_compare':irrigated_compare,
                'all_eco_year':all_eco_year,
                'all_eco_value':all_eco_value,
                'all_eco_compare':all_eco_compare,
                'non_irrigated_year':non_irrigated_year,
                'non_irrigated_value':non_irrigated_value,
                'aeData': aeData,
                'rfData': rfData,
                'iData': iData,
                'tpData': tpData}
    return render(request, 'productions.html', context) # render the page with the context

# area harvested
def areaharvested(request):
    title = 'Area Harvested' # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2020' # end Date, for Range
    keys = ('location_name','year','value') # json keys
    # Main kpi Area Harvested - Irrigated (2020)
    # the 3 main KPI are the same query but different eco in where statement
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '1'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '1'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        irrigated_year = data.year  # assign year to irrigated_year
        irrigated_value = data.value  # assign value of the query to irrigated_value
        irrigated_compare = data.compare  # assign compare of the query to irrigated_compare
    # Main kpi Area Harvested (2020)
    # the 3 main KPI are the same query but different eco in where statement
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '2'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '2'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        all_eco_year = data.year # assign year of the query to all_eco_year
        all_eco_value = data.value # assign year of the query to all_eco_value
        all_eco_compare = data.compare # assign year of the query to all_eco_compare
    # Main kpi Area Harvested - Rainfed
    # the 3 main KPI are the same query but different eco in where statement
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '0'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '0'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):  # assign values to %s (apples to apples type)
        rainfed_year = data.year # assign year of the query to rainfed_year
        rainfed_value = data.value # assign year of the query to rainfed_value
        rainfed_compare = data.compare # assign year of the query to rainfed_compare

    # All Ecosystem (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    aeCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_pay, ids_location
    aeCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '2'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    aeRows = aeCursor.fetchall() # fetch all data of the executed query
    aeResult = [] # store the values as an array or data dictionary
    for row in aeRows:
        aeResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    aeData = json.dumps(aeResult,cls=DecimalEncoder) # dumps the data as a json

    # Irrigated (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    iCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_pay, ids_location
    iCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '1'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    iRows = iCursor.fetchall() # fetch all data of the executed query
    iResult = [] # store the values as an array or data dictionary
    for row in iRows:
        iResult.append(dict(zip(keys,row)))# append all aeRows data with the keys defined above to a data dictionary
    iData = json.dumps(iResult,cls=DecimalEncoder) # dumps the data as a json

    #Lowland Rainfed (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rfCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_pay, ids_location
    rfCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '0'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rfRows = rfCursor.fetchall() # fetch all data of the executed query
    rfResult = [] # store the values as an array or data dictionary
    for row in rfRows:
        rfResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    rfData = json.dumps(rfResult,cls=DecimalEncoder) # dumps the data as a json

    #Top Provincial Production, 2020 only, All Ecosystem (Chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    tpCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_pay, ids_location, ids_ecosystem
    tpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, SUM("k"."areaHarv") as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "l"."locCode"!=%s AND "k"."locType" = %s AND year = %s AND "k"."eco"= '2'
                        GROUP BY year, location_name
                        ORDER BY value DESC""", [location_code, location_type, year_end]) # assign values to %s (apples to apples type)
    tpRows = tpCursor.fetchall() # fetch all data of the executed query
    tpResult = [] # store the values as an array or data dictionary
    for row in tpRows:
        tpResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    tpData = json.dumps(tpResult, cls=DecimalEncoder) # dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'irrigated_year':irrigated_year,
                'irrigated_value':irrigated_value,
                'irrigated_compare':irrigated_compare,
                'all_eco_year':all_eco_year,
                'all_eco_value':all_eco_value,
                'all_eco_compare':all_eco_compare,
                'rainfed_year':rainfed_year,
                'rainfed_value':rainfed_value,
                'rainfed_compare':rainfed_compare,
                'aeData': aeData,
                'rfData': rfData,
                'iData': iData,
                'tpData': tpData}
    return render(request, 'harvestareas.html', context) # render the page with the context

#estimated yield
def estimatedyield(request):
    title = 'Yield Per Hectare' # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000'  # starting Date, for range
    year_end = '2020' # end Date, for Range
    keys = ('location_name','year','value') # json keys
    # Main kpi Yield - Lowland Irrigated (2020)
    # the 3 main KPI are the same query but different eco in where statement
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '1'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '1'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        irrigated_year = data.year # assign year of the query to irrigated_year
        irrigated_value = data.value # assign value of the query to irrigated_value
        irrigated_compare = data.compare # assign compare of the query to irrigated_compare
    # Main kpi Yield per Hectare (2020)
    # the 3 main KPI are the same query but different eco in where statement
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '2'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '2'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        all_eco_year = data.year # assign year of the query to all_eco_year
        all_eco_value = data.value # assign year of the query to all_eco_value
        all_eco_compare = data.compare # assign year of the query to all_eco_compare
    # Main kpi Yield - Non-Irrigated (2020)
    # the 3 main KPI are the same query but different eco in where statement
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '0'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "ids_location" "l"
                                        			FULL JOIN "kpi_pay" "k" ON "l"."locCode" = "k"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year>= %s AND year<= %s AND "k"."eco"= '0'
                                        			GROUP BY year, location_name, l.id
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):# assign values to %s (apples to apples type)
        non_irrigated_year = data.year # assign year of the query to non_irrigated_year
        non_irrigated_value = data.value # assign year of the query to non_irrigated_value
        non_irrigated_compare = data.compare # assign year of the query to non_irrigated_compare

    # All Ecosystem (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    aeCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # All Ecosystem, Irrigated, Lowland have same query, the only difference is the eco
    # Get location_name, year, value
    # Table used kpi_pay, ids_location, ids_ecosystem
    aeCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '2'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    aeRows = aeCursor.fetchall() # fetch all data of the executed query
    aeResult = [] # store the values as an array or data dictionary
    for row in aeRows:
        aeResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    aeData = json.dumps(aeResult,cls=DecimalEncoder) # dumps the data as a json

    # Irrigated (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    iCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # All Ecosystem, Irrigated, Lowland have same query, the only difference is the eco
    # Get location_name, year, value
    # Table used kpi_pay, ids_location, ids_ecosystem
    iCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '1'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    iRows = iCursor.fetchall() # fetch all data of the executed query
    iResult = [] # store the values as an array or data dictionary
    for row in iRows:
        iResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    iData = json.dumps(iResult,cls=DecimalEncoder) # dumps the data as a json

    #Lowland Rainfed (stacked chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rfCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # All Ecosystem, Irrigated, Lowland have same query, the only difference is the eco
    # Get location_name, year, value
    # Table used kpi_pay, ids_location, ids_ecosystem
    rfCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '0'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rfRows = rfCursor.fetchall() # fetch all data of the executed query
    rfResult = [] # store the values as an array or data dictionary
    for row in rfRows:
        rfResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    rfData = json.dumps(rfResult,cls=DecimalEncoder) # dumps the data as a json

    #Top Provincial Production, 2020 only, All Ecosystem (Chart)
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_pay, ids_location, ids_ecosystem
    tpCursor = connection.cursor() # Connection cursor to postgres
    tpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "l"."locCode"!=%s AND "k"."locType" = %s AND year = '2020' AND "k"."eco"= '2'
                        GROUP BY year, location_name
                        ORDER BY value DESC""", [location_code, location_type]) # assign values to %s (apples to apples type)
    tpRows = tpCursor.fetchall() # fetch all data of the executed query
    tpResult = [] # store the values as an array or data dictionary
    for row in tpRows:
        tpResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    tpData = json.dumps(tpResult, cls=DecimalEncoder) # dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'irrigated_year':irrigated_year,
                'irrigated_value':irrigated_value,
                'irrigated_compare':irrigated_compare,
                'all_eco_year':all_eco_year,
                'all_eco_value':all_eco_value,
                'all_eco_compare':all_eco_compare,
                'non_irrigated_year':non_irrigated_year,
                'non_irrigated_value':non_irrigated_value,
                'non_irrigated_compare':non_irrigated_compare,
                'aeData': aeData,
                'rfData': rfData,
                'iData': iData,
                'tpData': tpData}
    return render (request, 'estyields.html', context) # render the page with the context

# supply and utilization
def supplyUtilization(request):
    title = 'Supply and Utilization' # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2019'# end Date, for Range
    ecosystem = '2' # ecosystem, all ecosystem
    keys = ('location_name','year','value') # json keys
    # Total Supply and Total Utilization
    # Supply and U
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_sua, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."supply", ("t1"."supply" - "t2"."supply") as supply_compare, "t1"."utilization", ("t1"."utilization" - "t2"."utilization") as utilization_compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS supply, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) +
                                                    COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS utilization
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS supply, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) +
                                                    COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS utilization
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        supply_year = data.year # assign year of the query to supply_year
        supply_value = data.supply # assigned supply of the query to supply_ value
        supply_compare = data.supply_compare # assigned supply_compare of the query to supply_supply_compare
        utilization_year = data.year # assign year of the query to utilization_year
        utilization_value = data.utilization # assigned utilization of the query to utilization_value
        utilization_compare = data.utilization_compare # assigned utilization_compare of the query to utilization_compare

    #Total supply (Chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    tsCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_sua, ids_location
    tsCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0) AS value
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    tsRows = tsCursor.fetchall() # fetch all data of the executed query
    tsResult = [] # store the values as an array or data dictionary
    for row in tsRows:
        tsResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    tsData = json.dumps(tsResult, cls=DecimalEncoder) # dumps the data as a json

    #Total utilization (Chart)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    tuCursor = connection.cursor()  # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_sua, ids_location
    tuCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, (COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) +
                        COALESCE("s"."UTEndingStocks", 0)))) AS value
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    tuRows = tuCursor.fetchall() # fetch all data of the executed query
    tuResult = [] # store the values as an array or data dictionary
    for row in tuRows:
        tuResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    tuData = json.dumps(tuResult, cls=DecimalEncoder) # dumps the data as a json

    # Get Supply Sources (Chart - Ranged)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    ssCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, SUBeginningStocks, SUProduction, SUImports
    # Table used kpi_sua, ids_location
    ssCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."SUBeginningStocks", "s"."SUProduction", "s"."SUImports"
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    ssRows = ssCursor.fetchall() # fetch all data of the executed query
    ssResult = [] # store the values as an array or data dictionary
    ssKeys = ('location_name', 'year', 'SUBeginningStocks', 'SUProduction', 'SUImports') # json keys to be used
    for row in ssRows:
        ssResult.append(dict(zip(ssKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    ssData = json.dumps(ssResult, cls=DecimalEncoder) # dumps the data as a json

    # Get Yearly accounts (Chart - Ranged)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    yaCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, UTExports, UTSeeds, UTFeedsWaste, UTProcessing, UTEndingStocks, uttotalnet
    # Table used kpi_sua, ids_location
    yaCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."UTExports", "s"."UTSeeds", "s"."UTFeedsWaste", "s"."UTProcessing", "s"."UTEndingStocks", (COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)) AS UTTotalNet
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end])
    yaRows = yaCursor.fetchall() # fetch all data of the executed query
    yaResult = [] # store the values as an array or data dictionary
    yaKeys = ('location_name', 'year', 'UTExports', 'UTSeeds', 'UTFeedsWaste','UTProcessing','UTEndingStocks','uttotalnet') # json keys to be used
    for row in yaRows:
        yaResult.append(dict(zip(yaKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    yaData = json.dumps(yaResult, cls=DecimalEncoder) # dumps the data as a json

    # Local production, net food disposable and population

    # pass declared variables to templates
    context = { 'title': title,
                'supply_year':supply_year,
                'supply_value':supply_value,
                'supply_compare':supply_compare,
                'utilization_year':utilization_year,
                'utilization_value':utilization_value,
                'utilization_compare':utilization_compare,
                'tsData':tsData,
                'tuData':tuData,
                'ssData':ssData,
                'yaData':yaData,
                }
    return render (request,'supplies.html', context) # render the page with the context

# consumption
def consumption(request):
    title = 'Rice Consumption'  # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2019' # end Date, for Range
    keys = ('location_name', 'year', 'value') # json keys
    # Get FNRI Per Capita (Per Year)
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, per_capita_year, per_kapita_kg_value, per_kapita_kg_compare, per_kapita_gram_value, per_kapita_gram_compare
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables ids_location, kpi_pay ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."kgperyear","t1"."gmperday", ("t1"."kgperyear" - "t2"."kgperyear") as kgperyear_compare, ("t1"."gmperday" - "t2"."gmperday") as gmperday_compare
                                        FROM (		SELECT "c"."id" AS id, "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaKg" AS KgPerYear, "c"."PerCapitaGram" AS GmPerDay
                                        			FROM "kpi_percapita" "c"
                                        			FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                                        			WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "c"."id" AS id, "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaKg" AS KgPerYear, "c"."PerCapitaGram" AS GmPerDay
                                        			FROM "kpi_percapita" "c"
                                        			FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                                        			WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1 """, [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        per_capita_year = data.year  # assign year of the query to per_capita_year
        per_kapita_kg_value = data.kgperyear  # assign kgperyear of the query to per_kapita_kg_value
        per_kapita_kg_compare = data.kgperyear_compare  # assign kgperyear_compare of the query to per_kapita_kg_compare
        per_kapita_gram_value = data.gmperday  # assign gmperday of the query to per_kapita_gram_value
        per_kapita_gram_compare = data.gmperday_compare  # assign gmperday_compare of the query to per_kapita_gram_compare

    # yearly accounts and daily account query cannot be unified due to different output charts
    # Get Yearly accounts (Chart - Ranged)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    ycCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_percapita, ids_location
    ycCursor.execute("""SELECT "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaKg" AS value
                        FROM "kpi_percapita" "c"
                        FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                        WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    ycRows = ycCursor.fetchall() # fetch all data of the executed query
    ycResult = [] # store the values as an array or data dictionary
    for row in ycRows:
        ycResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    ycData = json.dumps(ycResult, cls=DecimalEncoder) # dumps the data as a json

    # Get Daily accounts (Chart - Ranged)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    dcCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_percapita, ids_location
    dcCursor.execute("""SELECT "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaGram" AS value
                        FROM "kpi_percapita" "c"
                        FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                        WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    dcRows = dcCursor.fetchall() # fetch all data of the executed query
    dcResult = [] # store the values as an array or data dictionary
    for row in dcRows:
        dcResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    dcData = json.dumps(dcResult, cls=DecimalEncoder) # dumps the data as a json

    # Local production, net food disposable and population
    # query cannot be unified due to different output charts
    # local production
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, SUBeginningStocks, SUProduction, SUImports
    # Table used kpi_sua, ids_location
    lpCursor = connection.cursor() # Connection cursor to postgres
    lpCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."SUBeginningStocks", "s"."SUProduction", "s"."SUImports"
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    lpRows = lpCursor.fetchall() # fetch all data of the executed query
    lpResult=[] # store the values as an array or data dictionary
    lpKeys = ('location_name','year','SUBeginningStocks','SUProduction','SUImports') # json keys to be used
    for row in lpRows:
        lpResult.append(dict(zip(lpKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    lpData = json.dumps(lpResult, cls=DecimalEncoder) # dumps the data as a json
    # Net Food
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, SUBeginningStocks, SUProduction, SUImports
    # Table used kpi_sua, ids_location
    nfCursor = connection.cursor() # Connection cursor to postgres
    nfCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."UTExports", "s"."UTSeeds", "s"."UTFeedsWaste", "s"."UTProcessing", "s"."UTEndingStocks", (COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)) AS UTTotalNet
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    nfRows = nfCursor.fetchall() # fetch all data of the executed query
    nfResult = [] # store the values as an array or data dictionary
    nfKeys = ('location_name','year','UTExports','UTSeeds','UTFeedsWaste','UTProcessing','UTEndingStocks','uttotalnet') # json keys to be used
    for row in nfRows:
        nfResult.append(dict(zip(nfKeys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    nfData = json.dumps(nfResult, cls=DecimalEncoder) # dumps the data as a json
    # Capitas
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, KgPerYear, GmPerDay
    # Table used kpi_sua, ids_location
    cCursor = connection.cursor() # Connection cursor to postgres
    cCursor.execute(""" SELECT "l"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, "s"."UTPerCapitaKg" As KgPerYear, "s"."UTPerCapitaGram" As GmPerDay
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    cRows = cCursor.fetchall() # fetch all data of the executed query
    cResult = [] # store the values as an array or data dictionary
    cKeys = ('location_name', 'year', 'KgPerYear', 'GmPerDay') # json keys to be used
    for row in cRows:
        cResult.append(dict(zip(cKeys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    cData = json.dumps(cResult, cls=DecimalEncoder) # dumps the data as a json
    # FNRI
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, KgPerYear, GmPerDay
    # Table used kpi_percapita, ids_location
    fnriCursor = connection.cursor() # Connection cursor to postgres
    fnriCursor.execute("""SELECT "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaKg" AS KgPerYear, "c"."PerCapitaGram" AS GmPerDay
                            FROM "kpi_percapita" "c"
                            FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                            WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    fnriRows = fnriCursor.fetchall() # fetch all data of the executed query
    fnriResult = [] # store the values as an array or data dictionary
    fnriKeys = ('location_name', 'year', 'KgPerYear', 'GmPerDay') # json keys to be used
    for row in fnriRows:
        fnriResult.append(dict(zip(fnriKeys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    fnriData = json.dumps(fnriResult, cls=DecimalEncoder) # dumps the data as a json
    # Population
    # Execute query (same Raw query execution as the precedent)
    # Get location_name, year, value
    # Table used kpi_pop, ids_location
    pCursor = connection.cursor() # Connection cursor to postgres
    pCursor.execute("""SELECT "l"."locName" AS location_name, "p"."year" AS year, "p"."population" AS value
                        FROM "kpi_pop" "p"
                        FULL JOIN "ids_location" "l" ON "p"."locCode" = "l"."locCode" AND "p"."locType" = "l"."locType"
                        WHERE "l"."locCode" = %s AND "l"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    pRows = pCursor.fetchall()# fetch all data of the executed query
    pResult = []# store the values as an array or data dictionary
    for row in pRows:
        pResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    pData = json.dumps(pResult, cls=DecimalEncoder)# dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'per_capita_year':per_capita_year,
                'per_kapita_kg_value':per_kapita_kg_value,
                'per_kapita_kg_compare':per_kapita_kg_compare,
                'per_kapita_gram_value':per_kapita_gram_value,
                'per_kapita_gram_compare':per_kapita_gram_compare,
                'ycData':ycData,
                'dcData':dcData,
                'lpData':lpData,
                'nfData':nfData,
                'cData':cData,
                'fnriData':fnriData,
                'pData':pData}
    return render(request,'consumption.html', context) # render the page with the context

# import and export
def importExport(request):
    title = 'Imports and Exports' # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2019' # end Date, for Range
    # Get Main Card Value Import and Export
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, suimports, UTExports, suimports_compare, UTExports_compare
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_sua, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."suimports","t1"."UTExports", ("t1"."suimports" - "t2"."suimports") as suimports_compare, ("t1"."UTExports" - "t2"."UTExports") as UTExports_compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND(("s"."SUImports")/1000::numeric,2) AS SUImports, "s"."UTExports"
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND(("s"."SUImports")/1000::numeric,2) AS SUImports, "s"."UTExports"
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1 """, [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):  # assign values to %s (apples to apples type)
        imexport_year = data.year # assign year of the query to imexport_year
        import_value = data.suimports # assign suimports of the query to import_value
        import_compare = data.suimports_compare # assign suimports_compare of the query to import_compare
        export_value = data.UTExports # assign UTExports of the query to export_value
        export_compare = data.utexports_compare # assign utexports_compare of the query to export_compare

    # Yearly imported rice (chart - range)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    irCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # get location_name, year, SUBeginningStocks, SUImports
    # Used tables kpi_sua, ids_location
    irCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."SUBeginningStocks", "s"."SUProduction", "s"."SUImports"
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    irRows = irCursor.fetchall() # fetch all data of the executed query
    irResult = [] # store the values as an array or data dictionary
    irKeys = ('location_name', 'year', 'SUBeginningStocks', 'SUProduction','SUImports') # json keys to be used
    for row in irRows:
        irResult.append(dict(zip(irKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    irData = json.dumps(irResult, cls=DecimalEncoder) # dumps the data as a json
    # Yearly exported rice (chart - range)
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    erCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    # get location_name, year, UTExports, UTSeeds, UTFeedsWaste, UTProcessing, UTEndingStocks, UTTotalNet
    # Used tables kpi_sua, ids_location
    erCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."UTExports", "s"."UTSeeds", "s"."UTFeedsWaste", "s"."UTProcessing", "s"."UTEndingStocks", (COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)) AS UTTotalNet
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    erRows = erCursor.fetchall() # fetch all data of the executed query
    erResult = [] # store the values as an array or data dictionary
    erKeys = ('location_name', 'year', 'UTExports', 'UTSeeds','UTFeedsWaste','UTProcessing','UTEndingStocks','uttotalnet') # json keys to be used
    for row in erRows:
        erResult.append(dict(zip(erKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    erData = json.dumps(erResult, cls=DecimalEncoder) # dumps the data as a json
    context = { 'title': title,
                'imexport_year':imexport_year,
                'import_value': import_value,
                'import_compare':import_compare,
                'export_value': export_value,
                'export_compare':export_compare,
                'irData': irData,
                'erData': erData}
    return render(request,'impexports.html', context)

# Prices
def prices(request):
    title = 'Rice Market Prices' # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces
    year_start = '2000' # starting Date, for range
    year_end = '2020' # end Date, for Range
    keys = ('location_name', 'year', 'value') # for json dict labels

    # Get Main Card Farmgate Price
    # The 3 Main KPI queries can be unified (Update if necessary)
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, compare
    # Used tables kpi_prices, kpi_pay, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") AS compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice" as value
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice" as value
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        farmgate_year = data.year # assign year to farmgate_year
        farmgate_value = data.value # assign value to farmgate_value
        farmgate_compare = data.compare # assign compare to farmgate_compare
    # Get Main Card Wholesale Price
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, wholesalePrice, WholesaleSpPrice, wholesalePrice_compare, WholesaleSpPrice_compare
    # Used tables kpi_prices, kpi_pay, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."wholesalePrice",  "t1"."WholesaleSpPrice",("t1"."wholesalePrice" - "t2"."wholesalePrice") AS wholesalePrice_compare, ("t1"."WholesaleSpPrice" - "t2"."WholesaleSpPrice") AS WholesaleSpPrice_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."wholesalePrice", "k"."WholesaleSpPrice"
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."wholesalePrice", "k"."WholesaleSpPrice"
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        wholesale_year = data.year # assign year to wholesale_year
        wholesale_price = data.wholesalePrice # assign wholesalePrice to wholesale_price
        wholesale_compare = data.wholesaleprice_compare # assign wholesaleprice_compare to wholesale_compare
        wholesale_spprice = data.WholesaleSpPrice # assign WholesaleSpPrice to wholesale_spprice
        wholesale_spcompare = data.wholesalespprice_compare # assign wholesalespprice_compare to wholesale_spcompare
    # Get Main Card Retail Price
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, retailPrice, retailSpPrice, retailPrice_compare, retailSpPrice_compare
    # Used tables kpi_prices, kpi_pay, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."retailPrice",  "t1"."retailSpPrice",("t1"."retailPrice" - "t2"."retailPrice") AS retailPrice_compare, ("t1"."retailSpPrice" - "t2"."retailSpPrice") AS retailSpPrice_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."retailPrice", "k"."retailSpPrice"
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."retailPrice", "k"."retailSpPrice"
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        retail_year = data.year # assign year to retail_year
        retail_price = data.retailPrice # assign retailPrice to retail_price
        retail_compare = data.retailprice_compare # assign retailprice_compare to retail_compare
        retail_spprice = data.retailSpPrice # assign retailSpPrice to retail_spprice
        retail_spcompare = data.retailspprice_compare # assign retailspprice_compare to retail_spcompare
    # Farmgate prices per year (chart - range)
    # Nominal Price
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    npCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    npCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    npRows = npCursor.fetchall() # fetch all data of the executed query
    npResult = [] # store the values as an array or data dictionary
    for row in npRows:
        npResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    npData = json.dumps(npResult, cls=DecimalEncoder) # dumps the data as a json
    # Farmgate prices per year (chart - range)
    #Real Price
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rpCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    rpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year", ROUND(("k"."farmgatePrice" / "c"."cpiRice") * 100::numeric,2) as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "kpi_cpi" "c" ON "c"."locCode" = "k"."locCode" AND "c"."locType" = "k"."locType" AND "c"."year" = "k"."year"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rpRows = rpCursor.fetchall() # fetch all data of the executed query
    rpResult = [] # store the values as an array or data dictionary
    for row in rpRows:
        rpResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    rpData = json.dumps(rpResult, cls=DecimalEncoder) # dumps the data as a json
    # Wholesale prices, regular and well-milled rice, per year
    # Regular Milled
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rmCursor = connection.cursor()# Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    rmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."wholesalePrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rmRows = rmCursor.fetchall()  # fetch all data of the executed query
    rmResult = []  # store the values as an array or data dictionary
    for row in rmRows:
        rmResult.append(dict(zip(keys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    rmData = json.dumps(rmResult, cls=DecimalEncoder)  # dumps the data as a json
    # Well Milled
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    wmCursor = connection.cursor()# Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    wmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."WholesaleSpPrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    wmRows = wmCursor.fetchall()  # fetch all data of the executed query
    wmResult = []  # store the values as an array or data dictionary
    for row in wmRows:
        wmResult.append(dict(zip(keys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    wmData = json.dumps(wmResult, cls=DecimalEncoder)  # dumps the data as a json
    # Retail prices, regular and well-milled rice, per year
    # Regular Milled
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rrmCursor = connection.cursor()# Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    rrmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."retailPrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rrmRows = rrmCursor.fetchall()  # fetch all data of the executed query
    rrmResult = []  # store the values as an array or data dictionary
    for row in rrmRows:
        rrmResult.append(dict(zip(keys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    rrmData = json.dumps(rrmResult, cls=DecimalEncoder)  # dumps the data as a json
    # Well Milled
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rwmCursor = connection.cursor()# Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    rwmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."retailSpPrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rwmRows = rwmCursor.fetchall()  # fetch all data of the executed query
    rwmResult = []  # store the values as an array or data dictionary
    for row in rwmRows:
        rwmResult.append(dict(zip(keys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    rwmData = json.dumps(rwmResult, cls=DecimalEncoder)  # dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'farmgate_year':farmgate_year,
                'farmgate_value':farmgate_value,
                'farmgate_compare':farmgate_compare,
                'wholesale_year':wholesale_year,
                'wholesale_price':wholesale_price,
                'wholesale_compare':wholesale_compare,
                'wholesale_spprice':wholesale_spprice,
                'wholesale_spcompare':wholesale_spcompare,
                'retail_year':retail_year,
                'retail_price':retail_price,
                'retail_compare':retail_compare,
                'retail_spprice':retail_spprice,
                'retail_spcompare':retail_spcompare,
                'npData':npData,
                'rpData':rpData,
                'rmData':rmData,
                'wmData':wmData,
                'rrmData':rrmData,
                'rwmData':rwmData}
    return render(request,'prices.html', context) # render the page with the context

# valuations
def valuations(request):
    title = 'Gross Value Added' # Declared the title for the page title and tab title
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2020' # end Date, for Range
    keys = ('location_name','year','value') # json keys

    # Maim Card Get Agriculture, Forestry, and Fishing GVA
    # 3 Main Card query can be unified (Update if necessary)
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, percent, value_compare,percent_compare
    # Used tables kpi_value, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value",  "t1"."percent", ("t1"."value" - "t2"."value") AS value_compare, ("t1"."percent" - "t2"."percent") AS percent_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."agriValue")/1000000::numeric,2) AS value, ROUND(("k"."palayValue"/"k"."agriValue")*100::numeric,1) AS percent
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."agriValue")/1000000::numeric,2) AS value, ROUND(("k"."palayValue"/"k"."agriValue")*100::numeric,1) AS percent
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        aff_year = data.year # assign year to aff_year
        aff_price = data.value # assign value to aff_price
        aff_price_compare = data.value_compare # assign value_compare to aff_price_compare
        aff_percent = data.percent # assign percent to aff_percent
        aff_percent_compare = data.percent_compare # assign percent_compare to aff_percent_compare
    # Main Card Get Rice Production Gross Value Added
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, value_compare
    # Used tables kpi_value, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") AS value_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year", ROUND(("k"."palayValue")/10000::numeric,2) as value
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year", ROUND(("k"."palayValue")/10000::numeric,2) as value
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        rpgva_year = data.year # assign year to rpgva_year
        rpgva_price = data.value # assign value to rpgva_price
        rpgva_compare = data.value_compare # assign value_compare to rpgva_compare
    #   Main Card Get Gross Domestic Product
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Used self join to determined whether the compare value is negative or positive to identify if the value rosed or fell
    # get location_name, year, value, percent, value_compare, percent_compare
    # Used tables kpi_value, ids_location
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value","t1"."percent", ("t1"."value" - "t2"."value") AS value_compare, ("t1"."percent" - "t2"."percent") AS percent_compare
                                        FROM (		SELECT "k"."id" AS id,"l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."gdpValue")/1000000::numeric,1) AS value, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,1) AS percent
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id,"l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."gdpValue")/1000000::numeric,1) AS value, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,1) AS percent
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        gdp_year = data.year # assign year to gdp_year
        gdp_price = data.value # assign value to gdp_price
        gdp_price_compare = data.value_compare # assign value_compare to gdp_price_compare
        gdp_percent = data.percent # assign percent to gdp_percent
        gdp_percent_compare = data.percent_compare # assign percent_compare to gdp_percent_compare
    # Rice production and agriculture sector GVA (chart - range)
    # Rice production
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    rpCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    rpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND("k"."palayValue") AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    rpRows = rpCursor.fetchall() # fetch all data of the executed query
    rpResult = [] # store the values as an array or data dictionary
    for row in rpRows:
        rpResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    rpData = json.dumps(rpResult, cls=DecimalEncoder) # dumps the data as a json

    # agriculture sector
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    asCursor = connection.cursor()# Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    asCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND("k"."agriValue") AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    asRows = asCursor.fetchall() # fetch all data of the executed query
    asResult = [] # store the values as an array or data dictionary
    for row in asRows:
        asResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    asData = json.dumps(asResult, cls=DecimalEncoder) # dumps the data as a json

    # Share of rice production to agriculture GDP and total GDP
    # Total GDP Share
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    tgdpsCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    tgdpsCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,2)  AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    tgdpsRows = tgdpsCursor.fetchall() # fetch all data of the executed query
    tgdpsResult = [] # store the values as an array or data dictionary
    for row in tgdpsRows:
        tgdpsResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    tgdpsData = json.dumps(tgdpsResult, cls=DecimalEncoder) # dumps the data as a json

    # Agriculture GDP Share
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    agdpsCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    agdpsCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."palayValue"/"k"."agriValue")*100::numeric,2)  AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end]) # assign values to %s (apples to apples type)
    agdpsRows = agdpsCursor.fetchall() # fetch all data of the executed query
    agdpsResult = [] # store the values as an array or data dictionary
    for row in agdpsRows:
        agdpsResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    agdpsData = json.dumps(agdpsResult, cls=DecimalEncoder) # dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'aff_year':aff_year,
                'aff_price':aff_price,
                'aff_price_compare':aff_price_compare,
                'aff_percent':aff_percent,
                'aff_percent_compare':aff_percent_compare,
                'rpgva_year': rpgva_year,
                'rpgva_price':rpgva_price,
                'rpgva_compare':rpgva_compare,
                'gdp_year':gdp_year,
                'gdp_price':gdp_price,
                'gdp_price_compare':gdp_price_compare,
                'gdp_percent':gdp_percent,
                'gdp_percent_compare':gdp_percent_compare,
                'rpData':rpData,
                'asData':asData,
                'tgdpsData':tgdpsData,
                'agdpsData':agdpsData}
    return render(request, 'valuations.html', context) # render the page with the context

# incomes
def incomes(request):
    title = "Farmer's Income"  # Declared the title for the page title and tab title
    location_code = '999'  # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2019' # end Date, for Range
    ecosystem = '2' # eco, all ecosystem
    keys = ('location_name','year','value') # json keys

    # Main Card Gross, Net Returns
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, gross, net, gross_compare, net_compare
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_pay, kpi_costs, kpi_prices, ids_location
    for data in kpi_pay.objects.raw("""  SELECT "t1"."id", "t1"."location_name", "t1"."year", TO_CHAR(("t1"."gross"),'999,999') AS gross, TO_CHAR(("t1"."net"),'999,999') AS net, ("t1"."gross" - "t2"."gross") AS gross_compare, ("t1"."net" - "t2"."net") AS net_compare
                                        FROM (		SELECT "c"."id" AS id, "l"."locName" AS location_name, "y"."year" AS year, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice")) AS gross, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice") - "c"."costProduction") AS net
                                        			FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                                        				FROM "kpi_pay"
                                        				WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= '2019'
                                        				GROUP BY "locCode", "locType", "year", "eco") "y"
                                        			FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                                        			FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                                        			FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                                        			WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<='2019'
                                        			ORDER BY "y"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "c"."id" AS id, "l"."locName" AS location_name, "y"."year" AS year, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice")) AS gross, ROUND((("y"."yieldest") * 1000) * ("p"."farmgatePrice") - "c"."costProduction") AS net
                                        			FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                                        				FROM "kpi_pay"
                                        				WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= '2019'
                                        				GROUP BY "locCode", "locType", "year", "eco") "y"
                                        			FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                                        			FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                                        			FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                                        			WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<='2019'
                                        			ORDER BY "y"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        """, [location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start,location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start]): # assign values to %s (apples to apples type)

        gr_year = data.year # assign year of the query to gr_year
        gr_price = data.gross # assign gross of the query to gr_price
        gr_compare = data.gross_compare # assign gross_compare of the query to gr_compare
        nr_year = data.year # assign year of the year to nr_year
        nr_price = data.net # assign year of the net to nr_price
        nr_compare = data.net_compare # assign net_compare of the query to nr_compare

    # Main Card Production Cost
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value, value_compare
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_costs, ids_location
    for data in kpi_pay.objects.raw("""SELECT "t1"."id", "t1"."location_name", "t1"."year", TO_CHAR(("t1"."value"),'999,999') AS value, ("t1"."value" - "t2"."value") AS value_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."costProduction")) AS value
                                        			FROM "kpi_costs" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year >= %s AND year <= %s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."costProduction")) AS value
                                        			FROM "kpi_costs" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year >= %s AND year <= %s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]): # assign values to %s (apples to apples type)
        pc_year = data.year # assign year of the query to pc_year
        pc_price = data.value # assign value of the query to pc_price
        pc_compare = data.value_compare # assign value_compare of the query to pc_compare
    # Yearly average gross returns on rice production
    # Average Gross Return
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    agrCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    agrCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, (("y"."yieldest") * 1000) * ("p"."farmgatePrice") AS value
                            FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                            	FROM "kpi_pay"
                            	WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= %s
                            	GROUP BY "locCode", "locType", "year", "eco") "y"
                            FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                            FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                            WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<=%s""", [location_code, location_type, ecosystem, year_start, year_end, location_code, location_type, ecosystem, year_start, year_end]) # assign values to %s (apples to apples type)
    agrRows = agrCursor.fetchall() # fetch all data of the executed query
    agrResult = [] # store the values as an array or data dictionary
    for row in agrRows:
        agrResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    agrData = json.dumps(agrResult, cls=DecimalEncoder) # dumps the data as a json

    # Average Costs
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    acCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    acCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."costProduction" AS value
                        FROM "kpi_costs" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year >= %s AND year <= %s""", [location_code, location_type, year_start, year_end])
    acRows = acCursor.fetchall() # fetch all data of the executed query
    acResult = [] # store the values as an array or data dictionary
    for row in acRows:
        acResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    acData = json.dumps(acResult, cls=DecimalEncoder) # dumps the data as a json

    # Average Net returns
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    anrCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    anrCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, (("y"."yieldest") * 1000) * ("p"."farmgatePrice") - "c"."costProduction" AS value
                        FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                        	FROM "kpi_pay"
                        	WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= %s
                        	GROUP BY "locCode", "locType", "year", "eco") "y"
                        FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                        FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                        FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                        WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<=%s""", [location_code, location_type, ecosystem, year_start, year_end, location_code, location_type, ecosystem, year_start, year_end]) # assign values to %s (apples to apples type)
    anrRows = anrCursor.fetchall() # fetch all data of the executed query
    anrResult = [] # store the values as an array or data dictionary
    for row in anrRows:
        anrResult.append(dict(zip(keys,row))) # append all aeRows data with the keys defined above to a data dictionary
    anrData = json.dumps(anrResult, cls=DecimalEncoder) # dumps the data as a json

    # Average costs and net returns on rice production by region
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    acnrCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    acnrCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, ROUND("c"."costProduction") AS costs, ROUND((((("y"."yieldest") * 1000) * ("p"."farmgatePrice")) - "c"."costProduction")) AS net
                        FROM (SELECT "locCode", "locType", "year", "eco", AVG("yieldEst") AS yieldEst
                        	FROM "kpi_pay"
                        	WHERE "locCode" != '999' AND "locType" ='1' AND eco='2' AND "year"= '2019'
                        	GROUP BY "locCode", "locType", "year", "eco") "y"
                        FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                        FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                        FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                        WHERE "y"."locCode"!='999' AND "y"."locType" ='1' AND "y"."eco" ='2'  AND  "y"."year"='2019'""", [location_code, location_type, ecosystem, year_start, year_end, location_code, location_type, ecosystem, year_start, year_end]) # assign values to %s (apples to apples type)
    acnrRows = acnrCursor.fetchall() # fetch all data of the executed query
    acnrResult = [] # store the values as an array or data dictionary
    acnrKeys = ('location_name','year','costs','net') #keys to be used
    for row in acnrRows:
        acnrResult.append(dict(zip(acnrKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    acnrData = json.dumps(acnrResult, cls=DecimalEncoder) # dumps the data as a json
    # pass declared variables to templates
    context = { 'title': title,
                'gr_year':gr_year,
                'gr_price':gr_price,
                'gr_compare':gr_compare,
                'nr_year':nr_year,
                'nr_price':nr_price,
                'nr_compare':nr_compare,
                'pc_year':pc_year,
                'pc_price':pc_price,
                'pc_compare':pc_compare,
                'agrData':agrData,
                'acData':acData,
                'anrData':anrData,
                'acnrData':acnrData}
    return render(request, 'incomes.html', context) # render the page with the context

# yield and production cost
def yieldcost(request):
    title = 'Yield and Production Cost'
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2019' # end Date, for Range
    ecosystem = '2' # type of eco in ids_ecosystem, All ecosystem
    yieldEst = '4' # yield indicator
    # Main kpi Yield per Hectare
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_pay, kpi_pay, ids_location, ids_ecosystem
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id" AS id, "t1"."location_name", "t1"."year", ("t1"."value") AS value, ("t1"."value" - "t2"."value") AS compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "kpi_pay" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = '999' AND "k"."locType" = '2' AND year >='2000' AND year <='2019' AND "k"."eco" = '2'
                                        			GROUP BY "l"."id", "l"."locName", year
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) AS value
                                        			FROM "kpi_pay" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = '999' AND "k"."locType" = '2' AND year >='2000' AND year <='2019' AND "k"."eco" = '2'
                                        			GROUP BY "l"."locName", year
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."location_name" = "t2"."location_name"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]): # assign values to %s (apples to apples type)
        yph_year = data.year # assign year to yph_year
        yph_value = data.value # assign value to yph_value
        yph_compare = data.compare # assign compare to yph_compare

    # Unit Cost
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
    # Used tables kpi_costs, ids_location, kpi_pay, ids_location, ids_ecosystem
    for data in kpi_pay.objects.raw("""SELECT "t1"."id" AS id, "t1"."location_name", "t1"."year", ("t1"."value") AS value, ("t1"."value" - "t2"."value") AS compare
                                        FROM (		SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("x"."costProduction"/AVG("k"."yieldEst"))/1000::numeric,2) AS value
                                        			FROM  ( SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."costProduction","k"."locCode", "k"."locType"
                                        					FROM "kpi_costs" "k"
                                        					FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        					WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year" >= %s AND "k"."year" <= %s
                                        					ORDER BY year DESC
                                        					LIMIT 1
                                        			) "x"
                                        			FULL JOIN "kpi_pay" "k" ON "k"."locType" = "x"."locType" AND "k"."locCode" = "x"."locCode"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND "k"."year" >=%s AND "k"."year" <=%s AND "k"."eco" = %s
                                        			GROUP BY "l"."id", "l"."locName", "k"."year", "k"."locCode", "k"."locType","x"."costProduction"
                                        			ORDER BY year DESC
                                        			LIMIT 2
                                        			) "t1"
                                        INNER JOIN (SELECT "l"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, ROUND(("x"."costProduction"/AVG("k"."yieldEst"))/1000::numeric,2) AS value
                                        			FROM  ( SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."costProduction","k"."locCode", "k"."locType"
                                        					FROM "kpi_costs" "k"
                                        					FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        					WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year" >= %s AND "k"."year" <= %s
                                        					ORDER BY year DESC
                                        					LIMIT 1
                                        			) "x"
                                        			FULL JOIN "kpi_pay" "k" ON "k"."locType" = "x"."locType" AND "k"."locCode" = "x"."locCode"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                                        			WHERE "k"."locCode" = %s AND "k"."locType" = %s AND "k"."year" >=%s AND "k"."year" <=%s AND "k"."eco" = %s
                                        			GROUP BY "l"."id", "l"."locName", "k"."year", "k"."locCode", "k"."locType","x"."costProduction"
                                        			ORDER BY year DESC
                                        			LIMIT 2
                                        			) "t2" ON "t1"."location_name" = "t2"."location_name"
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end, ecosystem,location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end, ecosystem]): # assign values to %s (apples to apples type)
        uc_year = data.year # assign year to irrigated_year
        uc_value = data.value # assign value of the query to irrigated_value
        uc_compare = data.compare # assign compare of the query to irrigated_compare

    # Average fertilizer use by N-P-K component, high-yielding provinces
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    npkCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    npkCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, "n"."nperha" As n_value, "n"."pperha" AS p_value, "n"."kperha" AS k_value
                        FROM (  SELECT "locCode", "locType", "year", "eco", AVG("yieldEst") as yieldEst
                        		FROM kpi_pay
                        		WHERE "locType"=%s AND "eco"=%s AND "year" = %s AND "yieldEst">=%s
                        		GROUP BY "locCode", "locType", "year", "eco"
                        	) "y"
                        FULL JOIN "kpi_npk" "n" ON "y"."locCode" = "n"."locCode" AND "y"."locType" = "n"."locType" AND "y"."year" = "n"."year" AND "y"."eco" = "n"."eco"
                        FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                        WHERE "y"."locType" = %s AND "y"."eco"=%s AND "y"."year" = %s AND "y"."locCode" != '999'
                        ORDER BY location_name """, [location_type, ecosystem, year_end, yieldEst, location_type, ecosystem, year_end]) # assign values to %s (apples to apples type)
    npkRows = npkCursor.fetchall() # fetch all data of the executed query
    npkResult = [] # store the values as an array or data dictionary
    npkKeys = ('location_name', 'year','n_value','p_value','k_value') #keys to be used
    for row in npkRows:
        npkResult.append(dict(zip(npkKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    npkData = json.dumps(npkResult, cls=DecimalEncoder) # dumps the data as a json

    # Percentage breakdown of costs of rice production, Philippines
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    pbcCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    pbcCursor.execute("""   SELECT "locName", "year", "materialInputs", "hiredLabor", "OFELabor", "machine", "irrigation", "landRent", "interestCapital", "otherInputs"
                            FROM "kpi_costscom"
                            WHERE "year" >= '2009' AND "year" <= '2019' """, [year_start, year_end]) # assign values to %s (apples to apples type)
    pbcRows = pbcCursor.fetchall()  # fetch all data of the executed query
    pbcResult = [] # store the values as an array or data dictionary
    pbcKeys = ('locName', 'year','materialInputs','hiredLabor','OFELabor','machine','irrigation','landRent','interestCapital','otherInputs') #keys to be used
    for row in pbcRows:
        pbcResult.append(dict(zip(pbcKeys,row)))  # append all aeRows data with the keys defined above to a data dictionary
    pbcData = json.dumps(pbcResult, cls=DecimalEncoder) # dumps the data as a json

    # Scatter Table Yield and unit cost of top rice-producing provinces, 2017
    # Query method for json output (the precedent query didnt work for json output), This method is longer to code for outputing single type of data like in the main KPI Cards
    yuCursor = connection.cursor() # Connection cursor to postgres
    # Execute query (same Raw query execution as the precedent)
    yuCursor.execute("""SELECT ROUND(("k"."yieldEst")/1000::numeric,2) as x, "k"."costperkg" as y, "l"."locName" AS location_name
                        FROM "rb_ycost" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locType" = '2' AND "k"."year" = '2017' """)
    yuRows = yuCursor.fetchall()# fetch all data of the executed query
    yuResult = []# store the values as an array or data dictionary
    yuKeys = ('x','y','location_name')#keys to be used
    for row in yuRows:
        yuResult.append(dict(zip(yuKeys,row))) # append all aeRows data with the keys defined above to a data dictionary
    yuData = json.dumps(yuResult, cls=DecimalEncoder)# dumps the data as a json
    context = { 'title': title,
                'yph_year':yph_year,
                'yph_value':yph_value,
                'yph_compare':yph_compare,
                'uc_year':uc_year,
                'uc_value':uc_value,
                'uc_compare':uc_compare,
                'npkData':npkData,
                'pbcData':pbcData,
                'yuData':yuData,}
    return render(request, 'yieldcost.html', context)
