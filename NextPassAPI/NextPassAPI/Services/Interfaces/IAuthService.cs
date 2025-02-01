using NextPassAPI.Data.Models;
using NextPassAPI.Data.Models.Requests;

namespace NextPassAPI.Services.Interfaces
{
    public interface IAuthService
    {
        Task<User> LoginUser(string email, string password);
        Task<User> RegisterUser(UserRequest userRequest);
    }
}
