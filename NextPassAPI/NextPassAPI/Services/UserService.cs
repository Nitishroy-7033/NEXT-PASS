using NextPassAPI.Data.Models.Requests;
using NextPassAPI.Data.Models;
using NextPassAPI.Data.Repositories.Interfaces;
using Microsoft.AspNetCore.Identity;
using NextPassAPI.Services.Interfaces;

namespace NextPassAPI.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        public UserService(IUserRepository userRepository) {

            _userRepository = userRepository;
        }
        public async Task<User> CreateUser(UserRequest userRequest)
        {
            var newUser = new User
            {
                Email = userRequest.Email,
                HashedPassword = "",
                FirstName = userRequest.FirstName,
                LastName = userRequest.LastName,
                CreatedAt = DateTime.UtcNow,
                LastLogin = DateTime.UtcNow,
                IsVerified = false,
                IsDeleted = false,
                Role="User"
            };

            return await _userRepository.CreateUser(newUser);
        }
      
       

        public async Task<User> GetUserByEmail(string email)
        {
            return await _userRepository.GetUserByEmail(email);
        }

        public async Task<bool> UpdateUser(User updatedUser)
        {
            updatedUser.UpdatedAt = DateTime.UtcNow;
            return await _userRepository.UpdateUser(updatedUser);
        }

        public async Task<bool> DeleteUser(string userId)
        {
            return await _userRepository.DeleteUser(userId);
        }

       
    }
}
