# ReadMe

## Learning Goals
- A strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- Test Driven Development
- Clear documentation

## Set Up
- `$ git clone git@github.com:ross-ian28/tea_service.git`
- `$ cd tea_service`
- `$ rails db:{:create,:migrate}`
- `$ bundle install`
- `$ rails s`

## Built With
[<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/>](https://www.ruby-lang.org/en/) **Version 2.7.4**<br>
[<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>](https://rubyonrails.org/) **Version 7.0.3.1**<br>
[<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://www.postman.com/product/what-is-postman/)<br>

## End Points

### Subscribe Customer to Tea
```
get /api/v1/subscribe
```

```
body:
  {
    title: "Silver",
    price: 2.00,
    status: "Active",
    frequency: "Monthly",
    customer_id: 1,
    tea_id: 1
  }
```
```
{
  "data": {
    "id": 4,
    "type": "subscription",
    "attributes": {
      "title": "Gold",
      "price": 2,
      "status": "Active",
      "frequency": "Monthly",
      "customer_id": 1,
      "tea_id": 1
    }
  }
}
```
### Cancels a Subscription
```
patch /api/v1/subscribe/cancel
```
```
body:
  {
    "sub_id": 1,
    "status": "Canceled"
  }
```

```
{
  "data": {
    "id": 1,
    "type": "subscription",
    "attributes": {
      "title": "Silver",
      "price": 2,
      "status": "Canceled",
      "frequency": "Monthly",
      "customer_id": 1,
      "tea_id": 1
    }
  }
}
```

### List All Customers Subscriptions
```
get /api/v1/customer/subscriptions
```
```
body:
  { "customer_id": 1 }
```

```
{
    "data": [
        {
            "id": 1,
            "title": "Silver",
            "price": 2,
            "status": "Active",
            "frequency": "Monthly",
            "customer_id": 1,
            "tea_id": 1
        },
        {
            "id": 2,
            "title": "Platinum",
            "price": 5,
            "status": "Canceled",
            "frequency": "Monthly",
            "customer_id": 1,
            "tea_id": 2
        },
        {
            "id": 3,
            "title": "Gold",
            "price": 2,
            "status": "Active",
            "frequency": "Monthly",
            "customer_id": 1,
            "tea_id": 1
        }
    ]
}
```
