# Tea Subscription Service
 - The purpose of this api is to create api calls for a frontend to consume
 - The three endpoints subscribe a customer, cancel a customers subscription, and list all of a customers subscriptions
 
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
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />  
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>  

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
