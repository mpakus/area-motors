desc 'Move customers from Enquiries'
task :move_customers do
  Enquiry.find_each do |enq|
    customer = Customer.find_or_create_by(email: enq.email) do |customer|
      customer.name = enq.name
    end
    enq.update(customer_id: customer.id)
  end
end