using Microsoft.AspNetCore.Mvc;
using PersonasAPI.Data;
using PersonasAPI.Models;

namespace PersonasAPI.Controllers
{
    public class PersonasController : Controller
    {
        PersonaData _PersonaData = new PersonaData();
        public IActionResult ListaPersonas()
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var oLista = _PersonaData.getPersonas();
            return View(oLista);
        }

        public IActionResult GuardarPersona()
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            return View();
        }

        [HttpPost]
        public IActionResult GuardarPersona(PersonaModelo oPersona)
        {
            if(!ModelState.IsValid)
                return View();

            var respuesta = _PersonaData.SavePersona(oPersona);
            if(respuesta)
               return RedirectToAction("ListaPersonas");
            else 
                return View();
        }

        public IActionResult EditarPersona(int IdPerson)
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var oPersona = _PersonaData.getPersona(IdPerson);
            return View(oPersona);
        }

        [HttpPost]
        public IActionResult EditarPersona(PersonaModelo oPersona)
        {
            if (!ModelState.IsValid)
                return View();

            var respuesta = _PersonaData.EditPerson(oPersona);
            if (respuesta)
                return RedirectToAction("ListaPersonas");
            else
                return View();
        }

        public IActionResult EliminarPersona(int IdPerson)
        {
            ViewBag.Username = HttpContext.Session.GetString("SessionUsername");
            var oPersona = _PersonaData.getPersona(IdPerson);
            return View(oPersona);
        }

        [HttpPost]
        public IActionResult EliminarPersona(PersonaModelo oPersona)
        {
            var respuesta = _PersonaData.DeletePerson(oPersona);
            if (respuesta)
                return RedirectToAction("ListaPersonas");
            else
                return View();
        }
    }
}
