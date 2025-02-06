#   Project Conversation History
### Prerequisites
Make sure you have the following installed:
- Ruby 3.2.0
- Rails 8.0.1
- PostgreSQL 15.10

### Setup Instructions

### 1. Clone the Repository
```sh
git clone git@github.com.example/project-conversation-history.git
cd project-conversation-history
```

### 2. Install Dependencies
```sh
bundle install
```

### 3. Configure the Database
```sh
rails db:create
rails db:migrate
rails db:seed
```

### 4. Start the Server
```sh
rails server
```

The application should now be running at `http://localhost:3000`.

## Default User Credentials
After running `rails db:seed`, you can log in with:

- **Email:** `testuser@example.com`
- **Password:** `password`
