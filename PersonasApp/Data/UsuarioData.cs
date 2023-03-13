using PersonasAPI.Models;
using System.Data.SqlClient;
using System.Data;

namespace PersonasAPI.Data
{
    public class UsuarioData
    {

        public List<UsuarioModelo> getUsuarios()
        {
            var oLista = new List<UsuarioModelo>();
            var connection = new Conexion();

            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("spGetUsers", conexion);
                command.CommandType = CommandType.StoredProcedure;

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        oLista.Add(new UsuarioModelo()
                        {
                            IdUser = Convert.ToInt32(reader["IdUser"]),
                            Username = reader["Username"].ToString(),
                            FullName = reader["FullName"].ToString(),
                            FullDNI = reader["FullDNI"].ToString(),
                            Pass = reader["Pass"].ToString(),
                            CreatedAt = Convert.ToDateTime(reader["CreatedAt"]),
                        }); ;
                    }
                }

                return oLista;

            }

        }

        public List<PersonaModelo> getPersonasSinUsuario()
        {
            var oLista = new List<PersonaModelo>();
            var connection = new Conexion();

            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("spGetPeopleWithoutUser", conexion);
                command.CommandType = CommandType.StoredProcedure;

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        oLista.Add(new PersonaModelo()
                        {
                            Email = reader["Email"].ToString(),
                            FullDNI = reader["FullDNI"].ToString(),
                            FullName = reader["FullName"].ToString(),
                        }); ;
                    }
                }

                return oLista;

            }

        }

        public UsuarioModelo getUsuario(int IdUser)
        {
            var oUsuario = new UsuarioModelo();
            var connection = new Conexion();

            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("spGetUser", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("IdUser", IdUser);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        oUsuario.IdUser = Convert.ToInt32(reader["IdUser"]);
                        oUsuario.Username = reader["Username"].ToString();
                        oUsuario.Pass = reader["Pass"].ToString();
                        oUsuario.CreatedAt = Convert.ToDateTime(reader["CreatedAt"]);
                    }
                }

            }

            return oUsuario;

        }

        public bool SaveUsuario(UsuarioModelo oUsuario)
        {
            var connection = new Conexion();
            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spSaveUser", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("Username", oUsuario.Username);
                command.Parameters.AddWithValue("Password", oUsuario.Pass);

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

        public bool EditUser(UsuarioModelo oUsuario)
        {
            var connection = new Conexion();
            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spEditUser", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("IdUser", oUsuario.IdUser);
                command.Parameters.AddWithValue("Password", oUsuario.Pass);

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

        public bool DeleteUser(UsuarioModelo oUsuario)
        {
            var connection = new Conexion();
            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spDeleteUser", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("IdUser", oUsuario.IdUser);

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

        public bool LoginValidator(UsuarioModelo oUsuario)
        {
            var connection = new Conexion();
            var response = false;

            using (SqlConnection conexion = new SqlConnection(connection.getConnectionString()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("spValidLogin", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("Username", oUsuario.Username);
                command.Parameters.AddWithValue("Pass", oUsuario.Pass);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["access"].ToString() == "1")
                        {
                            response = true;
                        } else
                        {
                            response = false;
                        }
                    }
                }

            }

            return response;
        }
    }
}
