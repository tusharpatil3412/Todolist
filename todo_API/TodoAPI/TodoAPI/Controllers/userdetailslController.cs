using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Reflection;
using TodoAPIBAL;

using TodoAPIMODEL;

namespace TodoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class userdetailslController : ControllerBase
    {
        private readonly IUserdetailservice _userdetailsevice;
        private readonly IConfiguration _configuration;
        public userdetailslController(IUserdetailservice userdetailsevice)
        {
            _userdetailsevice = userdetailsevice;
        }
        [HttpPost("Login")]
        public IActionResult Login(login model)
        {
            var result = _userdetailsevice.ValidateUser(model.mail, model.password); 
            if (result!=null)
            {
                // Generate a JWT token
                //var token = GenerateToken(model.Username);

                // Return the token to the client
                return Ok(result);
            }

            return Unauthorized();

        }
        [HttpPost("Signup")]
        public IActionResult Signup([FromBody]user model)
        {
            var result = _userdetailsevice.CreateUser(model.id, model.name, model.mail, model.password);
            if (result!=null)
            {
                // Generate a JWT token
                //var token = GenerateToken(model.Username);

                // Return the token to the client
                return Ok(result);
            } 

            return Unauthorized(false);
        }
        [HttpGet("alluser")]
        public IActionResult getalluser()
        {
            try
            {
                List<user> users = _userdetailsevice.GetAllUser();
                if (users == null || users.Count == 0)
                {
                    return NotFound("No users found.");
                }

                return Ok(users);
            }
            catch (Exception ex)
            {
                // Log the exception (optional)
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
