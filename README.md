# IST-659-Database-Concepts-and-Database-Administration

CLOUD 9 

 
IST 659 Database Administration Concepts and Database Management
 
Jay Maru
Soham Nanavati
Anjali Shahi
 

Business Problem
 
 
"It's well understood that using the cloud is necessary to stay competitive, the question is when should we move our workload to the cloud?" 

What is Cloud Migration & why are more businesses moving to the cloud??
Cloud migration is a way to manage data across cloud platforms, either with or instead of on-premises storage. The cloud is useful as a data storage tier for disaster recovery, backup and long-term archiving. Cloud offers several benefits:

1. The cloud offers better insights from big data.
2. The cloud is flexible & scalable.
3. The cloud drives collaboration efficiency.
4. The cloud ensures business continuity and disaster recovery
5. Cloud is simple & cost-effective.

Through this project we aim to answer the following questions:

1. What major companies have migrated to Cloud service from a traditional database?

2. Which industry sectors have adopted Cloud services the most?

3. After migrating to the cloud, which industry sector has seen the highest rate of growth?

4. What type of cloud(multi,hybrid, single etc) is preferred by companies?

5. What part of their budget are the companies allocating for cloud services?

6. Which Cloud vendor is preferred by companies? 
 

Conceptual Model
 
 
After getting an understanding of the problem we move towards the Analysis phase of DBLC. Here identify the entities, attributes and the relationship between these entities and represent the same in the form of an E-R diagram that represents the conceptual model of the database.

Data Entities -  Company, Cloud_detail, Finance, Sector
Data Attributes :
1.	Company - Company name, website, year founded, city, state, zip code, website, migration year, company id 
2.	Cloud_detail - id, migrated to service, cloud type, service model name
3.	Sector - id, sector name, percentage growth
4.	Finance - cloud budget, previous budget, migration cost, current budget
Entity relationships :
1.	Company-Finance  : One to many relationship
2.	Company-Sector : One to many relationship
3.	Company-Cloud_detail : One to many relationship


![image](https://user-images.githubusercontent.com/37181092/196719211-4315a72b-d033-4046-9e97-8ccafaeeaeb6.png)


Logical Data Model
 

1.	Company
  a.	Primary Key: company_id
  b.	Foreign keys: company_sector_id & company_cloud_id
2.	Cloud_detail
  a.	Primary Key: cloud_id
3.	Sector
  a.	Primary Key: sector_id
4.	Finance
  a.	Primary Key: finance_id
  b.	Foreign Key: finance_company_id  
  
![image](https://user-images.githubusercontent.com/37181092/196719324-068e0396-9c43-496a-bab9-8a9191c0fecf.png)



 
