# Use Ruby 3.2.1 as the base image
FROM ruby:3.2.1-slim

# Install Rails dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    libsqlite3-dev

# Create a folder for the app and set it as the working directory
RUN mkdir /myapp
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems specified in the Gemfile
RUN gem install bundler && bundle install

# Copy the rest of the application code
COPY . /myapp
