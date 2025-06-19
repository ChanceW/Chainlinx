using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace ChainLinx.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public AuthController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("google")]
        public IActionResult GoogleAuth([FromQuery] string returnUrl = null)
        {
            // Configure the redirect URL for Google OAuth
            var redirectUrl = Url.Action("GoogleCallback", "Auth", new { returnUrl });
            var properties = new AuthenticationProperties { RedirectUri = redirectUrl };
            
            return Challenge(properties, "Google");
        }

        [HttpGet("google-callback")]
        public async Task<IActionResult> GoogleCallback([FromQuery] string returnUrl = null)
        {
            try
            {
                // Get the external login info
                var info = await HttpContext.AuthenticateAsync("Google");
                
                if (!info.Succeeded)
                {
                    return Redirect($"/login?error=external_login_failed");
                }

                // Extract user information from Google
                var email = info.Principal.FindFirst("email")?.Value;
                var name = info.Principal.FindFirst("name")?.Value;

                if (string.IsNullOrEmpty(email))
                {
                    return Redirect($"/login?error=external_login_failed");
                }

                // For now, we'll just redirect back to the home page
                // In a real application, you would create or sign in the user here
                return Redirect(returnUrl ?? "/");
            }
            catch (Exception)
            {
                return Redirect($"/login?error=authentication_error");
            }
        }
    }
} 