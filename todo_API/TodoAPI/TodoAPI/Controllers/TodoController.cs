using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.WebSockets;
using System.Reflection;
using TodoAPIBAL;
using TodoAPIMODEL;

namespace TodoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoController : ControllerBase
    {
        private readonly  ITodoService _todoService;
        private readonly IConfiguration _configuration;
       public  TodoController(ITodoService todoService)
        {   
            _todoService = todoService;
        }
        [HttpPost("new")]
        public IActionResult NewTodo([FromBody] Todo model)
        {   
            _todoService.CreateTodo(model.Title, model.Description,model.Status,model.UserId);
            
                return Ok();
            
        }
        [HttpGet("{userid}")]
        public IActionResult GetByUserId(int userid)
        {
            var result = _todoService.GetTodoById(userid);
            if (result != null) 
            {
                return Ok(result);
            }
            return BadRequest();
            
        }
        [HttpGet("{id}/{status}")]
        public IActionResult FilterByStatus(string status,int id)
        {   
           var result= _todoService.GetTodoByStatus(status,id);
            return Ok(result);
        }
        [HttpGet("single/{id}")]
        public IActionResult GetById(int id) 
        { 
            var result=_todoService.GetTodo(id);
            if (result != null)
            {
                return Ok(result);
            }
            return BadRequest();
        }
        [HttpPut("update/{id}")]
        public IActionResult UpdateById(int id,Todo model)
        {   
            if (_todoService.UpdateTodo( id, model.Title, model.Description,  model.Status, model.UserId))
                {
                return Ok();
            }
            return BadRequest();
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteById(int id)
        {
            if (_todoService.DeleteTodo(id))
            {
                return Ok();
            }
            return BadRequest();

        }
    }
}
