/*如果有报错两个触发器分开执行一下*/

/*==============================================================*/
/* Table: t_user                                                                                                                                       */
/*==============================================================*/
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT '用户id',
    user_name            VARCHAR(63) COMMENT '用户昵称',
    account              VARCHAR(63) COMMENT '用户账户名',
    user_password        VARCHAR(63) COMMENT '用户密码MD5加密',
    gender               INT COMMENT '用户性别 0男 1女',
    birthday             DATE COMMENT '用户生日',
    mobile               VARCHAR(11),
    email                VARCHAR(63),
    last_login_time      DATETIME COMMENT '上次登录时间',
    is_online            INT COMMENT '用户状态 1在线 0离线',
    add_time             DATETIME COMMENT '创建时间',
    update_time          DATETIME COMMENT '更新时间',
    del_flag             INT DEFAULT 0 COMMENT '逻辑删除标志',
    role_id              INT COMMENT '0 普通用户 1 高级用户 3管理员',
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '用户表';



/*==============================================================*/
/* Table: t_customer                                                                                                                               */
/*==============================================================*/
DROP TABLE IF EXISTS t_customer;
CREATE TABLE t_customer
(
    id                     INT NOT NULL COMMENT '客户id',
    customer_name          VARCHAR(63) COMMENT '客户名称',
    customer_type          INT COMMENT '客户类型 0为零售客户 1是批发客户',
    birthday               DATETIME COMMENT '客户出生日期',
    gender                 INT COMMENT '客户性别 0男1女',
    marriage               INT DEFAULT 0 COMMENT '客户婚姻情况 0不明 1未婚 2已婚',
    degree                 INT DEFAULT 0 COMMENT '客户学历 0不明 1小学及以下 2中学 3高中 4大学 5大学及以上 ',
    income_level           INT DEFAULT 0 COMMENT '收入水平 0不明 1低收入 2中收入 3高收入 ',
    interest_category_name VARCHAR(63) COMMENT '客户感兴趣的商品类别',
    add_time               DATETIME,
    update_time            DATETIME,
    del_flag               INT DEFAULT 0,
    PRIMARY KEY (id),
    INDEX customer_type_index(customer_type)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '客户表';

/*==============================================================*/
/* Table: t_address                                           */
/*==============================================================*/

DROP TABLE IF EXISTS t_address;
CREATE TABLE t_address
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT 'id',
    user_id              INT COMMENT '用户ID',
    customer_id          INT COMMENT '客户ID',
    province             INT COMMENT '省ID',
    city                 INT COMMENT '市ID',
    detail               VARCHAR(255) COMMENT '详细地址',
    add_time             DATETIME COMMENT '创建时间',
    update_time          DATETIME COMMENT '修改时间',
    del_flag             INT DEFAULT 0 COMMENT '逻辑删除标志',
    PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '客户地址表';


/*==============================================================*/
/* Table: t_region                                            */
/*==============================================================*/
DROP TABLE IF EXISTS t_region;
CREATE TABLE t_region
(
    id                   INT NOT NULL,
    parent_id            INT NOT NULL DEFAULT '0' COMMENT '行政区域父ID，例如区县的pid指向市，市的pid指向省，省的pid则是0',
    region_name          VARCHAR(63) NOT NULL COMMENT '行政区域名称' ,
    region_type          INT DEFAULT '0' COMMENT '行政区域类型，如如1则是省， 如果是2则是市，如果是3则是区县',
    PRIMARY KEY (id),
    INDEX parent_id_index(parent_id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '行政区域表';



/*==============================================================*/
/* Table: t_category                                            */
/*==============================================================*/
DROP TABLE IF EXISTS t_category;
CREATE TABLE t_category
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT '类别id',
    category_name        VARCHAR(63) NOT NULL UNIQUE COMMENT '类别名称',
    parent_id            INT COMMENT '父类别id',
    sort_order           INT COMMENT '排序顺序',
    is_parent            INT COMMENT '是否为父类别',
    add_time             DATETIME,
    update_time        DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '类别表';


/*==============================================================*/
/* Table: t_brand                                             */
/*==============================================================*/
DROP TABLE IF EXISTS t_brand;
CREATE TABLE t_brand
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT '品牌id',
    brand_name           VARCHAR(63) UNICODE COMMENT '品牌名称',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0 COMMENT '逻辑删除标志',
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '品牌表';


/*==============================================================*/
/* Table: t_good                                                */
/*==============================================================*/
DROP TABLE IF EXISTS t_good;
CREATE TABLE t_good
(
    id                   INT NOT NULL COMMENT '商品id',
    good_name            VARCHAR(63) COMMENT '商品名称',
    category_id          INT COMMENT '类别id',
    brand_id             INT COMMENT '品牌id',
    image                MEDIUMBLOB,
    price                DECIMAL(10,2) COMMENT '商品当前价格',
    use_attribute        INT COMMENT '是否使用规格 0否1是',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '商品表';



/*==============================================================*/
/* Table: t_attribute_value                                     */
/*==============================================================*/
DROP TABLE IF EXISTS t_attribute_value;
CREATE TABLE t_attribute_value
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT '规格值id/sku_id',
    good_id              INT COMMENT '商品id',
    attribute_value      VARCHAR(255) COMMENT '如该商品1个规格值是 [黑，64G]',
    price                DECIMAL(10,2) COMMENT '该规格的商品价格',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '规格值表';




/*==============================================================*/
/* Table: t_good_order 假定一个订单一种商品                       */
/*==============================================================*/
DROP TABLE IF EXISTS t_good_order;
CREATE TABLE t_good_order
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT '订单id',
    customer_id          INT NOT NULL COMMENT '客户id',
    good_id              INT NOT NULL COMMENT '商品id',
    attribute_value_id   INT COMMENT '规格id',
    price                DECIMAL(10,2) NOT NULL COMMENT '单价',
    num                  INT NOT NULL COMMENT '数量',
    payment              DECIMAL(10,2) NOT NULL COMMENT '订单总价',
    is_comment           INT COMMENT '用户是否评论 0否 1是',
    add_time             DATETIME COMMENT '订单支付时间',
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id),
    INDEX good_id_index(good_id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '商品销售订单表';


/*==============================================================*/
/* Table: t_order_comment 假定一个用户对于一个订单仅能评价一次     */
/*==============================================================*/
DROP TABLE IF EXISTS t_order_comment;
CREATE TABLE t_order_comment
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT 'id',
    order_id             INT COMMENT '订单id',
    customer_id          INT COMMENT '客户id',
    star                 INT COMMENT '评价等级',
    detail               VARCHAR(255) COMMENT '评价详情',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '订单评价表';


/*==============================================================*/
/* Table: t_permission                                        */
/*==============================================================*/
DROP TABLE IF EXISTS t_permission;
CREATE TABLE t_permission
(
    id                   INT NOT NULL AUTO_INCREMENTCOMMENT COMMENT '权限id',
    permission_name      VARCHAR(63) COMMENT '权限名称',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '权限表';


/*==============================================================*/
/* Table: t_role                                              */
/*==============================================================*/
DROP TABLE IF EXISTS t_role;
CREATE TABLE t_role
(
    id                   INT NOT NULL COMMENT '角色id',
    role_name            VARCHAR(63) COMMENT ' 0管理员 1高级用户 2普通用户',
    detail               VARCHAR(255) COMMENT '角色描述',
    is_enabled           INT DEFAULT '1' COMMENT '是否启用',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '角色表';


/*==============================================================*/
/* Table: t_role_permission                                   */
/*==============================================================*/
DROP TABLE IF EXISTS t_role_permission;
CREATE TABLE t_role_permission
(
    id                   INT NOT NULL AUTO_INCREMENT,
    role_id              INT NOT NULL COMMENT '角色id',
    permission_id        INT NOT NULL COMMENT '权限id',
    add_time             DATETIME,
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '角色权限表';


/*==============================================================*/
/* Table: t_instock                                             */
/*==============================================================*/
DROP TABLE IF EXISTS t_instock;
CREATE TABLE t_instock
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT '入库id',
    good_id              INT NOT NULL COMMENT '商品id',
    attribute_value_id   INT COMMENT '商品规格id',
    price                DECIMAL(10,2) COMMENT '入库单价',
    unit                 VARCHAR(10) DEFAULT '件' COMMENT '库存单位',
    num                  INT COMMENT '入库数量',
    total_price          DECIMAL(10,2) COMMENT '入库总金额',
    add_time             DATETIME COMMENT '入库日期',
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id),
    INDEX good_id_index(good_id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '入库表';

/*==============================================================*/
/* Table: t_stock                                                                                                                                     */
/*==============================================================*/
DROP TABLE IF EXISTS t_stock;
CREATE TABLE t_stock
(
    id                   INT NOT NULL AUTO_INCREMENT COMMENT 'id',
    good_id              INT NOT NULL COMMENT '商品id',
    attribute_value_id   INT COMMENT '商品规格id',
    num                  INT COMMENT '本日的数量（有正负）',
    stock_num            INT COMMENT '总的库存量（是加上该单据发生后的即时库存余额）',
    add_time             DATETIME COMMENT '添加日期',
    update_time          DATETIME,
    del_flag             INT DEFAULT 0,
    PRIMARY KEY (id),
    INDEX good_id_index(good_id)
)ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT '库存表';



/*如果有报错两个触发器分开执行一下*/

DROP TRIGGER IF EXISTS increaseStock_trigger;
DELIMITER //
CREATE TRIGGER increaseStock_trigger
AFTER INSERT ON t_instock
FOR EACH ROW BEGIN

DECLARE existflag INT DEFAULT 0;
DECLARE last_stock_num INT DEFAULT 0;

SELECT COUNT(*) INTO existflag FROM t_stock WHERE good_id=new.good_id AND attribute_value_id=new.attribute_value_id AND DATE(add_time)=DATE(new.add_time) LIMIT 0,1;

SELECT stock_num INTO last_stock_num FROM t_stock WHERE good_id=new.good_id AND
attribute_value_id=new.attribute_value_id ORDER BY ABS(new.add_time-add_time) ASC LIMIT 0, 1;

IF(existflag=1)
	THEN UPDATE t_stock SET num=num+new.num,add_time=new.add_time,stock_num=stock_num+new.num WHERE good_id=new.good_id AND attribute_value_id=new.attribute_value_id
	AND DATE(add_time)=DATE(new.add_time);
ELSEIF(existflag=0)
	THEN INSERT INTO t_stock(good_id,attribute_value_id,num,stock_num,add_time) VALUES (new.good_id,new.attribute_value_id,new.num,last_stock_num+new.num,new.add_time);
END IF;

END//


/*如果有报错两个触发器分开执行一下*/

DROP TRIGGER IF EXISTS decreaseStock_trigger;
DELIMITER //
CREATE TRIGGER decreaseStock_trigger
AFTER INSERT ON t_good_order
FOR EACH ROW BEGIN
DECLARE existflag INT DEFAULT 0;
DECLARE last_stock_num INT DEFAULT 0;

SELECT COUNT(*) INTO existflag FROM t_stock WHERE good_id=new.good_id AND attribute_value_id=new.attribute_value_id AND DATE(add_time)=DATE(new.add_time) LIMIT 0,1;

SELECT stock_num INTO last_stock_num FROM t_stock WHERE good_id=new.good_id AND
attribute_value_id=new.attribute_value_id ORDER BY ABS(new.add_time-add_time) ASC LIMIT 0, 1;


IF(existflag=1 AND last_stock_num >=new.num)
	THEN UPDATE t_stock SET num=num-new.num,add_time=new.add_time,stock_num=stock_num-new.num WHERE good_id=new.good_id AND attribute_value_id=new.attribute_value_id
	AND DATE(add_time)=DATE(new.add_time);
ELSEIF(last_stock_num >=new.num)
	THEN INSERT INTO t_stock(good_id,attribute_value_id,num,stock_num,add_time) VALUES (new.good_id,new.attribute_value_id,0-new.num,last_stock_num-new.num,new.add_time);
ELSE
	signal SQLSTATE 'HY000' SET message_text='没有该商品的库存,销售失败';
END IF;
END//


