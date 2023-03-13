namespace PersonasAPI.Data
{
    public class Conexion
    {
        private string connectionString = string.Empty;

        public Conexion()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            connectionString = builder.GetSection("ConnectionStrings:connectionString").Value;
        }

        public string getConnectionString()
        {
            return connectionString;
        }
    }
}
