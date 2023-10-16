# Sales and Product Management Dashboard
# Problem Statement
Our sales reporting system relies on static reports that require more flexibility and depth for practical analysis. We must transition from static reports to dynamic visual dashboards to enhance our sales monitoring and decision-making process. 
The primary challenges we face are:

* __Lack of Detailed Product and Client Insights__: We cannot currently track the sales of individual products and understand the clients associated with each sale. This hampers our ability to tailor our sales strategies effectively.
* __Inability to Assess Performance Trends__: We need a comprehensive system for evaluating the performance trends of our sales over time. This makes it difficult to make informed decisions and adapt to changing market dynamics.
* __Budgetary Comparison__: Our budget data for the fiscal year 2022 needs to be more effectively integrated into our sales reporting, limiting our ability to compare actual sales performance against budgeted targets.

* __Need for Filter Functionality__: Given the diverse range of products and clients managed by each salesperson, we require the capability to apply filters to analyze specific segments of our sales data.

# Business Understanding

## Business Demand Overview: 
-  __Reporter__: Shenique N. – Sales Manager
-  __Value of Change__: Visual dashboards and improved Sales reporting for Salesforce.
-  __Necessary Systems__: PowerBI, CRM System
-  __Other Relevant Information__: Budgets have been delivered in Excel for 2022

## User Stories:
| No. | As a          | I want                                | So that                                 | Acceptance Criteria                                  |
| --- | ------------- | ------------------------------------ | --------------------------------------- | ----------------------------------------------------- |  
| 1   | Sales Manager | to access a PowerBI dashboard        | effectively track which customers and products perform best each month/quarter/year | A PowerBI dashboard updated once daily.   |
| 2   | Sales Rep     | A detailed PowerBI dashboard         | proactively engages with our most frequent customers and identifies potential future sales opportunities | A PowerBI dashboard that provides the functionality to filter data by each customer. |
| 3   | Sales Rep     | a detailed overview of sales per product | efficiently monitor and manage the products that are selling the best | A PowerBI dashboard that provides the functionality to filter data by each product. |
| 4   | Sales Manager | comprehensive PowerBI dashboard to oversee our sales performance over time, enabling a comparison against our budget | can effectively evaluate our sales performance | A PowerBI dashboard that includes graphs and Key Performance Indicators (KPIs) to facilitate a comparison with the budget. |

# Data Understanding
**Data Source:** [AdventureWorks 2022 Sample Database](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms) The project utilizes the AdventureWorks 2022 sample database, a comprehensive dataset provided by Microsoft, designed for learning and practicing SQL and database management. 

This database contains information about a fictional bicycle manufacturer, Adventure Works Cycles, and encompasses various aspects of its operations, including sales, products, customers, and more. 
#### Key Tables and Data Categories 
##### Fact Tables
1. **Internet Sales Data:** The database contains sales-related information, including orders, order details, and sales territories.
1. **Budget:** Data about budgets and financial performance.

##### Dimension Tables
1. **Product Data:** Information about products, categories, and descriptions.
1. **Customer Data:** Customer details, including names, addresses, and contact information.
1. **Calendar Data:** Information about the year, quarter, month and day descriptions.
  


The data in AdventureWorks 2022 is designed to support a wide range of scenarios and use cases for database and SQL practice. This README file covers the data's use in improving sales reporting and creating dynamic visual dashboards. Please ensure the AdventureWorks 2022 database is installed and accessible for this project.

# Data Preparation
To clean and transform this data, I used Microsoft SQLServer to perform queries on the Calendar, Customers and Products Dimension Tables, and the Budget and Internet Fact Tables.

## Cleansed DIM_Customers Table

This SQL query cleans and structures the "DIM_Customers" table, providing a more organized view of the customer data. The resulting table includes essential customer attributes, such as customer key, first name, last name, full name (combined from first and last name), and gender (with values transformed from 'M' to 'Male' and 'F' to 'Female'). The query also incorporates data from the "DIM_Geography" table to include customer city information.

