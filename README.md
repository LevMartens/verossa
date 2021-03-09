# About The Project

<img width="314" alt="currencyPicker" src="https://user-images.githubusercontent.com/73681740/110408367-860a1b80-80d9-11eb-9c85-65c6c3ace6d3.png">

[![Currency Picker Video]()](https://user-images.githubusercontent.com/73681740/110407766-8f46b880-80d8-11eb-93c2-7ae121ce2dfb.mp4)


### Verossa Valley Webshop App

Verossa Valley is a fully fledged demo webshop app that depicts a fictional brand selling photographs and prints. The webshop app is completely functional and works like a real webshop however the payment process is in sandbox mode. The design is made by me with inspiration from other webshops. The item stock is regulated in firebase, where you can manually set item stock. Each purchase will cause the stock number to automatically subtract, and when an item is sold out this will block the user from adding the product to the cart and a pop up message will show up in the app saying “Sorry this item is sold out”.

Every page has a currency picker that updates all prices on the app to the chosen currency. The currency data is fetched from an api with real time exchange rates. The newsletter subscription box saves the users email address in firebase from which the store owner can then choose to add the email to their SendGrid or MailChimp. After every completed purchase, the user gets an automated order confirmation email (due to abuse of SendGrids free to use IP addresses, this email will most likely be caught by a spam filter).

The checkout page has an order summary, the option to use a discount code as well as select express or standard shipping. On the checkout page the user is asked to fill in their contact details and address unless they have previously made a purchase or are logged into their account in which the app will autofill the data. When an order is made, all the purchase information is uploaded to firebase which allows the store owner to ship the product/s and keep track of orders.

Users can login in or create an account with firebase auth. The account details will be shared across the app so the user doesn’t have to fill in their details when making a purchase and they can keep track of their order history.



