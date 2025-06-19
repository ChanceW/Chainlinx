# ChainLinx

A Blazor Server application with authentication support including Google OAuth and password-based authentication using Entity Framework Core and PostgreSQL.

## Features
- Group ride coordination
- Trail discovery and sharing
- Ride analytics and progress tracking
- User authentication (email/password, Google OAuth)
- PostgreSQL database integration
- Responsive, modern UI (Bootstrap)

## Technology Stack
- .NET 8.0 (Blazor Server)
- C#
- Bootstrap
- PostgreSQL

## Prerequisites

- .NET 8.0 SDK
- PostgreSQL database
- Google OAuth credentials (for Google authentication)

## Setup Instructions

### 1. Database Setup

1. Install PostgreSQL on your system
2. Create a new database:
   ```sql
   CREATE DATABASE chainlinx;
   ```
3. Update the connection string in `appsettings.json`:
   ```json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Host=localhost;Database=chainlinx;Username=your_username;Password=your_password"
     }
   }
   ```

### 2. Google OAuth Setup

1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Google+ API
4. Go to "Credentials" and create an OAuth 2.0 Client ID
5. Add your application's domain to the authorized origins
6. Add your redirect URI (e.g., `https://localhost:5001/signin-google`)
7. Update the Google credentials in `appsettings.json`:
   ```json
   {
     "Authentication": {
       "Google": {
         "ClientId": "your_google_client_id",
         "ClientSecret": "your_google_client_secret"
       }
     }
   }
   ```

### 3. Entity Framework Migrations

Run the following commands to set up the database:

```bash
# Install EF Core tools (if not already installed)
dotnet tool install --global dotnet-ef

# Create the initial migration
dotnet ef migrations add InitialCreate

# Apply the migration to the database
dotnet ef database update
```

### 4. Running the Application

1. Restore NuGet packages:
   ```bash
   dotnet restore
   ```

2. Run the application:
   ```bash
   dotnet run
   ```

3. Navigate to `https://localhost:5001` in your browser

## Project Structure

- **Pages/**: Blazor pages including Login, SignUp, and Logout
- **Data/**: Entity Framework context and migrations
- **Shared/**: Layout components
- **wwwroot/**: Static files (CSS, JavaScript, images)

## Authentication Flow

### Password Authentication
1. Users can create accounts with email and password
2. Passwords are hashed using ASP.NET Core Identity
3. Login validates credentials against the database

### Google OAuth
1. Users click "Continue with Google"
2. Redirected to Google's OAuth consent screen
3. After authorization, Google redirects back to the application
4. User is automatically signed in

## Security Features

- Password hashing with ASP.NET Core Identity
- CSRF protection
- Secure cookie authentication
- Account lockout protection
- Password complexity requirements

## Customization

### Password Requirements
Modify password requirements in `Startup.cs`:
```csharp
options.Password.RequireDigit = true;
options.Password.RequireLowercase = true;
options.Password.RequireUppercase = true;
options.Password.RequireNonAlphanumeric = false;
options.Password.RequiredLength = 6;
```

### Email Confirmation
To enable email confirmation, set `RequireConfirmedAccount = true` in the Identity configuration.

## Troubleshooting

### Database Connection Issues
- Verify PostgreSQL is running
- Check connection string in `appsettings.json`
- Ensure database exists and user has proper permissions

### Google OAuth Issues
- Verify Google OAuth credentials are correct
- Check authorized origins and redirect URIs in Google Cloud Console
- Ensure HTTPS is used in development (required for OAuth)

### Migration Issues
- Delete the `Migrations` folder and recreate migrations if needed
- Ensure database connection is working before running migrations

## License

This project is licensed under the MIT License. 