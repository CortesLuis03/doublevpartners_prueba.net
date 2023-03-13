using System.ComponentModel.DataAnnotations;

namespace PersonasAPI.Models
{
    public class UsuarioModelo
    {
        public int IdUser { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string? Username { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        public string? Pass { get; set; }
        public DateTime? CreatedAt { get; set; }
        public string? FullDNI { get; set; }
        public string? FullName { get; set; }
        public List<PersonaModelo>? Personas { get; set; }
    }
}
