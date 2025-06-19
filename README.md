# ChainLinx

ChainLinx is a modern Blazor Server application for mountain biking enthusiasts to coordinate group rides, discover trails, and analyze ride data.

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

## Getting Started

### Prerequisites
- .NET 8.0 SDK
- PostgreSQL
- (Optional) Google OAuth credentials

### Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/ChanceW/Chainlinx.git
   cd Chainlinx
   ```
2. Configure your database connection in `appsettings.json`.
3. (Optional) Set up Google OAuth credentials in `appsettings.json`.
4. Run database migrations:
   ```sh
   dotnet ef database update
   ```
5. Start the application:
   ```sh
   dotnet run
   ```

## Usage
- Register or log in to access the dashboard
- Schedule and join group rides
- Discover new trails and track your progress

## Development
- Add new pages in the `Pages/` directory
- Add shared components in the `Shared/` directory
- Customize styles in `wwwroot/css/site.css`

## License
MIT 