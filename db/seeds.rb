
Inventory.create!([
  {order_date: "2015-01-01 00:00:00", progress: 10, order_list: "tk6", due_date: "2015-03-01 00:00:00", time_elasped: nil},
  {order_date: "2015-10-01 00:00:00", progress: 30, order_list: "tk8", due_date: nil, time_elasped: nil}
])
OrderType.create!([
  {order_type: "sales", amount: 1000},
  {order_type: "quote", amount: 500},
  {order_type: "sales", amount: 3000},
  {order_type: "sales", amount: 1245},
  {order_type: "quote", amount: 2000}
])
Sale.create!([
  {date: "2016-06-09 00:00:00", by: "ACW", customer: "test 1", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "sales", amount: 3245},
  {date: "2016-06-09 00:00:00", by: "ACW", customer: "test 2", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "quote", amount: 1288},
  {date: "2016-06-08 00:00:00", by: "ACW", customer: "test 4", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "sales", amount: 1050},
  {date: "2016-06-01 00:00:00", by: "ACW", customer: "test 5", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "sales", amount: 699},
  {date: "2016-06-05 00:00:00", by: "ACW", customer: "test 6", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "sales", amount: 1299},
  {date: "2016-06-04 00:00:00", by: "ACW", customer: "test 7", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "quote", amount: 2677},
  {date: "2016-06-12 00:00:00", by: "ACW", customer: "test 8", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "quote", amount: 2030},
  {date: "2016-06-10 00:00:00", by: "ACW", customer: "t1", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "sales", amount: 8000},
  {date: "2016-06-10 00:00:00", by: "ACW", customer: "t2", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "quote", amount: 2300},
  {date: "2016-05-10 00:00:00", by: "ACW", customer: "test 9", product_type: nil, due_date: nil, payment: nil, note: nil, order_type: "sales", amount: 3000}
])
