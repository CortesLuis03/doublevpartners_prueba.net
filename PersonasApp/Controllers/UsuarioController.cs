using Microsoft.AspNetCore.Mvc;
using PersonasAPI.Data;
using PersonasAPI.Models;

namespace PersonasAPI.Controllers
{
    public class UsuarioController : Controller
    {
        UsuarioData _UsuarioData = new UsuarioData();
        public IActionResult ListaUsuarios()
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var oLista = _UsuarioData.getUsuarios();
            return View(oLista);
        }

        public IActionResult GuardarUsuario()
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var usuario = new UsuarioModelo();
            usuario.Personas = _UsuarioData.getPersonasSinUsuario();
            return View(usuario);
        }

        [HttpPost]
        public IActionResult GuardarUsuario(UsuarioModelo oModelo)
        {
            if (!ModelState.IsValid)
                return View();

            var respuesta = _UsuarioData.SaveUsuario(oModelo);
            if (respuesta)
                return RedirectToAction("ListaUsuarios");
            else
                return View();
        }

        public IActionResult EditarUsuario(int IdUser)
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var oUsuario = _UsuarioData.getUsuario(IdUser);
            return View(oUsuario);
        }

        [HttpPost]
        public IActionResult EditarUsuario(UsuarioModelo oUsuario)
        {
            if (!ModelState.IsValid)
                return View();

            var respuesta = _UsuarioData.EditUser(oUsuario);
            if (respuesta)
                return RedirectToAction("ListaUsuarios");
            else
                return View();
        }

        public IActionResult EliminarUsuario(int IdUser)
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var oUsuario = _UsuarioData.getUsuario(IdUser);
            return View(oUsuario);
        }

        [HttpPost]
        public IActionResult EliminarUsuario(UsuarioModelo oUsuario)
        {
            var respuesta = _UsuarioData.DeleteUser(oUsuario);
            if (respuesta)
                return RedirectToAction("ListaUsuarios");
            else
                return View();
        }
    }
}
