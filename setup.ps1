# ChainLinx Setup Script
# This script helps set up the initial development environment

Write-Host "ChainLinx Setup Script" -ForegroundColor Green
Write-Host "======================" -ForegroundColor Green

# Check if .NET 8.0 is installed
Write-Host "Checking .NET 8.0 installation..." -ForegroundColor Yellow
try {
    $dotnetVersion = dotnet --version
    if ($dotnetVersion -like "8.*") {
        Write-Host "✓ .NET 8.0 is installed: $dotnetVersion" -ForegroundColor Green
    } else {
        Write-Host "✗ .NET 8.0 is not installed. Please install .NET 8.0 SDK." -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "✗ .NET is not installed. Please install .NET 8.0 SDK." -ForegroundColor Red
    exit 1
}

# Check if EF Core tools are installed
Write-Host "Checking Entity Framework Core tools..." -ForegroundColor Yellow
try {
    $efVersion = dotnet ef --version
    Write-Host "✓ EF Core tools are installed: $efVersion" -ForegroundColor Green
} catch {
    Write-Host "Installing Entity Framework Core tools..." -ForegroundColor Yellow
    dotnet tool install --global dotnet-ef
    Write-Host "✓ EF Core tools installed successfully" -ForegroundColor Green
}

# Restore packages
Write-Host "Restoring NuGet packages..." -ForegroundColor Yellow
dotnet restore
Write-Host "✓ Packages restored successfully" -ForegroundColor Green

# Check if appsettings.json exists and has proper configuration
Write-Host "Checking configuration..." -ForegroundColor Yellow
if (Test-Path "appsettings.json") {
    Write-Host "✓ appsettings.json exists" -ForegroundColor Green
    Write-Host "⚠ Please update the following in appsettings.json:" -ForegroundColor Yellow
    Write-Host "  - Database connection string" -ForegroundColor Cyan
    Write-Host "  - Google OAuth credentials (if using Google authentication)" -ForegroundColor Cyan
} else {
    Write-Host "✗ appsettings.json not found" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Update appsettings.json with your database connection string" -ForegroundColor Cyan
Write-Host "2. (Optional) Add Google OAuth credentials to appsettings.json" -ForegroundColor Cyan
Write-Host "3. Run: dotnet ef migrations add InitialCreate" -ForegroundColor Cyan
Write-Host "4. Run: dotnet ef database update" -ForegroundColor Cyan
Write-Host "5. Run: dotnet run" -ForegroundColor Cyan
Write-Host ""
Write-Host "For detailed instructions, see README.md" -ForegroundColor Cyan 