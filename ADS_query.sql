create DATABASE cloud
Go

use cloud
Go

--UP Metadata

create table Company(
    company_id int IDENTITY not null,
    company_name varchar(50) not null,
    company_year_founded int not null,
	company_category varchar(50) not null,
    company_city varchar(20) not null,
    company_state char(2) not null,
	company_zipcode int not null,
	company_website varchar(50) not null,
    company_migration_year int not null,
    company_sector_id int not null,
    company_cloud_id int not null,
    CONSTRAINT pk_companys_company_id primary key(company_id),
    constraint u_companys_company_email UNIQUE(company_website),
 )
 GO

create table Cloud_detail(
    cloud_id int identity not null,
    migrated_to_service varchar(20) not null,
    cloud_type varchar(20) not null,
    service_model_name varchar(20) not null,
	CONSTRAINT pk_contractors_contractor_id primary key(cloud_id)
 )
 GO

create table Sector(
	sector_id int identity not null,
	sector_name varchar(50) not null,
	sector_percentage_growth float not null,
	constraint pk_sectors_sector_id primary key(sector_id),
	constraint u_sectors_sector_name UNIQUE(sector_name)
)
GO
	
create table Finance(
    finance_id int identity not null,
    cloud_budget float not null,
	prev_budget float not null,
	migration_cost float not null,
	current_budget float not null,
    finance_company_id int not null,
    CONSTRAINT ck_customers_valid_prices CHECK(cloud_budget<= current_budget),
    constraint pk_finances_finance_id primary key(finance_id)
)
GO
    
    alter table Finance
        add constraint fk_finances_finance_company_id foreign key (finance_company_id)
            REFERENCES company(company_id)
    GO

    alter table Company
        add constraint fk_companys_cloud_id foreign key (company_cloud_id)
            REFERENCES cloud_detail(cloud_id),
        constraint fk_companys_sector_id foreign KEY(company_sector_id) REFERENCES sector(sector_id)

    GO

 --DOWN
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_finances_finance_company_id')
    alter table finance drop constraint fk_finances_finance_company_id
 drop table if exists finance

if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_companys_cloud_id')
    alter table company drop CONSTRAINT fk_companys_cloud_id, fk_companys_sector_id
 drop table if exists company


drop table if exists sector

drop table if exists cloud_detail


--- UP


Insert into Cloud_detail values ('AWS','Hybrid Cloud','IaaS')
Insert into Cloud_detail values ('AWS','Public Cloud','SaaS')
Insert into Cloud_detail values ('AWS','Private Cloud','IaaS')
Insert into Cloud_detail values ('Microsoft Azure','Hybrid Cloud','SaaS')
Insert into Cloud_detail values ('Microsoft Azure','Public Cloud','PaaS')
Insert into Cloud_detail values ('Microsoft Azure','Private Cloud','IaaS')
Insert into Cloud_detail values ('Google Cloud','Hybrid Cloud','SaaS')
Insert into Cloud_detail values ('Google Cloud','Public Cloud','PaaS')
Insert into Cloud_detail values ('Google Cloud','Private Cloud','IaaS')
Insert into Cloud_detail values ('IBM','Hybrid Cloud','PaaS')
Insert into Cloud_detail values ('IBM','Public Cloud','SaaS')
Insert into Cloud_detail values ('IBM','Private Cloud','IaaS')
Insert into Cloud_detail values ('Oracle','Hybrid Cloud','SaaS')
Insert into Cloud_detail values ('Oracle','Public Cloud','IaaS')
Insert into Cloud_detail values ('Oracle','Private Cloud','PaaS')


Insert into Sector values ('Media',10)
Insert into Sector values ('Technology',30.2)
Insert into Sector values ('Ecommerce',15.6)
Insert into Sector values ('Electronics',20.3)
Insert into Sector values ('Professional services',11)
Insert into Sector values ('Pharma',29)
Insert into Sector values ('Aerospace',9)
Insert into Sector values ('Products',17)
Insert into Sector values ('Automobile',7)
Insert into Sector values ('Retailer',22.4)
Insert into Sector values ('Service Provider',10)
Insert into Sector values ('Payment service',35)
Insert into Sector values ('Banking',12)
Insert into Sector values ('Food',27.8)


Insert into Finance values (1000000000,5900000,9000000,2100000000,1)
Insert into Finance values (3000000,1200000,230000,15000000,2)
Insert into Finance values (1400000,230000,500000,23000000,3)
Insert into Finance values (780000000,23000000,460000000,20000000000,4)
Insert into Finance values (2031684343,109283625,43390307,3854802162,5)
Insert into Finance values (496199516,196275116,76860732,3722376420,6)
Insert into Finance values (1854799707,1831127364,24519545,4052159241,7)
Insert into Finance values (2772441985,2141856417,806471458,8791863102,8)
Insert into Finance values (339915006,136929699,20120762,7910003208,9)
Insert into Finance values (347001462,159384578,120401803,1029341425,10)
Insert into Finance values (1264411532,1169319136,733558733,9676503807,11)
Insert into Finance values (2505825446,608273317,605831372,3760157827,12)
Insert into Finance values (2855878941,2540529202,1313249961,4740329080,13)
Insert into Finance values (2745847073,220875824,148767680,2972280711,14)
Insert into Finance values (1077875954,231484236,218172040,4883956175,15)
Insert into Finance values (406542115,393431762,118149124,4244716744,16)
Insert into Finance values (2380595689,519615906,457694683,5823430037,17)
Insert into Finance values (2845082125,2320775765,427946999,4277534888,18)
Insert into Finance values (261845201,139640945,35993785,2470373888,19)
Insert into Finance values (604903762,206634641,184158522,1882140755,20)
Insert into Finance values (174068198,131537920,4243976,7475499693,21)
Insert into Finance values (887844256,285838451,37882519,5154892128,22)
Insert into Finance values (1666412527,1110962367,519509726,6874665408,23)
Insert into Finance values (1095189480,957276669,232642532,5551988826,24)
Insert into Finance values (2820660261,23185557,8112252,5758712568,25)
Insert into Finance values (466375025,408960711,134140955,2470646928,26)
Insert into Finance values (2194456442,594913297,7434566,4436819644,27)
Insert into Finance values (113552171,80157658,689762,9248426711,28)
Insert into Finance values (1338377332,884835525,127372174,9102767831,29)
Insert into Finance values (2005952188,414363552,360054907,7428851398,30)
Insert into Finance values (2000825637,1814532842,222907908,9948833743,31)
Insert into Finance values (950178141,153392955,147107887,5795096798,32)




