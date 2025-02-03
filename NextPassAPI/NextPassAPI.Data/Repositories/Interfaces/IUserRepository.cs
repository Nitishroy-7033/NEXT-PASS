using NextPassAPI.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NextPassAPI.Data.Repositories.Interfaces
{
    public interface IUserRepository
    {
        Task<User> GetUserByEmail(string email);
        Task<User> CreateUser(User newUser);
        Task<bool> UpdateUser(User updatedUser);
        Task<bool> DeleteUser(string userId);
    }
}
