# Chainlinx

A Blazor Server application with authentication, Google OAuth, and PostgreSQL database integration.

## Features

- **Authentication System**: Email/password and Google OAuth login
- **User Dashboard**: Protected dashboard for authenticated users
- **PostgreSQL Database**: Entity Framework Core with PostgreSQL
- **Modern UI**: Bootstrap-based responsive design

## Technology Stack

- **.NET 8.0**: Latest .NET framework
- **Blazor Server**: Interactive web UI framework
- **Bootstrap**: CSS framework for responsive design
- **C#**: Backend programming language

## Prerequisites

Before running this application, make sure you have the following installed:

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Visual Studio 2022, Visual Studio Code, or any IDE that supports .NET development
- PostgreSQL database
- Google OAuth credentials (optional, for Google login)

## Setup Instructions

### 1. Database Setup

1. Install PostgreSQL on your system
2. Create a new database named `chainlinx`
3. Update the connection string in `appsettings.json`:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Host=localhost;Database=chainlinx;Username=your_username;Password=your_password"
  }
}
```

### 2. Google OAuth Setup (Optional)

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Google+ API
4. Create OAuth 2.0 credentials
5. Add your application's domain to authorized origins
6. Update the Google OAuth settings in `appsettings.json`:

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

### 3. Database Migration

Run the following commands to create and apply the database migrations:

```bash
dotnet ef migrations add InitialCreate
dotnet ef database update
```

### 4. Run the Application

```bash
dotnet run
```

The application will be available at `https://localhost:5001` or `http://localhost:5000`.

## Usage

1. **Registration**: Click "Sign Up" to create a new account with email/password or Google OAuth
2. **Login**: Use your credentials or Google account to log in
3. **Dashboard**: After successful authentication, you'll be redirected to the dashboard
4. **Logout**: Click the logout button in the header to sign out

## Project Structure

```
Chainlinx/
├── Pages/                 # Blazor pages and components
│   ├── Index.razor       # Home page
│   ├── Counter.razor     # Example counter page
│   └── FetchData.razor   # Example data fetching page
├── Shared/               # Shared components and layouts
│   ├── MainLayout.razor  # Main application layout
│   ├── NavMenu.razor     # Navigation menu
│   └── HomeLayout.razor  # Home page layout
├── Data/                 # Data models and services
│   ├── WeatherForecast.cs
│   └── WeatherForecastService.cs
├── wwwroot/              # Static web assets
│   ├── css/             # Stylesheets
│   └── favicon.ico      # Site icon
├── Program.cs           # Application entry point
└── appsettings.json     # Configuration settings
```

## Configuration

The application uses `appsettings.json` for configuration. You can modify settings for:

- Database connections
- API endpoints
- Application settings

## Development

### Adding New Pages

1. Create a new `.razor` file in the `Pages/` directory
2. Add the `@page` directive with the route
3. Implement your page logic and UI

Example:
```razor
@page "/my-page"

<h1>My New Page</h1>
<p>This is a new page in Chainlinx.</p>
```

### Adding New Components

1. Create a new `.razor` file in the `Shared/` directory
2. Implement your component logic
3. Use the component in your pages

### Styling

The application uses Bootstrap for styling. You can:

- Modify `wwwroot/css/site.css` for custom styles
- Add new CSS files in the `wwwroot/css/` directory
- Use Bootstrap classes for responsive design

## Building for Production

### Publish the Application

```bash
dotnet publish -c Release
```

### Docker Support

To run with Docker:

```bash
# Build the Docker image
docker build -t chainlinx .

# Run the container
docker run -p 8080:80 chainlinx
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/your-repo/chainlinx/issues) page
2. Create a new issue with detailed information
3. Contact the development team

## Roadmap

- [ ] User authentication and profiles
- [ ] Ride creation and management
- [ ] Ride discovery and search
- [ ] Real-time notifications
- [ ] Mobile app companion
- [ ] Integration with mapping services
- [ ] Social features and ride reviews

---

**Happy Riding! 🚴‍♂️🏍️** 