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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]):
        rp_year = data.year # assign year value of the query to rp_year
        rp_value = data.value # assign value value of the query to rp_value
        rp_compare = data.compare # assign compare value of the query to rp_compare
    # Area Harvested
    # kpi_pay is a stand in model to make the raw sql query to work without a problem, doesnt affect the query if another model was used
    # Get the location_name, year, value and compare value of Area Harvested
    # Used self join to determined whether the comapare value is negative or positive to identify if the value rosed or fell
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]):
        ah_year = data.year
        ah_value = data.value
        ah_compare = data.compare

    # Yield per hectare
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]):
        yph_year = data.year
        yph_value = data.value
        yph_compare = data.compare

    # Suppy
    for data in kpi_pay.objects.raw("""SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        supply_value = data.value
        supply_compare = data.compare

    # Utilization
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) +
                                        			COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) +
                                        			COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        utilization_value = data.value
        utilization_compare = data.compare
    # locally Produced and Net Food Disposable
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        lp_value = data.suproduction
        lp_compare = data.suproduction_compare
        nf_value = data.uttotalnet
        nf_compare = data.uttotalnet_compare

    # Import and Export
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
                                                    """, [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        import_value = data.suimports
        import_compare = data.suimports_compare
        export_value = data.UTExports
        export_compare = data.utexports_compare

    # Farmgate Price, Wholesale Price, Retail Price
    for data in kpi_pay.objects.raw("""SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."farmgatePrice", "t1"."wholesalePrice", "t1"."retailPrice", ("t1"."farmgatePrice" - "t2"."farmgatePrice") AS farmgaterice_compare, ("t1"."wholesalePrice" - "t2"."wholesalePrice") AS wholesalePrice_compare, ("t1"."retailPrice" - "t2"."retailPrice") AS retailPrice_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice", "k"."wholesalePrice", "k"."retailPrice"
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice", "k"."wholesalePrice", "k"."retailPrice"
                                        			FROM "kpi_prices" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "k"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                        """, [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        farmgate_value = data.farmgatePrice
        farmgate_compare = data.farmgaterice_compare
        wholesale_value = data.wholesalePrice
        wholesale_compare = data.wholesaleprice_compare
        retail_value = data.retailPrice
        retail_compare = data.retailprice_compare

    # Gross Value Added, Share to Agri. GVA, Share to Nat. GDP
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."gva",  "t1"."gvashare",  "t1"."gdpshare", ("t1"."gva" - "t2"."gva") AS gva_compare
                                        FROM (		SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year", ROUND(("k"."palayValue")/1000::numeric,2) as gva, ROUND((("k"."palayValue"/"k"."agriValue")*100)::numeric,1) AS gvashare, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,2) AS gdpshare
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "k"."id" AS id, "l"."locName" AS location_name, "k"."year", ROUND(("k"."palayValue")/1000::numeric,2) as gva, ROUND((("k"."palayValue"/"k"."agriValue")*100)::numeric,1) AS gvashare, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,2) AS gdpshare
                                        			FROM "kpi_value" "k"
                                        			FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                                        			WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s
                                        			ORDER BY "k"."year" DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1
                                                    """, [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        gva_value = data.gva
        gva_compare = data.gva_compare
        gvashare_value = data.gvashare
        gdpshare_value = data.gdpshare
    # Net Returns, Gross Return
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
                                        """, [location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start,location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start]):
        gr_value = data.gross
        gr_compare = data.gross_compare
        nr_value = data.net
        nr_compare = data.net_compare
        # Unit Cost
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
                                            LIMIT 1""", [location_code, location_type, year_start ,location_code, location_type, year_start, ecosystem,location_code, location_type, year_start,location_code, location_type, year_start, ecosystem]):
            uc_value = data.value
            uc_compare = data.compare
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
                'retail_value':retail_value,
                'retail_compare':retail_compare,
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
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2020'
    year = '2020'
    keys = ('location_name','year','value')
    # Main kpi Production - Irrigated (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        irrigated_year = data.year
        irrigated_value = data.value
        irrigated_compare = data.compare
    # Main kpi Production - Rice Production (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        all_eco_year = data.year
        all_eco_value = data.value
        all_eco_compare = data.compare
    # Main kpi Production - Production - Non-Irrigated (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        non_irrigated_year = data.year
        non_irrigated_value = data.value
        non_irrigated_compare = data.compare
    # All Ecosystem (stacked chart)
    aeCursor = connection.cursor()
    aeCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '2'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    aeRows = aeCursor.fetchall()
    aeResult = []
    for row in aeRows:
        aeResult.append(dict(zip(keys,row)))
    aeData = json.dumps(aeResult,cls=DecimalEncoder)

    # Irrigated (stacked chart)
    iCursor = connection.cursor()
    iCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '1'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    iRows = iCursor.fetchall()
    iResult = []
    for row in iRows:
        iResult.append(dict(zip(keys,row)))
    iData = json.dumps(iResult,cls=DecimalEncoder)

    #Lowland Rainfed (stacked chart)
    rfCursor = connection.cursor()
    rfCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '0'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    rfRows = rfCursor.fetchall()
    rfResult = []
    for row in rfRows:
        rfResult.append(dict(zip(keys,row)))
    rfData = json.dumps(rfResult,cls=DecimalEncoder)

    #Top Provincial Production, 2020 only, All Ecosystem (Chart)
    tpCursor = connection.cursor()
    tpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."estProduction"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "l"."locCode"!=%s AND "k"."locType" = %s AND year = %s AND "k"."eco"= '2'
                        GROUP BY year, location_name
                        ORDER BY value DESC""", [location_code, location_type, year])
    tpRows = tpCursor.fetchall()
    tpResult = []
    for row in tpRows:
        tpResult.append(dict(zip(keys,row)))
    tpData = json.dumps(tpResult, cls=DecimalEncoder)

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
    return render(request, 'productions.html', context)

# area harvested
def areaharvested(request):
    title = 'Area Harvested'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2020'
    keys = ('location_name','year','value')
    # Main kpi Area Harvested - Irrigated (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        irrigated_year = data.year
        irrigated_value = data.value
        irrigated_compare = data.compare
    # Main kpi Area Harvested (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        all_eco_year = data.year
        all_eco_value = data.value
        all_eco_compare = data.compare
    # Main kpi Area Harvested - Rainfed
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        rainfed_year = data.year
        rainfed_value = data.value
        rainfed_compare = data.compare
    # All Ecosystem (stacked chart)
    aeCursor = connection.cursor()
    aeCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '2'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    aeRows = aeCursor.fetchall()
    aeResult = []
    for row in aeRows:
        aeResult.append(dict(zip(keys,row)))
    aeData = json.dumps(aeResult,cls=DecimalEncoder)

    # Irrigated (stacked chart)
    iCursor = connection.cursor()
    iCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '1'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    iRows = iCursor.fetchall()
    iResult = []
    for row in iRows:
        iResult.append(dict(zip(keys,row)))
    iData = json.dumps(iResult,cls=DecimalEncoder)

    #Lowland Rainfed (stacked chart)
    rfCursor = connection.cursor()
    rfCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(SUM("k"."areaHarv"/1000000)::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '0'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    rfRows = rfCursor.fetchall()
    rfResult = []
    for row in rfRows:
        rfResult.append(dict(zip(keys,row)))
    rfData = json.dumps(rfResult,cls=DecimalEncoder)

    #Top Provincial Production, 2020 only, All Ecosystem (Chart)
    tpCursor = connection.cursor()
    tpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, SUM("k"."areaHarv") as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "l"."locCode"!=%s AND "k"."locType" = %s AND year = %s AND "k"."eco"= '2'
                        GROUP BY year, location_name
                        ORDER BY value DESC""", [location_code, location_type, year_end])
    tpRows = tpCursor.fetchall()
    tpResult = []
    for row in tpRows:
        tpResult.append(dict(zip(keys,row)))
    tpData = json.dumps(tpResult, cls=DecimalEncoder)

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
    return render(request, 'harvestareas.html', context)

#estimated yield
def estimatedyield(request):
    title = 'Yield Per Hectare'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2020'
    keys = ('location_name','year','value')
    # Main kpi Yield - Lowland Irrigated (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        irrigated_year = data.year
        irrigated_value = data.value
        irrigated_compare = data.compare
    # Main kpi Yield per Hectare (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        all_eco_year = data.year
        all_eco_value = data.value
        all_eco_compare = data.compare
    # Main kpi Yield - Non-Irrigated (2020)
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        non_irrigated_year = data.year
        non_irrigated_value = data.value
        non_irrigated_compare = data.compare

    # All Ecosystem (stacked chart)
    aeCursor = connection.cursor()
    aeCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '2'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    aeRows = aeCursor.fetchall()
    aeResult = []
    for row in aeRows:
        aeResult.append(dict(zip(keys,row)))
    aeData = json.dumps(aeResult,cls=DecimalEncoder)

    # Irrigated (stacked chart)
    iCursor = connection.cursor()
    iCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '1'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    iRows = iCursor.fetchall()
    iResult = []
    for row in iRows:
        iResult.append(dict(zip(keys,row)))
    iData = json.dumps(iResult,cls=DecimalEncoder)

    #Lowland Rainfed (stacked chart)
    rfCursor = connection.cursor()
    rfCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "k"."locCode"= %s AND "k"."locType"= %s AND "k"."year">= %s AND "k"."year"<= %s AND "k"."eco"= '0'
                        GROUP BY year, location_name""", [location_code, location_type, year_start, year_end])
    rfRows = rfCursor.fetchall()
    rfResult = []
    for row in rfRows:
        rfResult.append(dict(zip(keys,row)))
    rfData = json.dumps(rfResult,cls=DecimalEncoder)

    #Top Provincial Production, 2020 only, All Ecosystem (Chart)
    tpCursor = connection.cursor()
    tpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(AVG("k"."yieldEst")::numeric,2) as value
                        FROM "kpi_pay" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        FULL JOIN "ids_ecosystem" "e" ON "k"."eco" = "e"."eco"
                        WHERE "l"."locCode"!=%s AND "k"."locType" = %s AND year = '2020' AND "k"."eco"= '2'
                        GROUP BY year, location_name
                        ORDER BY value DESC""", [location_code, location_type])
    tpRows = tpCursor.fetchall()
    tpResult = []
    for row in tpRows:
        tpResult.append(dict(zip(keys,row)))
    tpData = json.dumps(tpResult, cls=DecimalEncoder)

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
    return render (request, 'estyields.html', context)

# supply and utilization
def supplyUtilization(request):
    title = 'Supply and Utilization'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2019'
    ecosystem = '2'
    keys = ('location_name','year','value')
    # Total Supply (2019)
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        supply_year = data.year
        supply_value = data.value
        supply_compare = data.compare

    # Total Utilization (2019)
    for data in kpi_pay.objects.raw(""" SELECT "t1"."id", "t1"."location_name", "t1"."year", "t1"."value", ("t1"."value" - "t2"."value") as compare
                                        FROM (		SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) +
                                        			COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t1"
                                        INNER JOIN (SELECT "s"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, ROUND((COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) +
                                        			COALESCE("s"."UTEndingStocks", 0))))/1000::numeric,2) AS value
                                        			FROM "kpi_sua" "s"
                                        			FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                                        			WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<= %s
                                        			ORDER BY year DESC
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        utilization_year = data.year
        utilization_value = data.value
        utilization_compare = data.compare
    #Total supply (Chart)
    tsCursor = connection.cursor()
    tsCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0) AS value
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end])
    tsRows = tsCursor.fetchall()
    tsResult = []
    for row in tsRows:
        tsResult.append(dict(zip(keys,row)))
    tsData = json.dumps(tsResult, cls=DecimalEncoder)

    #Total utilization (Chart)
    tuCursor = connection.cursor()
    tuCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, (COALESCE("s"."UTExports", 0) + (COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0)) + ((COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) +
                        COALESCE("s"."UTEndingStocks", 0)))) AS value
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end])
    tuRows = tuCursor.fetchall()
    tuResult = []
    for row in tuRows:
        tuResult.append(dict(zip(keys,row)))
    tuData = json.dumps(tuResult, cls=DecimalEncoder)

    # Get Supply Sources (Chart - Ranged)
    ssCursor = connection.cursor()
    ssCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."SUBeginningStocks", "s"."SUProduction", "s"."SUImports"
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end])
    ssRows = ssCursor.fetchall()
    ssResult = []
    ssKeys = ('location_name', 'year', 'SUBeginningStocks', 'SUProduction', 'SUImports')
    for row in ssRows:
        ssResult.append(dict(zip(ssKeys,row)))
    ssData = json.dumps(ssResult, cls=DecimalEncoder)

    # Get Yearly accounts (Chart - Ranged)
    yaCursor = connection.cursor()
    yaCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."UTExports", "s"."UTSeeds", "s"."UTFeedsWaste", "s"."UTProcessing", "s"."UTEndingStocks", (COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)) AS UTTotalNet
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>= %s AND year<=%s """, [location_code, location_type, year_start, year_end])
    yaRows = yaCursor.fetchall()
    yaResult = []
    yaKeys = ('location_name', 'year', 'UTExports', 'UTSeeds', 'UTFeedsWaste','UTProcessing','UTEndingStocks','uttotalnet')
    for row in yaRows:
        yaResult.append(dict(zip(yaKeys,row)))
    yaData = json.dumps(yaResult, cls=DecimalEncoder)

    # Local production, net food disposable and population

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
    return render (request,'supplies.html', context)

# consumption
def consumption(request):
    title = 'Rice Consumption'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2019'
    keys = ('location_name', 'year', 'value')
    # Get FNRI Per Capita (Per Year)
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1 """, [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        per_capita_year = data.year
        per_kapita_kg_value = data.kgperyear
        per_kapita_kg_compare = data.kgperyear_compare
        per_kapita_gram_value = data.gmperday
        per_kapita_gram_compare = data.gmperday_compare
    # Get Yearly accounts (Chart - Ranged)
    ycCursor = connection.cursor()
    ycCursor.execute("""SELECT "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaKg" AS value
                        FROM "kpi_percapita" "c"
                        FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                        WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    ycRows = ycCursor.fetchall()
    ycResult = []
    for row in ycRows:
        ycResult.append(dict(zip(keys,row)))
    ycData = json.dumps(ycResult, cls=DecimalEncoder)

    # Get Daily accounts (Chart - Ranged)
    dcCursor = connection.cursor()
    dcCursor.execute("""SELECT "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaGram" AS value
                        FROM "kpi_percapita" "c"
                        FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                        WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    dcRows = dcCursor.fetchall()
    dcResult = []
    for row in dcRows:
        dcResult.append(dict(zip(keys,row)))
    dcData = json.dumps(dcResult, cls=DecimalEncoder)
    # Local production, net food disposable and population
    # local production
    lpCursor = connection.cursor()
    lpCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."SUBeginningStocks", "s"."SUProduction", "s"."SUImports"
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    lpRows = lpCursor.fetchall()
    lpResult=[]
    lpKeys = ('location_name','year','SUBeginningStocks','SUProduction','SUImports')
    for row in lpRows:
        lpResult.append(dict(zip(lpKeys,row)))
    lpData = json.dumps(lpResult, cls=DecimalEncoder)
    # Net Food
    nfCursor = connection.cursor()
    nfCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."UTExports", "s"."UTSeeds", "s"."UTFeedsWaste", "s"."UTProcessing", "s"."UTEndingStocks", (COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)) AS UTTotalNet
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    nfRows = nfCursor.fetchall()
    nfResult = []
    nfKeys = ('location_name','year','UTExports','UTSeeds','UTFeedsWaste','UTProcessing','UTEndingStocks','uttotalnet')
    for row in nfRows:
        nfResult.append(dict(zip(nfKeys,row)))
    nfData = json.dumps(nfResult, cls=DecimalEncoder)
    # Capitas
    cCursor = connection.cursor()
    cCursor.execute(""" SELECT "l"."id" AS id, "l"."locName" AS location_name, "s"."year" AS year, "s"."UTPerCapitaKg" As KgPerYear, "s"."UTPerCapitaGram" As GmPerDay
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    cRows = cCursor.fetchall()
    cResult = []
    cKeys = ('location_name', 'year', 'KgPerYear', 'GmPerDay')
    for row in cRows:
        cResult.append(dict(zip(cKeys,row)))
    cData = json.dumps(cResult, cls=DecimalEncoder)
    # FNRI
    fnriCursor = connection.cursor()
    fnriCursor.execute("""SELECT "l"."locName" AS location_name, "c"."year" AS year, "c"."PerCapitaKg" AS KgPerYear, "c"."PerCapitaGram" AS GmPerDay
                            FROM "kpi_percapita" "c"
                            FULL JOIN "ids_location" "l" ON "c"."locCode" = "l"."locCode" AND "c"."locType" = "l"."locType"
                            WHERE "c"."locCode" = %s AND "c"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    fnriRows = fnriCursor.fetchall()
    fnriResult = []
    fnriKeys = ('location_name', 'year', 'KgPerYear', 'GmPerDay')
    for row in fnriRows:
        fnriResult.append(dict(zip(fnriKeys,row)))
    fnriData = json.dumps(fnriResult, cls=DecimalEncoder)
    # Population
    pCursor = connection.cursor()
    pCursor.execute("""SELECT "l"."locName" AS location_name, "p"."year" AS year, "p"."population" AS value
                        FROM "kpi_pop" "p"
                        FULL JOIN "ids_location" "l" ON "p"."locCode" = "l"."locCode" AND "p"."locType" = "l"."locType"
                        WHERE "l"."locCode" = %s AND "l"."locType" = %s AND year>=%s AND year<=%s """, [location_code, location_type, year_start, year_end])
    pRows = pCursor.fetchall()
    pResult = []
    for row in pRows:
        pResult.append(dict(zip(keys,row)))
    pData = json.dumps(pResult, cls=DecimalEncoder)
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
    return render(request,'consumption.html', context)

# import and export
def importExport(request):
    title = 'Imports and Exports'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2019'
    # Get Main Card Value Import and Export
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1 """, [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        imexport_year = data.year
        import_value = data.suimports
        import_compare = data.suimports_compare
        export_value = data.UTExports
        export_compare = data.utexports_compare

    # Yearly imported rice (chart - range)
    irCursor = connection.cursor()
    irCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."SUBeginningStocks", "s"."SUProduction", "s"."SUImports"
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s """, [location_code, location_type, year_start, year_end])
    irRows = irCursor.fetchall()
    irResult = []
    irKeys = ('location_name', 'year', 'SUBeginningStocks', 'SUProduction','SUImports')
    for row in irRows:
        irResult.append(dict(zip(irKeys,row)))
    irData = json.dumps(irResult, cls=DecimalEncoder)
    # Yearly exported rice (chart - range)
    erCursor = connection.cursor()
    erCursor.execute("""SELECT "l"."locName" AS location_name, "s"."year" AS year, "s"."UTExports", "s"."UTSeeds", "s"."UTFeedsWaste", "s"."UTProcessing", "s"."UTEndingStocks", (COALESCE("s"."SUBeginningStocks", 0) + COALESCE("s"."SUProduction", 0) + COALESCE("s"."SUImports", 0)) - (COALESCE("s"."UTExports", 0) + COALESCE("s"."UTSeeds", 0) + COALESCE("s"."UTFeedsWaste", 0) + COALESCE("s"."UTProcessing", 0) + COALESCE("s"."UTEndingStocks", 0)) AS UTTotalNet
                        FROM "kpi_sua" "s"
                        FULL JOIN "ids_location" "l" ON "s"."locCode" = "l"."locCode" AND "s"."locType" = "l"."locType"
                        WHERE "s"."locCode" = %s AND "s"."locType" = %s AND year >= %s AND year <= %s """, [location_code, location_type, year_start, year_end])
    erRows = erCursor.fetchall()
    erResult = []
    erKeys = ('location_name', 'year', 'UTExports', 'UTSeeds','UTFeedsWaste','UTProcessing','UTEndingStocks','uttotalnet')
    for row in erRows:
        erResult.append(dict(zip(erKeys,row)))
    erData = json.dumps(erResult, cls=DecimalEncoder)
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
    title = 'Rice Market Prices'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2020'
    keys = ('location_name', 'year', 'value')

    # Get Main Card Farmgate Price
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        farmgate_year = data.year
        farmgate_value = data.value
        farmgate_compare = data.compare
    # Get Main Card Wholesale Price
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        wholesale_year = data.year
        wholesale_price = data.wholesalePrice
        wholesale_compare = data.wholesaleprice_compare
        wholesale_spprice = data.WholesaleSpPrice
        wholesale_spcompare = data.wholesalespprice_compare
    # Get Main Card Retail Price
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        retail_year = data.year
        retail_price = data.retailPrice
        retail_compare = data.retailprice_compare
        retail_spprice = data.retailSpPrice
        retail_spcompare = data.retailspprice_compare
    # Farmgate prices per year (chart - range)
    # Nominal Price
    npCursor = connection.cursor()
    npCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."farmgatePrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end])
    npRows = npCursor.fetchall()
    npResult = []
    for row in npRows:
        npResult.append(dict(zip(keys,row)))
    npData = json.dumps(npResult, cls=DecimalEncoder)
    # Farmgate prices per year (chart - range)
    #Real Price
    rpCursor = connection.cursor()
    rpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year", ROUND(("k"."farmgatePrice" / "c"."cpiRice") * 100::numeric,2) as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "kpi_cpi" "c" ON "c"."locCode" = "k"."locCode" AND "c"."locType" = "k"."locType" AND "c"."year" = "k"."year"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end])
    rpRows = rpCursor.fetchall()
    rpResult = []
    for row in rpRows:
        rpResult.append(dict(zip(keys,row)))
    rpData = json.dumps(rpResult, cls=DecimalEncoder)
    # Wholesale prices, regular and well-milled rice, per year
    # Regular Milled
    rmCursor = connection.cursor()
    rmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."wholesalePrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end])
    rmRows = rmCursor.fetchall()
    rmResult = []
    for row in rmRows:
        rmResult.append(dict(zip(keys,row)))
    rmData = json.dumps(rmResult, cls=DecimalEncoder)
    # Well Milled
    wmCursor = connection.cursor()
    wmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."WholesaleSpPrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end])
    wmRows = wmCursor.fetchall()
    wmResult = []
    for row in wmRows:
        wmResult.append(dict(zip(keys,row)))
    wmData = json.dumps(wmResult, cls=DecimalEncoder)
    # Retail prices, regular and well-milled rice, per year
    # Regular Milled
    rrmCursor = connection.cursor()
    rrmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."retailPrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end])
    rrmRows = rrmCursor.fetchall()
    rrmResult = []
    for row in rrmRows:
        rrmResult.append(dict(zip(keys,row)))
    rrmData = json.dumps(rrmResult, cls=DecimalEncoder)
    # Well Milled
    rwmCursor = connection.cursor()
    rwmCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."retailSpPrice" as value
                        FROM "kpi_prices" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode"=%s AND "k"."locType" = %s AND "k"."year">=%s AND "k"."year"<=%s """, [location_code, location_type, year_start, year_end])
    rwmRows = rwmCursor.fetchall()
    rwmResult = []
    for row in rwmRows:
        rwmResult.append(dict(zip(keys,row)))
    rwmData = json.dumps(rwmResult, cls=DecimalEncoder)
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
    return render(request,'prices.html', context)

