use stanpe4963informudb;

load data local
	infile '/Users/LangMei/Desktop/producttype.csv' 
    into table producttype
	fields terminated by ','
	optionally enclosed by '"'
    lines terminated by '\r\n'
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/paymentstatus.csv' 
    into table paymentstatus
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/paymenttype.csv' 
    into table paymenttype
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/orderstatus.csv' 
    into table orderstatus
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/supplier.csv' 
	into table supplier
	fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\r\n'
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/customer.csv' 
    into table customer
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/employee.csv' 
    into table employee
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/product.csv' 
    into table product
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/payment.csv' 
    into table payment
	fields terminated by ','
    ignore 1 lines;

load data local
	infile '/Users/LangMei/Desktop/components.csv' 
    into table components
	fields terminated by ','
    optionally enclosed by '"'
    lines terminated by '\r\n'
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/orders.csv' 
    into table orders
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/orderdetails.csv' 
    into table orderdetails
	fields terminated by ','
    ignore 1 lines;
    
load data local
	infile '/Users/LangMei/Desktop/productrequirement.csv' 
    into table productrequirement
	fields terminated by ','
    ignore 1 lines;