# Use the official Ruby base image
FROM ruby:3.1.1

# Install Node.js 18.x and Yarn
RUN apt-get update -qq && apt-get install -y curl gnupg
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn

# Set the working directory
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Remove package-lock.json to avoid conflicts with Yarn
RUN rm -f package-lock.json

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
