using Microsoft.AspNetCore.Mvc;
using PersonasAPI.Data;
using PersonasAPI.Models;

namespace PersonasAPI.Controllers
{
    public class LoginController : Controller
    {
        UsuarioData _UsuarioData = new UsuarioData();
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(UsuarioModelo oUsuario)
        {
            if (!ModelState.IsValid)
                return View();

            var response = _UsuarioData.LoginValidator(oUsuario);

            if (response)
            {
                if (string.IsNullOrEmpty(HttpContext.Session.GetString("SessionUsername")))
                {
                    HttpContext.Session.SetString("SessionUsername", oUsuario.Username);
                }
                return RedirectToAction("Index", "Home");
            } else
            {
                ViewBag.ErrorMessage = "Credenciales incorrectas.";
                return View();
            }

        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