# valuations
def valuations(request):
    title = 'Gross Value Added'
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2020'
    keys = ('location_name','year','value')
    # Maim Card Get Agriculture, Forestry, and Fishing GVA
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        aff_year = data.year
        aff_price = data.value
        aff_price_compare = data.value_compare
        aff_percent = data.percent
        aff_percent_compare = data.percent_compare
    # Main Card Get Rice Production Gross Value Added
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        rpgva_year = data.year
        rpgva_price = data.value
        rpgva_compare = data.value_compare
    #   Main Card Get Gross Domestic Product
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end, location_code, location_type, year_start, year_end]):
        gdp_year = data.year
        gdp_price = data.value
        gdp_price_compare = data.value_compare
        gdp_percent = data.percent
        gdp_percent_compare = data.percent_compare
    # Rice production and agriculture sector GVA (chart - range)
    # Rice production
    rpCursor = connection.cursor()
    rpCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND("k"."palayValue") AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end])
    rpRows = rpCursor.fetchall()
    rpResult = []
    for row in rpRows:
        rpResult.append(dict(zip(keys,row)))
    rpData = json.dumps(rpResult, cls=DecimalEncoder)
    # agriculture sector
    asCursor = connection.cursor()
    asCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND("k"."agriValue") AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end])
    asRows = asCursor.fetchall()
    asResult = []
    for row in asRows:
        asResult.append(dict(zip(keys,row)))
    asData = json.dumps(asResult, cls=DecimalEncoder)
    # Share of rice production to agriculture GDP and total GDP
    # Total GDP Share
    tgdpsCursor = connection.cursor()
    tgdpsCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."palayValue"/"k"."gdpValue")*100::numeric,2)  AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end])
    tgdpsRows = tgdpsCursor.fetchall()
    tgdpsResult = []
    for row in tgdpsRows:
        tgdpsResult.append(dict(zip(keys,row)))
    tgdpsData = json.dumps(tgdpsResult, cls=DecimalEncoder)
    # Agriculture GDP Share
    agdpsCursor = connection.cursor()
    agdpsCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, ROUND(("k"."palayValue"/"k"."agriValue")*100::numeric,2)  AS value
                        FROM "kpi_value" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode"="l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType"=%s AND "k"."year" >= %s AND "k"."year" <= %s """, [location_code, location_type, year_start, year_end])
    agdpsRows = agdpsCursor.fetchall()
    agdpsResult = []
    for row in agdpsRows:
        agdpsResult.append(dict(zip(keys,row)))
    agdpsData = json.dumps(agdpsResult, cls=DecimalEncoder)
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
    return render(request, 'valuations.html', context)

