class SubscriptionSerializer
  def self.subscription(data)
    {
      data: {
        id: data.id,
        type: "subscription",
        attributes: {
          title: data.title,
          price: data.price,
          status: data.status,
          frequency: data.frequency,
          customer_id: data.customer_id,
          tea_id: data.tea_id
        }
      }
    }
  end

  def self.all_subscriptions(data)
    {
      data: data.each do |sub|
        {
          id: sub.id,
          type: "subscription",
          attributes: {
            title: sub.title,
            price: sub.price,
            status: sub.status,
            frequency: sub.frequency,
            customer_id: sub.customer_id,
            tea_id: sub.tea_id
          }
        }
      end
    }
  end
end
