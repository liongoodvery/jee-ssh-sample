CREATE TABLE cst_customer
(
  cust_id BIGINT(32) AUTO_INCREMENT NOT NULL COMMENT '客户编号(主键)' ,
  cust_name VARCHAR(32) NOT NULL COMMENT '客户名称(公司名称)',
  cust_user_id BIGINT(32) COMMENT '负责人id',
  cust_create_id BIGINT(32) COMMENT '创建人id',
  cust_source VARCHAR(32) COMMENT '客户信息来源',
  cust_industry VARCHAR(32) COMMENT '客户所属行业',
  cust_level VARCHAR(32) COMMENT '客户级别',
  cust_linkman VARCHAR(64) COMMENT '联系人',
  cust_phone VARCHAR(64) COMMENT '固定电话',
  cust_mobile VARCHAR(16) COMMENT '移动电话',
  PRIMARY KEY (`cust_id`),
  CONSTRAINT cst_customer_cust_source_fk FOREIGN KEY (cust_source) REFERENCES base_dict (dict_id),
  CONSTRAINT cst_customer_cust_industry_fk FOREIGN KEY (cust_industry) REFERENCES base_dict (dict_id),
  CONSTRAINT cst_customer_cust_level_fk FOREIGN KEY (cust_level) REFERENCES base_dict (dict_id)
);
CREATE INDEX cust_industry_index ON cst_customer (cust_industry);
CREATE INDEX cust_level_index ON cst_customer (cust_level);
CREATE INDEX cust_source_index ON cst_customer (cust_source);

INSERT INTO `cst_customer` (`cust_id`, `cust_name`, `cust_user_id`, `cust_create_id`, `cust_source`, `cust_industry`, `cust_level`, `cust_linkman`, `cust_phone`, `cust_mobile`)
VALUES (NULL, '关羽', NULL, NULL, '7', '4', '23', NULL, '010-120', '120'),
  (NULL, '刘备', NULL, NULL, '7', '1', '22', NULL, '010-119', '119'),
  (NULL, '张飞', NULL, NULL, '6', '2', '22', NULL, '010-110', '110');