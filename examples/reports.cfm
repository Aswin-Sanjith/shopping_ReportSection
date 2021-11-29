<cfparam  name="session.error" default="">
<cfset cObject = createObject("component", "components/storedProcedures")>
<cfset getProductfilters = cObject.getFilterItems()>
<cfset getcolorfilters = cObject.getAllColors()>

<cfoutput>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="css/style.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            <script src="js/datepicker.js"></script>
            <title>Report Section</title>
        </head>
        <body>
            <div class="mainContainer">
                <div class="container">
                    <form action="MSreportsAction.cfm" method="post">
                        <input type="hidden" name="userid" class="form-control" value="1" id="exampleDatepicker2">
                        <h3>Sales Report</h3>
                        <p class = "errorMsg">#session.error#</p>
                        <div class="form-outline datepicker" id="formOutine" data-mdb-inline="true">
                            <input type="date" name="startDate" class="form-control" id="exampleDatepicker2">
                            <label for="exampleDatepicker2" class="form-label">Start Date</label>
                        </div>
                        <div class="form-outline datepicker" id="formOutine" data-mdb-inline="true">
                            <input type="date" name="endDate" class="form-control" id="exampleDatepicker2">
                            <label for="exampleDatepicker2" class="form-label">End Date</label>
                        </div>
                        <div class="flex">
                            <cfloop query="getProductFilters">
                                <div class="form-check">
                                    <input class="form-check-input" name="brand" value="#brandId#" type="checkbox"  id="#brandName#" checked>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        #encodeForHTML(uCase(brandName))#
                                    </label>
                                </div>
                            </cfloop>
                        </div>
                        <div class="flex">
                            <cfloop query="getProductFilters">
                                <div class="form-check" id="marginLeft">
                                    <input class="form-check-input" name="product" value="#pk_productId#" type="checkbox"  id="#brandName#" checked>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        #encodeForHTML(uCase(productName))#
                                    </label>
                                </div>
                            </cfloop>
                        </div>
                        <div class="flex">
                            <cfloop query="getcolorfilters">
                                <div class="form-check">
                                    <input class="form-check-input" name="color" value="#pk_colorTableId#" type="checkbox"  id="flexCheckDefault" checked>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        #encodeForHTML(uCase(colorName))# VARIENT
                                    </label>
                                </div>
                            </cfloop>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="radio1" name="reportType" value="salesReport" checked>Sales Report
                            <label class="form-check-label" for="radio1"></label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="radio2" name="reportType" value="inventoryReport">Inventory Report
                            <label class="form-check-label" for="radio2"></label>
                        </div>
                        <div class="form-check">
                            <input class="btn btn-primary" type="submit" name = "pdf" value="pdf">
                            <input class="btn btn-primary" type="submit" name = "excel" value="excel">
                            <input class="btn btn-primary" type="submit" name = "csv" value="csv">
                        </div>
                    </form>
                </div>
            </div>
        </body>
    </html>
</cfoutput>

<cfset session.error = "">
