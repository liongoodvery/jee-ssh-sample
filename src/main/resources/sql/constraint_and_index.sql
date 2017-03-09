ALTER TABLE cst_customer
  ADD INDEX cust_source_index (`cust_source`);

ALTER TABLE cst_customer
  ADD INDEX cust_industry_index (`cust_industry`);

ALTER TABLE cst_customer
  ADD INDEX cust_level_index (`cust_level`);

ALTER TABLE base_dict
  ADD INDEX dict_type_code_index (`dict_type_code`);

ALTER TABLE crm.cst_customer
  ADD CONSTRAINT cst_customer_cust_source_fk
FOREIGN KEY (cust_source) REFERENCES base_dict (dict_id);

ALTER TABLE crm.cst_customer
  ADD CONSTRAINT cst_customer_cust_industry_fk
FOREIGN KEY (cust_industry) REFERENCES base_dict (dict_id);

ALTER TABLE crm.cst_customer
  ADD CONSTRAINT cst_customer_cust_level_fk
FOREIGN KEY (cust_level) REFERENCES base_dict (dict_id);

# ALTER TABLE crm.cst_customer
#   DROP FOREIGN KEY cst_customer_cust_source_fk;
#
#
# ALTER TABLE crm.cst_customer
#   DROP FOREIGN KEY cst_customer_cust_level_fk;
#
# ALTER TABLE crm.cst_customer
#   DROP FOREIGN KEY cst_customer_cust_industry_fk;

INSERT INTO `crm`.`cst_customer` (`cust_id`, `cust_name`, `cust_user_id`, `cust_create_id`, `cust_source`, `cust_industry`, `cust_level`, `cust_linkman`, `cust_phone`, `cust_mobile`) VALUES (NULL, '关羽', NULL, NULL, '7', '4', '23', NULL, '010-120', '120'),
  (NULL, '刘备', NULL, NULL, '7', '1', '22', NULL, '010-119', '119');