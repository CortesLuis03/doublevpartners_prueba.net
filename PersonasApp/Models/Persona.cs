using System.ComponentModel.DataAnnotations;

namespace PersonasAPI.Models
{
    public class PersonaModelo
    {
        public int IdPerson { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string? Names { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string? Lastnames { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public int? DNI { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string? Email { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string? DNIType { get; set; }
        public DateTime? CreatedAt { get; set; }
        public string? FullDNI { get; set; }
        public string? FullName { get; set; }

    }
}
