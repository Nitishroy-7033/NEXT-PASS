using NextPassAPI.Data.Repositories.Interfaces;
using NextPassAPI.Data.Repositories;
using NextPassAPI.Services.Interfaces;

namespace NextPassAPI.Services
{
    public static class ServicesExtensions
    {
        public static void AddServices(this IServiceCollection services)
        {

            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IAuthService, AuthService>();

        }
    }
}
