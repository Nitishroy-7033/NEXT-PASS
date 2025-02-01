using NextPassAPI.Data.Models;
using NextPassAPI.Data.Repositories.Interfaces;
using BCrypt.Net;
using NextPassAPI.Data.Models.Requests;
using NextPassAPI.Services.Interfaces;
namespace NextPassAPI.Services
{
    public class AuthService : IAuthService
    {

        private readonly IUserRepository _userRepository;
        public AuthService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }


        public async Task<User> LoginUser(string email, string password)
        {
            var hashedPassword = HashPassword(password);

            var user = await _userRepository.GetUserByEmail(email);
            if(user != null && BCrypt.Net.BCrypt.Verify(password, user.HashedPassword))
            {
                return user;
            }
            return null;
        }

        public async Task<User> RegisterUser(UserRequest userRequest)
        {
            var newUser = new User
            {
                Email = userRequest.Email,
                HashedPassword = HashPassword(userRequest.Password),
                FirstName = userRequest.FirstName,
                LastName = userRequest.LastName,
                CreatedAt = DateTime.UtcNow,
                LastLogin = DateTime.UtcNow,
                IsVerified = false,
                IsDeleted = false
            };
            return await _userRepository.CreateUser(newUser);
        }
        public  string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password);
        }
    }
}
