<cfif form.startDate EQ ""> 
    <cfset session.error = "Please select a start Date">
    <cflocation  url="reports.cfm">
</cfif>
<cfif form.endDate EQ "">
    <cfset variables.endDate = dateFormat(now(), "yyyy-mm-dd")>
<cfelse>
    <cfset variables.endDate = form.endDate>
</cfif>
<cfif !(structKeyExists(form, "color") && structKeyExists(form, "product") && structKeyExists(form, "brand"))>
    <cfset session.error = "Please Select The required Fields">
    <cflocation  url="reports.cfm">
</cfif>
<cfset currentDate = dateFormat(now(),"yyyy-mm-dd")>
<cfset variables.totalSales = 0>
<cfset variables.totalUnits = 0>
<cfset index = 0>
<cfset cObject = createObject("component", "components/storedProcedures")>
<cfif form.reportType EQ "salesReport">
    <cfset getMonthlysalesReport = cObject.monthySalesReport()>
    <cfif getMonthlysalesReport.recordCount LT 1>
        <cfset session.error = "No sales During that period">
        <cflocation  url="reports.cfm">
    </cfif>
</cfif>
<cfif form.reportType EQ "inventoryReport">
    <cfset getmonthlyInventoryReport = cObject.monthlyInventoryReport()>
    <cfif getmonthlyInventoryReport.recordCount LT 1>
        <cfset session.error = "Empty Records">
        <cflocation  url="reports.cfm">
    </cfif>
</cfif>

