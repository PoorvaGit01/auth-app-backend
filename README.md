# Ruby on Rails + React Project

This is a web application built with Ruby on Rails for the backend and React for the frontend. The app allows users to register, log in, manage referrals, and more.

## Features
- **User Authentication**: Users can sign up, log in, and log out.
- **Referral System**: Users are given a referral token after sign-up, which they can share with others.
- **Material UI**: A clean and responsive user interface built with Material-UI.
- **JWT Authentication**: Secure user authentication using JWT tokens.
- **React Router**: Handles page navigation within the app.

## Tech Stack
- **Backend**: Ruby on Rails (API mode)
- **Frontend**: React
- **Authentication**: Devise (Rails) and JWT (React)
- **UI Framework**: Material-UI
- **Database**: PostgreSQL

## Prerequisites

Before you can run the app locally, ensure you have the following installed:

- **Ruby**: Version 3.0.0 or later. Install it using [Homebrew](https://brew.sh/) or via [rbenv](https://github.com/rbenv/rbenv).
  
  To install Ruby using Homebrew:
  ```bash
  brew install ruby


  Setup and Installation
  git clone repo_url
  cd rails-react-project

  Install Rails Dependencies:
  bundle install

  Set up the Database:
  Make sure PostgreSQL is running. You can start PostgreSQL using the following command:
  brew services start postgresql
  Then, set up the database:
  rails db:create
  rails db:migrate

  Start the Rails Server:
  rails server

