package utils

import (
	"Knowledge/common_number/models"
	"fmt"
	"github.com/jinzhu/gorm"
	"time"
)

func CreateInfos() {
	db,err := gorm.Open("mysql","root:123@tcp(127.0.0.1:3306)/common_number?charset=utf8&parseTime=True&loc=Local")
	db.SingularTable(true)
	if err!=nil{
		panic(err)
	}
	defer db.Close()

	orderTime:=time.Now()
	order:=models.Order{Money: 10000,Goods: "computer",Other: "",OrderTime: orderTime}
	result:=db.Create(&order)
	fmt.Println(result)
	userOrder:=models.UserOrder{UserId: 3,OrderId: order.OrderId,OrderTime: orderTime}
	result=db.Create(userOrder)
	fmt.Println(result)
}