<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reportsAction.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>SalesReportAction</title>
    </head>
    <body>
        <cfoutput>
            <cfif structKeyExists(form, "pdf") && form.reportType EQ "salesReport">
                <div class="container">                
                    <cfdocument format="PDF" orientation = "landscape" pagetype="B4"  filename="salesReport.pdf" overwrite="Yes">
                        <div class="head">
                            <h3>Monthly Sales Report</h3>
                            <p>This is an monthly sales report from #form.startDate# to #variables.endDate#</p>
                        </div>
                        <div class="SellerDetails">
                            <h4>#getMonthlysalesReport.UserName#</h4>
                            <h4>#getMonthlysalesReport.emailId#</h4>
                            <h4>#getMonthlysalesReport.phoneNumber#</h4>
                            <h4>#currentDate#</h4>
                        </div>
                        <table class="table" style="border:1px solid black;">
                            <thead class="thead-dark">
                                <tr>
                                <th scope="col" style="border:1px solid black;">Order ID</th>
                                <th scope="col" style="border:1px solid black;">Product Name</th>
                                <th scope="col" style="border:1px solid black;">Product Varient</th>
                                <th scope="col" style="border:1px solid black;">Company Name</th>
                                <th scope="col" style="border:1px solid black;">Buyer Name</th>
                                <th scope="col" style="border:1px solid black;">Ordered Date</th>
                                <th scope="col" style="border:1px solid black;">Total Stock</th>
                                <th scope="col" style="border:1px solid black;">Units Sold</th>
                                <th scope="col" style="border:1px solid black;">Gross Sales</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tr >
                            <cfloop query="getMonthlysalesReport">
                                <th scope="col" style="border:1px solid black; width:150px">#encodeForHTML(fk_orderId)#</th>
                                <td style="border:1px solid black;">#encodeForHTML(productName)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(colorName)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(BrandName)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(buyerName)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(orderDate)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(productCount)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(quantity)#</td>
                                <td style="border:1px solid black;">#encodeForHTML(amount)#</td>
                                </tr>
                                <cfset variables.totalSales = variables.totalsales + amount> 
                                <cfset variables.totalunits = variables.totalunits + quantity> 
                            </cfloop>
                            </tbody>
                        </table> 
                        <h3 class="grossSales">Total Gross Sales : #variables.totalSales#</h3>
                        <h3 class="unitsSold">Total Units Sold : #variables.totalUnits#</h3>     
                    </cfdocument>
                    <cfheader name="Content-Disposition" value="attachment;filename=salesReport.pdf">
                    <cfcontent type="application/octet-stream" file="#expandPath('.')#\salesReport.pdf" deletefile="Yes">
                </div> 
            </cfif> 
            <cfif structKeyExists(form, "pdf") && form.reportType EQ "inventoryReport">
            <div class="container">
                <cfdocument format="PDF" orientation = "landscape"  filename="inventoryReport.pdf" overwrite="Yes">
                <div class="head">
                    <h3>Inventory  Report</h3>
                    <p>This is an monthly Inventory report from #startDate# to #endDate#</p>
                </div>
                <div class="SellerDetails">
                    <h4>#encodeForHTML(getmonthlyInventoryReport.UserName)#</h4>
                    <h4>#encodeForHTML(getmonthlyInventoryReport.emailId)#</h4>
                    <h4>#encodeForHTML(getmonthlyInventoryReport.phoneNumber)#</h4>
                    <h4>#currentDate#</h4>
                </div>
                <table class="table" style="border:1px solid black;">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col" style="border:1px solid black;">Product ID</th>
                        <th scope="col" style="border:1px solid black;">Product Name</th>
                        <th scope="col" style="border:1px solid black;">Product Varient</th>
                        <th scope="col" style="border:1px solid black;">Company Name</th>
                        <th scope="col" style="border:1px solid black;">Quantity Left</th>
                        <th scope="col" style="border:1px solid black;">Price Per Unit</th>
                        <th scope="col" style="border:1px solid black;">Total Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                    <cfloop query="getmonthlyInventoryReport">
                        <tr>
                        <cfset variables.totalAmount = productCount * productPrice>
                        <th scope="col" style="border:1px solid black;">#index#</th>
                        <cfset index = index + 1>
                        <td style="border:1px solid black;">#productName#</td>
                        <td style="border:1px solid black;">#colorName#</td>
                        <td style="border:1px solid black;">#BrandName#</td>
                        <td style="border:1px solid black;">#productCount#</td>
                        <td style="border:1px solid black;">#productPrice#</td>
                        <td style="border:1px solid black;">#variables.totalAmount#</td>
                        <cfset variables.totalAmount = 0>
                        </tr>
                    </cfloop>  
                    <cfset index = 0>
                    </tbody>
                </table> 
                </cfdocument>
                <cfheader name="Content-Disposition" value="attachment;filename=inventoryReport.pdf">
                <cfcontent type="application/octet-stream" file="#expandPath('.')#\inventoryReport.pdf" deletefile="Yes">
            </div>   
            </cfif>
            <cfif structKeyExists(form, "excel") && form.reportType EQ "inventoryReport">
                <cfspreadsheet action="write" fileName=#expandPath( 'inventoryReport.xls' )# query="getmonthlyInventoryReport" overwrite=true >
                <cfheader name="Content-Disposition" value="attachment; filename=inventoryReport.xls">
                <cfcontent type="application/msword" file="#expandPath( 'inventoryReport.xls' )#" deletefile="yes">
            </cfif>
            <cfif structKeyExists(form, "excel") &&  form.reportType EQ "salesReport">
                <cfspreadsheet action="write" fileName=#expandPath( 'salesReport.xls' )# query="getMonthlysalesReport" overwrite=true >
                <cfheader name="Content-Disposition" value="attachment; filename=salesReport.xls">
                <cfcontent type="application/msword" file="#expandPath( 'salesReport.xls' )#" deletefile="yes">
            </cfif>   
            <cfif structKeyExists(form, "csv") && form.reportType EQ "inventoryReport">
                <cfset cObject = createObject("component", "components/storedProcedures")> 
                <cfset getMonthlysalesReport = cObject.monthlyInventoryReport()>
                <cfset myfile = "#expandpath('csvFiles/csvFile.csv')#">
                <cffile action="write" file="#myFile#" output="""ProductId"",""productName"",""productVarient"",""companyName"",""RemainingProducts"",,""ProductPrice""">
                <cfloop query="getMonthlysalesReport">
                    <cffile action="append" file="#myFile#" output="""#pk_productId#"",""#productName#"",""#color#"",""#brandName#"",""#productCount#"",""#productPrice#""">
                </cfloop> 
                <cflocation url="./csvFiles/csvFile.csv"addtoken="false"/>
            </cfif>
            <cfif structKeyExists(form, "csv") && form.reportType EQ "salesReport">
                <cfset cObject = createObject("component", "components/storedProcedures")> 
                <cfset getMonthlysalesReport = cObject.monthySalesReport()>
                <cfset myfile = "#expandpath('csvFiles/csvFile.csv')#">
                <cffile action="write" file="#myFile#" output="""orderID"",""productName"",""productVarient"",""companyName"",""totalStock"",""unitsSold"",""grossSales""">
                <cfloop query="getMonthlysalesReport">
                    <cffile action="append" file="#myFile#" output="""#pk_orderDesp#"",""#productName#"",""#color#"",""#brandName#"",""#productCount#"",""#quantity#"",""#amount#""">
                </cfloop> 
                <cflocation url="./csvFiles/csvFile.csv"addtoken="false"/>
            </cfif>
        </cfoutput>
    </body>
</html>