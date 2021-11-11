# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.7.2

* API's which we used

* 1. User singup:\
\
curl --location -g --request POST 'https://simpleshop-app.herokuapp.com/api/v1/users?user[name]=admin&user[email]=admin@gmail.com&user[password]=123456'


* 2. user login:\
\
curl --location --request POST 'https://simpleshop-app.herokuapp.com/api/v1/auth/login?email=admin@gmail.com&password=123456'


================================================

* 3. Create regions:\
\
curl --location --request POST 'https://simpleshop-app.herokuapp.com/api/v1/regions' \
--header 'Authorization: <AUTH-TOKEN>' \
--form 'region[title]="Region3"' \
--form 'region[country]="USA"' \
--form 'region[currency]="USD"' \
--form 'region[tax]="0.25"'


* 4. fetch regions:\
\
curl --location --request GET 'https://simpleshop-app.herokuapp.com/api/v1/regions' \
--header 'Authorization: <AUTH-TOKEN>'


* 5. Delete regions\
\
curl --location --request DELETE 'https://simpleshop-app.herokuapp.com/api/v1/regions/2' \
--header 'Authorization: <AUTH-TOKEN>' \
--form 'region[title]="Region3"' \
--form 'region[country]="USA"' \
--form 'region[currency]="USD"' \
--form 'region[tax]="0.25"'


6 Update regions

curl --location --request PATCH 'https://simpleshop-app.herokuapp.com/api/v1/regions/1' \
--header 'Authorization: <AUTH-TOKEN>' \
--form 'region[title]="Myregion"' \
--form 'region[country]="USA"' \
--form 'region[currency]="USD"' \
--form 'region[tax]="0.25"'

=========================================================================

* 7. Create products:\
\
curl --location --request POST 'https://simpleshop-app.herokuapp.com//api/v1/products' \
--header 'Authorization: <AUTH-TOKEN>' \
--form 'product[title]="Bottle2"' \
--form 'product[description]="Solimo Stainless Steel Insulated 24 Hours Hot or Cold Bottle Flask, 1000 ml, Silver"' \
--form 'product[price]="100.25"' \
--form 'product[stock]="3"' \
--form 'product[sku]="6546546s43"' \
--form 'product[image]=@"/home/rails/Downloads/cabbooking.png"' \
--form 'product[region_id]="1"'

* 8. Listing products:\
\
curl --location --request GET 'https://simpleshop-app.herokuapp.com/api/v1/products' \
--header 'Authorization: <AUTH-TOKEN>'

* 9. Show product:\
\
curl --location --request GET 'localhost:3000/api/v1/products/1' \
--header 'Authorization: <AUTH-TOKEN>'

* 10. Delete products\
\
curl --location --request DELETE 'https://simpleshop-app.herokuapp.com/api/v1/products/2' \
--header 'Authorization: <AUTH-TOKEN>'


=====================================================================

* 11. place/create order\
\
curl --location --request POST 'https://simpleshop-app.herokuapp.com/api/v1/orders' \
--header 'Authorization: <AUTH-TOKEN>' \
--form 'order[shipping_address]="address, city, state"' \
--form 'order[items]="[{ id: 1, qty: 2 }, { id: 2, qty: 1 }]"'

* 12. List orders\
\
curl --location --request GET 'localhost:3000/api/v1/orders' \
--header 'Authorization: <AUTH-TOKEN>'\

* ...
