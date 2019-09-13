# Adnat Challenge - Back-End

This repository contains my code for the Adnat Backend Challenge which tasks to recreate a simplified version of Tanda's Web App using Ruby on Rails.

This project was created using solely on Rails 6 with the front-end entirely on Bootstrap.

## Information

This web application was created according to the specification provided from the back-end challenge instructions. Functionalities include the login and sign up for the user, the creation of organizations and shifts. 

Additional features include, allowing the user to edit their own information and the editing and deletion of shifts.

## Installation and Setup

This web app requires Rails 6 to run locally and it can only be run using Linux/Mac or through the Ubuntu Terminal from the Windows Store.

Bootstrap is required to load the styles in the web app. In this case run:

`yarn add bootstrap@4.3.1 jquery popper.js`

Since this application has been deployed to production, the development environment has to be run using this command:

`bundle install --without production`

To migrate the database, run:

`rails db:migrate`

You can then run the server using this command:

`rails server`

You can then open the link provided by Rails from the console or in my case was `localhost:3000`.

## Possible Improvements

More features could have been implemented most especially allowing each user to be in multiple organizations which could be implemented by having a separate table that contains the association between the has_many relationships of both the organization and the user.

Also, organizations should be able to retain the information regarding the past shifts that were made in the organization by setting an organization ID for each shift since the generation of the shifts in the shifts table were only done through association calls which would disappear if the user left the organization.

The code structure is also something that needs to be improved upon as each of the controllers look clogged with the logic that needs to be implemented and also making complete use of the scaffolds provided by Rails like the scaffolds generated to the controllers were replaced.

## Deployment

The link to the deployed application can be provided upon request.