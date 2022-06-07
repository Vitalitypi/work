package main

import (
	"Knowledge/common_number/utils"
	"fmt"
)
func main() {
	userName,years,months:="","",""
	fmt.Println("请输入需要查询的用户名:")
	fmt.Scan(&userName)
	fmt.Println("请输入查询的年份:")
	fmt.Scan(&years)
	fmt.Println("请输入查询的月份:")
	fmt.Scan(&months)
	s1,s2:=utils.GetTimes(years,months)
	id:=utils.GetUserId(userName)
	money:=utils.GetUserCost(id,s1,s2)
	fmt.Print(money)
}
