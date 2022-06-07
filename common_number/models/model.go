package models
import (
	"time"
)
//user表
type User struct {
	UserId int`orm:"pk;auto"`
	UserName string `orm:"size(100)"`
	PassWord string `orm:"size(100)"`
}
//order表
type Order struct {
	OrderId int `orm:"pk;auto"`
	Money int
	Goods string `orm:"size(100)"`
	Other string `orm:"size(100)"`
	OrderTime time.Time `orm:"type(datetime)"`
}
type UserOrder struct {
	UserOrderId int `orm:"pk;auto"`
	UserId int
	OrderId int
	OrderTime time.Time `orm:"type(datetime)"`
}
type UserTree struct {
	TreeId int `orm:"pk;auto"`
	ParentNode int
	SonNode int
}
