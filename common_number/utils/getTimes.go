package utils

import (
	"fmt"
	"os"
	"time"
)
func GetTimes(years string, months string) (time.Time,time.Time) {
	var t1,t2 time.Time
	//设置某年某月月初某个时间
	times,err:=time.Parse("2006-01-02 15:04:05",years+"-"+months+"-01 23:59:59")
	if err!=nil{
		fmt.Println(err)
		os.Exit(1)
	}
	t1,err=time.Parse("2006-01-02 15:04:05",years+"-"+months+"-01 00:00:00")
	if err!=nil{
		fmt.Println(err)
		os.Exit(1)
	}
	t2=times.AddDate(0,1,-1)
	return t1,t2
}