# incomes
def incomes(request):
    title = "Farmer's Income"
    location_code = '999'
    location_type = '2'
    year_start = '2000'
    year_end = '2019'
    ecosystem = '2'
    keys = ('location_name','year','value')

    # Main Card Gross, Net Returns
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
                                        """, [location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start,location_code, location_type, ecosystem, year_start, location_code, location_type, ecosystem, year_start]):

        gr_year = data.year
        gr_price = data.gross
        gr_compare = data.gross_compare
        nr_year = data.year
        nr_price = data.net
        nr_compare = data.net_compare

    # Main Card Production Cost
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
                                        			LIMIT 2) "t2" ON "t1"."id" = "t2"."id" + 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end]):
        pc_year = data.year
        pc_price = data.value
        pc_compare = data.value_compare
    # Yearly average gross returns on rice production
    # Average Gross Return
    agrCursor = connection.cursor()
    agrCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, (("y"."yieldest") * 1000) * ("p"."farmgatePrice") AS value
                            FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                            	FROM "kpi_pay"
                            	WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= %s
                            	GROUP BY "locCode", "locType", "year", "eco") "y"
                            FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                            FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                            WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<=%s""", [location_code, location_type, ecosystem, year_start, year_end, location_code, location_type, ecosystem, year_start, year_end])
    agrRows = agrCursor.fetchall()
    agrResult = []
    for row in agrRows:
        agrResult.append(dict(zip(keys,row)))
    agrData = json.dumps(agrResult, cls=DecimalEncoder)
    # Average Costs
    acCursor = connection.cursor()
    acCursor.execute("""SELECT "l"."locName" AS location_name, "k"."year" AS year, "k"."costProduction" AS value
                        FROM "kpi_costs" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locCode" = %s AND "k"."locType" = %s AND year >= %s AND year <= %s""", [location_code, location_type, year_start, year_end])
    acRows = acCursor.fetchall()
    acResult = []
    for row in acRows:
        acResult.append(dict(zip(keys,row)))
    acData = json.dumps(acResult, cls=DecimalEncoder)
    # Average Net returns
    anrCursor = connection.cursor()
    anrCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, (("y"."yieldest") * 1000) * ("p"."farmgatePrice") - "c"."costProduction" AS value
                        FROM (SELECT "locCode", "locType", "year", "eco", ROUND(AVG("yieldEst")::numeric,2) AS yieldEst
                        	FROM "kpi_pay"
                        	WHERE "locCode" = %s AND "locType" = %s AND "eco" = %s AND "year">= %s AND "year"<= %s
                        	GROUP BY "locCode", "locType", "year", "eco") "y"
                        FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                        FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                        FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                        WHERE "y"."locCode" = %s AND "y"."locType" = %s AND "y"."eco" = %s AND "y"."year">= %s AND "y"."year"<=%s""", [location_code, location_type, ecosystem, year_start, year_end, location_code, location_type, ecosystem, year_start, year_end])
    anrRows = anrCursor.fetchall()
    anrResult = []
    for row in anrRows:
        anrResult.append(dict(zip(keys,row)))
    anrData = json.dumps(anrResult, cls=DecimalEncoder)
    # Average costs and net returns on rice production by region
    acnrCursor = connection.cursor()
    acnrCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, ROUND("c"."costProduction") AS costs, ROUND((((("y"."yieldest") * 1000) * ("p"."farmgatePrice")) - "c"."costProduction")) AS net
                        FROM (SELECT "locCode", "locType", "year", "eco", AVG("yieldEst") AS yieldEst
                        	FROM "kpi_pay"
                        	WHERE "locCode" != '999' AND "locType" ='1' AND eco='2' AND "year"= '2019'
                        	GROUP BY "locCode", "locType", "year", "eco") "y"
                        FULL JOIN "kpi_costs" "c" ON "y"."locCode" = "c"."locCode" AND "y"."locType" = "c"."locType" AND "y"."year" = "c"."year"
                        FULL JOIN "kpi_prices" "p" ON "y"."locCode" = "p"."locCode" AND "y"."locType" = "p"."locType" AND "y"."year" = "p"."year"
                        FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                        WHERE "y"."locCode"!='999' AND "y"."locType" ='1' AND "y"."eco" ='2'  AND  "y"."year"='2019'""", [location_code, location_type, ecosystem, year_start, year_end, location_code, location_type, ecosystem, year_start, year_end])
    acnrRows = acnrCursor.fetchall()
    acnrResult = []
    acnrKeys = ('location_name','year','costs','net')
    for row in acnrRows:
        acnrResult.append(dict(zip(acnrKeys,row)))
    acnrData = json.dumps(acnrResult, cls=DecimalEncoder)
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
    return render(request, 'incomes.html', context)