```sql
SELECT c.customerkey AS CustomerKey
	,c.firstname AS [FirstName]
	,c.lastname AS [LastName]
	,c.firstname + ' ' + c.lastname AS [FullName]
	CASE c.gender
		WHEN 'M' THEN 'Male'
		WHEN 'F' THEN 'Female'
		END AS Gender
	c.datefirstpurchase AS DateFirstPurchase
	,g.city AS [Customer City]
FROM AdventureWorksDW2022.dbo.DimCustomer AS c
LEFT JOIN AdventureWorksDW2022.dbo.DimGeography AS g ON g.geographykey = c.geographykey
ORDER BY CustomerKey ASC
```
## Cleansed DIM_Products Table

This SQL query is designed to cleanse and structure the "DIM_Products" table. It extracts specific attributes while providing a more organized view of the data. The resulting table includes essential product information, such as product key, item code, product name, sub-category, product category, product color, size, product line, model name, and product description.

```sql
-- Cleansed DIM_Products Table --
SELECT p.[ProductKey]
	,p.[ProductAlternateKey] AS ProductItemCode
	,p.[EnglishProductName] AS [Product Name]
	,ps.EnglishProductSubcategoryName AS [Sub Category]
	,pc.EnglishProductCategoryName AS [Product Category]
	,p.[Color] AS [Product Color]
	,p.[Size] AS [Product Size]
	,p.[ProductLine] AS [Product Line]
	,p.[ModelName] AS [Product Model Name]
	,p.[EnglishDescription] AS [Product Description]
	,ISNULL(p.STATUS, 'Outdated') AS [Product Status]
FROM AdventureWorksDW2022.dbo.DimProduct AS p
LEFT JOIN AdventureWorksDW2022.dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT JOIN AdventureWorksDW2022.dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY p.ProductKey ASC
```
<img width="953" alt="cleansed_product_table_query" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/9fb049d0-67de-4edd-b01f-d1fbf4876a21">

# Data Modeling
<img width="536" alt="sales_report_model" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/6a6b3a1f-771a-412b-80f4-0e35750ff43e">

# Model Evaluation
## Sales Overview Report
<img width="603" alt="sales_overview_report" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/5a490d6c-b1a7-4f3d-9476-44e250d28a48">
## Product Details Report
<img width="605" alt="Product Details Report" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/f00bb851-646f-4c42-900b-160a3f071672">
## Customer Details Report
<img width="605" alt="customer_details_report" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/0bbf3801-0947-4e95-a56c-31c0f8025e03">

The created Power BI report comprises three pages catering to different user needs and roles.
It is updated daily, ensuring that the data is current.
The report can be filtered by customer, product, city, month, and year, providing a high level of customization.
The report displays the top 10 products and top 10 customers, delivering valuable insights.
It includes shipment information by category and subcategory, enabling detailed product analysis.
The report intensifies the data analysis by showing the city and day of the week for the top 10 products.

# Model Deployment
To deploy this model, I published the dashboard [here](https://bit.ly/norwood_sales_product_dashboard) for users to test and give feedback to the team. 

# Future Work
Some ideas for future work include: 
1. Sales Forecasting: Implement a sales forecasting system that uses historical sales data from AdventureWorks2022 to predict future sales.
1. Inventory Management: Create an inventory management module that monitors product stock levels and generates alerts when products run low.
1. Customer Segmentation: Develop a customer segmentation analysis to group customers based on their purchase behavior, demographics, and other attributes.


Please review my full analysis in [my notebook](https://github.com/dataeducator/healthy_heart/blob/main/notebook.ipynb ) or ([my presentation](https://github.com/dataeducator/healthy_heart/blob/main/presentation.pdf )).
Feel free to contact me __Tenicka Norwood__ at tenicka.norwood@gmail.com if you have more questions.

# Repository Structure

***
<pre>
   .
   └──sales_and_product_management/
      ├── README.md                                            Overview for project reviewers  
      ├── queries/                                             Includes SQL queries 
      ├── tables/                                              Includes tables used in the model  
      ├── dashboards/                                          Includes PowerBI files   
      ├── requirements/                                        Includes requirements of this project and instructions to obtain the dataset
      ├── images/                                              Includes images related to the project
      └── .gitignore                                           Specifies intentionally untracked files
