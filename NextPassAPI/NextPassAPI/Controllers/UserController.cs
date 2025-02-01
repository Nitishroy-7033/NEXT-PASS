using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NextPassAPI.Data.Models.Requests;
using NextPassAPI.Data.Models.Responses;
using NextPassAPI.Data.Models;
using NextPassAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;

namespace NextPassAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("user")]
        public async Task<IActionResult> RegisterUser([FromBody] UserRequest userRequest)
        {
            try
            {
                var user = await _userService.CreateUser(userRequest);
                var response = new ApiResponse<User>(true, "User created successfully", user);
                return Ok(response);
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponse<string>(false, "An error occurred while creating the user", ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }
        [Authorize]
        [HttpGet("{email}")]
        public async Task<IActionResult> GetUserByEmail(string email)
        {
            try
            {
                var user = await _userService.GetUserByEmail(email);
                if (user == null)
                {
                    var emptyResponse = new ApiResponse<User>(false, "User not found", null );
                    return Ok(emptyResponse);
                }
                var response = new ApiResponse<User>(true, "User retrieved successfully", user);
                return Ok(response);
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponse<string>(false, "An error occurred while retrieving the user", ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }

        [HttpPut]
        public async Task<IActionResult> UpdateUser([FromBody] User updatedUser)
        {
            try
            {
                var success = await _userService.UpdateUser(updatedUser);
                if (!success)
                {
                    var errorResponse = new ApiResponse<bool>(false, "Failed to update user", false);
                    return BadRequest(errorResponse);
                }
                var response = new ApiResponse<bool>(true, "User updated successfully", true);
                return Ok(response);
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponse<string>(false, "An error occurred while updating the user", ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }

        [HttpDelete("{userId}")]
        public async Task<IActionResult> DeleteUser(string userId)
        {
            try
            {
                var success = await _userService.DeleteUser(userId);
                if (!success)
                {
                    var errorResponse = new ApiResponse<bool>(false, "Failed to delete user", false);
                    return BadRequest(errorResponse);
                }
                var response = new ApiResponse<bool>(true, "User deleted successfully", true);
                return Ok(response);
            }
            catch (Exception ex)
            {
                var errorResponse = new ApiResponse<string>(false, "An error occurred while deleting the user", ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }
    }
    }