# yield and production cost
def yieldcost(request):
    title = 'Yield and Production Cost'
    location_code = '999' # locCode in ids_location, Philippines
    location_type = '2' # locType in ids_location, Provinces only
    year_start = '2000' # starting Date, for range
    year_end = '2019' # end Date, for Range
    ecosystem = '2' # type of eco in ids_ecosystem, All ecosystem
    yieldEst = '4'
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end, ecosystem, location_code, location_type, year_start, year_end, ecosystem]):
        yph_year = data.year
        yph_value = data.value
        yph_compare = data.compare

    # Unit Cost
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
                                        LIMIT 1""", [location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end, ecosystem,location_code, location_type, year_start, year_end,location_code, location_type, year_start, year_end, ecosystem]):
        uc_year = data.year
        uc_value = data.value
        uc_compare = data.compare
    # Average fertilizer use by N-P-K component, high-yielding provinces
    npkCursor = connection.cursor()
    npkCursor.execute("""SELECT "l"."locName" AS location_name, "y"."year" AS year, "n"."nperha" As n_value, "n"."pperha" AS p_value, "n"."kperha" AS k_value
                        FROM (  SELECT "locCode", "locType", "year", "eco", AVG("yieldEst") as yieldEst
                        		FROM kpi_pay
                        		WHERE "locType"=%s AND "eco"=%s AND "year" = %s AND "yieldEst">=%s
                        		GROUP BY "locCode", "locType", "year", "eco"
                        	) "y"
                        FULL JOIN "kpi_npk" "n" ON "y"."locCode" = "n"."locCode" AND "y"."locType" = "n"."locType" AND "y"."year" = "n"."year" AND "y"."eco" = "n"."eco"
                        FULL JOIN "ids_location" "l" ON "l"."locCode" = "y"."locCode" AND "l"."locType" = "y"."locType"
                        WHERE "y"."locType" = %s AND "y"."eco"=%s AND "y"."year" = %s AND "y"."locCode" != '999'
                        ORDER BY location_name """, [location_type, ecosystem, year_end, yieldEst, location_type, ecosystem, year_end])
    npkRows = npkCursor.fetchall()
    npkResult = []
    npkKeys = ('location_name', 'year','n_value','p_value','k_value')
    for row in npkRows:
        npkResult.append(dict(zip(npkKeys,row)))
    npkData = json.dumps(npkResult, cls=DecimalEncoder)
    # Percentage breakdown of costs of rice production, Philippines
    pbcCursor = connection.cursor()
    pbcCursor.execute("""   SELECT "locName", "year", "materialInputs", "hiredLabor", "OFELabor", "machine", "irrigation", "landRent", "interestCapital", "otherInputs"
                            FROM "kpi_costscom"
                            WHERE "year" >= '2009' AND "year" <= '2019' """, [year_start, year_end])
    pbcRows = pbcCursor.fetchall()
    pbcResult = []
    pbcKeys = ('locName', 'year','materialInputs','hiredLabor','OFELabor','machine','irrigation','landRent','interestCapital','otherInputs')
    for row in pbcRows:
        pbcResult.append(dict(zip(pbcKeys,row)))
    pbcData = json.dumps(pbcResult, cls=DecimalEncoder)
    # Scatter Table Yield and unit cost of top rice-producing provinces, 2017
    yuCursor = connection.cursor()
    yuCursor.execute("""SELECT ROUND(("k"."yieldEst")/1000::numeric,2) as x, "k"."costperkg" as y, "l"."locName" AS location_name
                        FROM "rb_ycost" "k"
                        FULL JOIN "ids_location" "l" ON "k"."locCode" = "l"."locCode" AND "k"."locType" = "l"."locType"
                        WHERE "k"."locType" = '2' AND "k"."year" = '2017' """)
    yuRows = yuCursor.fetchall()
    yuResult = []
    yuKeys = ('x','y','location_name')
    for row in yuRows:
        yuResult.append(dict(zip(yuKeys,row)))
    yuData = json.dumps(yuResult, cls=DecimalEncoder)
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
