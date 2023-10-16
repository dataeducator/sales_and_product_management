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
1. **Sales Data:** The database contains sales-related information, including orders, order details, and sales territories.
2. **Product Data:** Information about products, categories, and descriptions.
3. **Customer Data:** Customer details, including names, addresses, and contact information.
4. **Employee Data:** regarding employees, their positions, and departments.
5. **Geographical Data:** Information about geographic regions and territories.
6. **Sales Data:** Data about budgets and financial performance.

The data in AdventureWorks 2022 is designed to support a wide range of scenarios and use cases for database and SQL practice. This README file covers the data's use in improving sales reporting and creating dynamic visual dashboards. Please ensure the AdventureWorks 2022 database is installed and accessible for this project.

# Data Preparation
<img width="953" alt="cleansed_product_table_query" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/9fb049d0-67de-4edd-b01f-d1fbf4876a21">

# Data Modeling
<img width="536" alt="sales_report_model" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/6a6b3a1f-771a-412b-80f4-0e35750ff43e">
# Model Evaluation

# Model Deployment


<img width="603" alt="sales_overview_report" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/5a490d6c-b1a7-4f3d-9476-44e250d28a48">
<img width="605" alt="Product Details Report" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/f00bb851-646f-4c42-900b-160a3f071672">
<img width="605" alt="customer_details_report" src="https://github.com/dataeducator/sales_dashboard/assets/107881738/0bbf3801-0947-4e95-a56c-31c0f8025e03">

# Future Work
Please review my full analysis in [my notebook](https://github.com/dataeducator/healthy_heart/blob/main/notebook.ipynb ) or ([my presentation](https://github.com/dataeducator/healthy_heart/blob/main/presentation.pdf )).
Feel free to contact me __Tenicka Norwood__ at tenicka.norwood@gmail.com if you have more questions.

# Repository Structure

***
<pre>
   .
   └──notebook/
      ├── README.md                                            Overview for project reviewers  
      ├── notebook.ipynb                                       Documentation of Full Analysis in Jupyter Notebook
      ├── presentation.pdf                                     PDF version of Full Analysis shown in a slide deck                                   
      ├── requirements/                                        Includes requirements to deploy the Streamlit app and instructions to obtain dataset
      ├── models/                                              Includes models of scaled X_train and random forest for web app deployment
      ├── images/                                              Includes a folder of images for the project
      ├── scripts/                                             Includes Python code for the Streamlit web app
      └── .gitignore                                           Specifies intentionally untracked files
