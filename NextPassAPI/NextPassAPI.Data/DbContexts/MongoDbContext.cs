using Microsoft.Extensions.Options;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Authentication;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Xsl;

namespace NextPassAPI.Data.DbContexts
{
    public class MongoDbContext<T>
    {
        private readonly IMongoDatabase _database;

        public MongoDbContext(IOptions<MongoDbConfigs> mongoDBSettings)
        {
            var connectionString = mongoDBSettings?.Value.ConnectionString;
            try
            {
                var clientSettings = MongoClientSettings.FromConnectionString(connectionString);
                clientSettings.SslSettings = new SslSettings { EnabledSslProtocols = SslProtocols.Tls12 };

                var client = new MongoClient(clientSettings);
                _database = client.GetDatabase(mongoDBSettings.Value.DatabaseName);
            }
            catch (TimeoutException ex)
            {
                throw new InvalidOperationException("Connection to MongoDB server timed out.", ex);
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("An error occurred while connecting to MongoDB.", ex);
            }
        }

        public IMongoCollection<T> GetCollection()
        {
            var collectionName = Pluralize(typeof(T).Name);
            return _database.GetCollection<T>(collectionName);
        }

        private string Pluralize(string name)
        {
            if (name.EndsWith("y", StringComparison.OrdinalIgnoreCase))
            {
                return name.Substring(0, name.Length - 1) + "ies";
            }
            return name + "s";
        }
    }
}
