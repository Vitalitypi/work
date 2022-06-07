package utils

import (
	"Knowledge/common_number/models"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	"time"
)

func GetUserCost(userId int, begin time.Time,end time.Time) int {
	fmt.Println(userId,begin,end)
	var ans = 0
	//打开数据库
	db,err := gorm.Open("mysql","root:123@tcp(127.0.0.1:3306)/common_number?charset=utf8&parseTime=True&loc=Local")
	db.SingularTable(true)
	if err!=nil{
		panic(err)
	}
	defer db.Close()
	//查询user_order
	var userOrders []models.UserOrder
	db.Where("user_id=? AND order_time>=? AND order_time<=?",userId,begin,end).Find(&userOrders)
	//查询某用户的money
	for _,userOrder:=range userOrders{
		var order models.Order
		db.Where("order_id=?",userOrder.OrderId).Find(&order)
		//获取单笔订单的金额
		ans+=order.Money
	}
	//获取下级会员
	var trees []models.UserTree
	db.Where("parent_node=?",userId).Find(&trees)
	for _,node:=range trees{
		ans+=GetUserCost(node.SonNode,begin,end)
	}
	return ans
}

func GetUserId(userName string) int {
	userId:=-1
	//打开数据库
	db,err := gorm.Open("mysql","root:123@tcp(127.0.0.1:3306)/common_number?charset=utf8&parseTime=True&loc=Local")
	db.SingularTable(true)
	if err!=nil{
		panic(err)
	}
	defer db.Close()
	var user models.User
	db.Where("user_name=?",userName).Find(&user)
	userId=user.UserId
	return userId
}