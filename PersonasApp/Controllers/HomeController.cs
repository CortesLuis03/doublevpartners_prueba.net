using Microsoft.AspNetCore.Mvc;
using PersonasAPI.Models;
using System.Diagnostics;

namespace PersonasAPI.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            if(HttpContext.Session != null && HttpContext.Session.GetString("SessionUsername") != null)
            {
                ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
                return View();
            } else
            {
                return View("~/Views/Login/Login.cshtml");
            }  
        }

        public IActionResult Privacy()
        {
            return View();
        }

    }
}