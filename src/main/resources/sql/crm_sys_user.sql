
CREATE TABLE sys_user (
  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_code` varchar(32) NOT NULL COMMENT '用户账号',
  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_state` char(1) NOT NULL COMMENT '1:正常,0:暂停',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert  into `sys_user`(`user_code`,`user_name`,`user_password`,`user_state`) values ('m0003','小军','123','1'),('m0001','小红','123','1'),('m0001','小明','123','1'),('m0001','小红','123','1');




