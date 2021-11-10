# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
User.create([{ name: 'Admin', email: 'admin@simpleshop.com', password: 'admin123', role: 'admin' }, { name: 'Customer', email: 'customer@simpleshop.com', password: 'customer123' }])

region = Region.create(title: 'region1', country: 'USA', currency: 'USD', tax: '0.1')


file_key = SecureRandom.uuid
ActiveStorage::Blob.service.upload(file_key, Rails.root.join('public', 'product.jpg'))

product_params = [
 { title: "Bottle", description: "Solimo Stainless Steel Insulated 24 Hours Hot", price: 654.0, sku: "45646676", stock: 3, region_id: region.id },
 { title: "Shahi Libas ", description: "Men Kurta and Pyjama Set Cotton Blend", price: 200.0, sku: "56456465", stock: 0, region_id: region.id },
 { title: "PUMA ", description: "Loop X IDP Running Shoes For Men  (Black)", price: 6545, sku: "98798788", stock: 6, region_id: region.id },
 { title: "Slim Men Grey Jeans", description: "Slim Men Grey Jeans", price: 321, sku: "54665478", stock: 60, region_id: region.id },
 { title: "Jeans", description: "Men Red Jeans", price: 987, sku: "98798887", stock: 16, region_id: region.id }
]

product_params.each do |product|
	p = Product.new(product)
	p.image.attach(io: File.open(Rails.root.join('public', 'product.jpg')), filename: 'product.jpg')
	p.save
end
