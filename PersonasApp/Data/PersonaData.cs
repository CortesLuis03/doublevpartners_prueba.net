using Microsoft.OpenApi.Any;
using PersonasAPI.Models;
using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace PersonasAPI.Data
{
    public class PersonaData
    {

        public List<PersonaModelo> getPersonas()
        {
            var oLista = new List<PersonaModelo>();
            var connection = new Conexion();

            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("spGetPeople", conexion);
                command.CommandType = CommandType.StoredProcedure;

                using (var reader = command.ExecuteReader()) {
                    while (reader.Read())
                    {
                        oLista.Add(new PersonaModelo() { 
                            IdPerson = Convert.ToInt32(reader["IdPerson"]),
                            Names = reader["Names"].ToString(),
                            Lastnames = reader["Lastnames"].ToString(),
                            DNI = Convert.ToInt32(reader["DNI"]),
                            Email = reader["Email"].ToString(),
                            DNIType = reader["DNIType"].ToString(),
                            CreatedAt = Convert.ToDateTime(reader["CreatedAt"]),
                            FullDNI = reader["FullDNI"].ToString(),
                            FullName = reader["FullName"].ToString(),
                        });;
                    }
                }

                return oLista;

            }

        }

        public PersonaModelo getPersona(int IdPerson)
        {
            var oPersona = new PersonaModelo();
            var connection = new Conexion();

            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("spGetPerson", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("IdPerson", IdPerson);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        oPersona.IdPerson = Convert.ToInt32(reader["IdPerson"]);
                        oPersona.Names = reader["Names"].ToString();
                        oPersona.Lastnames = reader["Lastnames"].ToString();
                        oPersona.DNI = Convert.ToInt32(reader["DNI"]);
                        oPersona.Email = reader["Email"].ToString();
                        oPersona.DNIType = reader["DNIType"].ToString();
                        oPersona.CreatedAt = Convert.ToDateTime(reader["CreatedAt"]);
                        oPersona.FullDNI = reader["FullDNI"].ToString();
                        oPersona.FullName = reader["FullName"].ToString();
                    }
                }

            }

            return oPersona;

        }

        public bool SavePersona(PersonaModelo oPersona)
        {
            var connection = new Conexion();
            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spSavePerson", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("Names", oPersona.Names);
                command.Parameters.AddWithValue("Lastnames", oPersona.Lastnames);
                command.Parameters.AddWithValue("DNI", oPersona.DNI);
                command.Parameters.AddWithValue("Email", oPersona.Email);
                command.Parameters.AddWithValue("DNIType", oPersona.DNIType);

                try
                {
                    conexion.Open();
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }

        }

        public bool EditPerson(PersonaModelo oPersona)
        {
            var connection = new Conexion();
            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spEditPerson", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("IdPerson", oPersona.IdPerson);
                command.Parameters.AddWithValue("Names", oPersona.Names);
                command.Parameters.AddWithValue("Lastnames", oPersona.Lastnames);
                command.Parameters.AddWithValue("DNI", oPersona.DNI);
                command.Parameters.AddWithValue("Email", oPersona.Email);
                command.Parameters.AddWithValue("DNIType", oPersona.DNIType);

                try
                {
                    conexion.Open();
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }

        }

        public bool DeletePerson(PersonaModelo oPersona)
        {
            var connection = new Conexion();
            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spDeletePerson", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("IdPerson", oPersona.IdPerson);

                try
                {
                    conexion.Open();
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception e)
                {
                    string error = e.Message;
                    return false;
                }

            }

        }
    }
}
