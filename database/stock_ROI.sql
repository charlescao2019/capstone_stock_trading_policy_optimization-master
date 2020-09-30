create database stock_ROI;

use stock_ROI;
drop table metrics_setting;
create table metrics_setting(
id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
stock_id INT(10) UNSIGNED,
meta_id INT(10) UNSIGNED,
setting_skip_loop INT(10),
setting_ma INT(10),
setting_max_buy INT(10),
ROI float NOT NULL,
Sharpe float NOT NULL,
Sortino float NOT NULL
);

create table metadata(
id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
meta_name varchar(50) NOT NULL	
);

create table stock_data(
id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
name varchar(50) NOT NULL,	
date_begin DATE NOT NULL
);

insert into metadata (id, meta_name) Values
	(1, 'Train_buy_and_hold'),
	(2, 'Train_abcd_default'),
	(3, 'Train_abcd_opt'),
	(4, 'Test_buy_and_hold'),
	(5, 'Test_abcd_default'),
	(6, 'Test_abcd_opt');


