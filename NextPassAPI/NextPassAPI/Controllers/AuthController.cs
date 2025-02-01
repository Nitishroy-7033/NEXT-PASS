using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NextPassAPI.Data.Models;
using NextPassAPI.Data.Models.Requests;
using NextPassAPI.Data.Models.Responses;
using NextPassAPI.Services.Interfaces;

namespace NextPassAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }


        [HttpPost("login")]
        public async Task<IActionResult> LoginUser([FromBody] AuthRequest userLoginRequest)
        {
            try
            {
                var user = await _authService.LoginUser(userLoginRequest.Email, userLoginRequest.Password);
                if (user == null)
                {
                    var emptyResponse = new ApiResponse<User>(false, "Invalid email or password", null);
                    return Unauthorized(emptyResponse);
                }
                var response = new ApiResponse<User>(true, "User logged in successfully", user);
                return Ok(response);
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponse<string>(false, "An error occurred while logging in the user", ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }

        [HttpPost("register")]
        public async Task<IActionResult> RegisterUser([FromBody] UserRequest userRequest)
        {
            try
            {
                var user = await _authService.RegisterUser(userRequest);
                var response = new ApiResponse<User>(true, "User created successfully", user);
                return Ok(response);
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponse<string>(false, "An error occurred while creating the user", ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }




    }
}
