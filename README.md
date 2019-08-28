# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. <strong> The goal of this project was to learn how to be useful in a new project, a new language and a new framework. Inheriting an older and unrefined codebase is quite common so navigating this project was insightful.</strong>

## Features Implemented

- Sold Out Badge : When a product has 0 quantity, a sold out badge is displayed on the product list page
- Admin Categories : Admin users can list, create new categories and create new products using the new category
- User Authentication : Allows users to be authenticated, allow them to add products to carts and check out
- Order Details Page : Create an order page with items, their image, name, description, quantities and line item totals
- Admin Security : Only allow users that have the admin authentication details to have access to the admin pages, using HTTP auth
- Empty Shopping Cart : Create a view that displays a message if the cart is empty

## Final Product
!["Screenshot of Main view"](https://github.com/t5krishn/jungle-rails/blob/master/docs/main_view.png?raw=true)
!["Screenshot of a Product page"](https://github.com/t5krishn/jungle-rails/blob/master/docs/product_view.png?raw=true)
!["Screenshot of Shopping cart page"](https://github.com/t5krishn/jungle-rails/blob/master/docs/shopping_cart.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
