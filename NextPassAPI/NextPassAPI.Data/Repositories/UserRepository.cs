using MongoDB.Driver;
using NextPassAPI.Data.DbContexts;
using NextPassAPI.Data.Models;
using NextPassAPI.Data.Repositories.Interfaces;

namespace NextPassAPI.Data.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly IMongoCollection<User> _user;

        public UserRepository(MongoDbContext<User> database)
        {
            _user = database.GetCollection();
        }

        public async Task<User> GetUserByEmail(string email)
        {
            return await _user.Find(user => user.Email == email).FirstOrDefaultAsync();
        }

        public async Task<User> CreateUser(User newUser)
        {
            await _user.InsertOneAsync(newUser);
            return newUser;
        }

        public async Task<bool> UpdateUser(User updatedUser)
        {
            var result = await _user.ReplaceOneAsync(u => u.Id == updatedUser.Id, updatedUser);
            return result.IsAcknowledged && result.ModifiedCount > 0;
        }

        public async Task<bool> DeleteUser(string userId)
        {
            var result = await _user.DeleteOneAsync(u => u.Id == userId);
            return result.IsAcknowledged && result.DeletedCount > 0;
        }
    }
}