Insert into Company values ('Netflix',1997,'Media','Scotts Valley','CA',95066,'www.netflix.com',2008,1,10)
Insert into Company values ('Xerox',1906,'Technology','Rochester','NY',14602,'www.xerox.com',2012,2,14)
Insert into Company values ('Pinterest',2009,'Media','San Francisco','CA',94016,'www.pinterest.com',2017,11,9)
Insert into Company values ('Instagram',2010,'Media','San Francisco','CA',94105,'www.instagram.com',2010,1,1)
Insert into Company values ('Etsy',2005,'Ecommerce','Brooklyn','NY',11201,'www.etsy.com',2020,12,4)
Insert into Company values ('Apple',1976,'Electronics','Los Altos','CA',94022,'www.apple.com',2016,4,7)
Insert into Company values ('MediaMath',2007,'Media','New York City','NY',10008,'www.mediamath.com',2014,6,2)
Insert into Company values ('Pearson',1998,'Media','London','UK',31642,'www.pearson.com',2012,1,12)
Insert into Company values ('Deloitte',1845,'Professional services','London','UK',35203,'www.deloitte.com',2017,5,7)
Insert into Company values ('Wipro',1945,'Professional services','Bengaluru','KA',560035,'www.wipro.com',2014,13,3)
Insert into Company values ('Goldman Sachs',1869,'Professional services','New York City','NY',10001,'www.goldmansachs.com',2013,5,11)
Insert into Company values ('Pfizer',1849,'Pharma','Brooklyn','NY',11208,'www.pfizer.com',2016,6,13)
Insert into Company values ('Boeing',1916,'Aerospace','Seattle','WA',98124,'www.boeing.com',2011,7,8)
Insert into Company values ('Nike',1964,'Products','Eugene','OR',97401,'www.nike.com',2017,8,3)
Insert into Company values ('Dollar General',1939,'Retailer','Scottsville','KY',42164,'www.dollargeneral.com',2011,10,11)
Insert into Company values ('Tesla',2003,'Automobile','San Carlos','CA',94070,'www.tesla.com',2012,9,1)
Insert into Company values ('Nvidia',1993,'Technology','Santa Clara','CA',95050,'www.nvidia.com',2015,2,14)
Insert into Company values ('United Airlines Holdings',1968,'Aerospace','Chicago','IL',60007,'www.unitedairlinesholdings.com',2010,7,9)
Insert into Company values ('Nordstrom',1901,'Retailer','Seattle','WA',98101,'www.nordstrom.com',2013,10,5)
Insert into Company values ('Uber Technologies',2009,'Service Provider','San Francisco','CA',94102,'www.uber.com',2019,11,8)
Insert into Company values ('Ford',1903,'Automobile','Detroit','MI',48127,'www.ford.com',2018,9,2)
Insert into Company values ('PayPal',1998,'Payment service','Palo Alto','CA',94020,'www.paypal.com',2016,12,15)
Insert into Company values ('Spotify',2006,'Media','Stockholm','SW',10316,'www.spotify.com',2018,1,6)
Insert into Company values ('Motorola',1928,'Electronics','Chicago','IL',60018,'www.motorola.com',2015,4,5)
Insert into Company values ('Citi',1812,'Banking','New York City','NY',10004,'www.citi.com',2015,13,12)
Insert into Company values ('Huntington',1866,'Banking','Columbus','OH',43004,'www.huntington.com',2016,13,13)
Insert into Company values ('Whirpool',1911,'Electronics','Benton Harbor','MI',49022,'www.whirpool.com',2018,4,10)
Insert into Company values ('Zoom',2011,'Media','San Jose','CA',94088,'www.zoom.com',2020,1,4)
Insert into Company values ('Disney',1923,'Media','Los Angeles','CA',90001,'www.disney.com',2015,2,15)
Insert into Company values ('Mcdonalds',1955,'Food','San Bernardino','CA',92401,'www.mcdonalds.com',2010,14,11)
Insert into Company values ('Nasa',1958,'Aerospace','Washington DC','WA',20001,'www.nasa.com',2011,7,6)
Insert into Company values ('Unilever',1929,'Products','London','UK',07632,'www.unilever.com',2012,8,3)



select * from cloud_detail
select * from sector
select * from company
select * from finance 
select c.*, f.cloud_budget,f.prev_budget,f.migration_cost,f.current_budget from finance f join company c on f.finance_company_id = c.company_id
where c.company_category = 'Media'

