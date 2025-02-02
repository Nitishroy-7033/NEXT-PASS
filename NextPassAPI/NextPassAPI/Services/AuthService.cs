using NextPassAPI.Data.Models;
using NextPassAPI.Data.Repositories.Interfaces;
using BCrypt.Net;
using NextPassAPI.Data.Models.Requests;
using NextPassAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authentication.OAuth;
using NextPassAPI.Identity.AuthHandler;
namespace NextPassAPI.Services
{
    public class AuthService : IAuthService
    {

        private readonly IUserRepository _userRepository;
        private readonly AuthHandler _authHandler;

        public AuthService(IUserRepository userRepository, AuthHandler authHandler)
        {
            _userRepository = userRepository;
            _authHandler = authHandler;
        }

        public async Task<User?> LoginUser(string email, string password)
        {
            var user = await _userRepository.GetUserByEmail(email);
            return user != null && _authHandler.VerifyPassword(password, user.HashedPassword) ? user : null;
        }

        public async Task<User> RegisterUser(UserRequest request)
        {
            var user = new User
            {
                Email = request.Email,
                HashedPassword = _authHandler.HashPassword(request.Password),
                FirstName = request.FirstName,
                LastName = request.LastName,
                CreatedAt = DateTime.UtcNow,
                LastLogin = DateTime.UtcNow,
                IsVerified = false,
                IsDeleted = false,
                Role = "User" // Default role
            };
            return await _userRepository.CreateUser(user);
        }
    }
}
