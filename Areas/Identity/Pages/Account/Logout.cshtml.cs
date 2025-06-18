using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Chainlinx.Areas.Identity.Pages.Account;

public class LogoutModel : PageModel
{
    private readonly SignInManager<IdentityUser> _signInManager;
    private readonly ILogger<LogoutModel> _logger;

    public LogoutModel(SignInManager<IdentityUser> signInManager, ILogger<LogoutModel> logger)
    {
        _signInManager = signInManager;
        _logger = logger;
    }

    [IgnoreAntiforgeryToken]
    public async Task<IActionResult> OnGetAsync()
    {
        await _signInManager.SignOutAsync();
        _logger.LogInformation("User logged out.");
        return Redirect("~/");
    }

    public async Task<IActionResult> OnPostAsync()
    {
        await _signInManager.SignOutAsync();
        _logger.LogInformation("User logged out.");
        return Redirect("~/");
    }
} 