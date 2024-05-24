using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using TodoAPIDAL;
using TodoAPIMODEL;

namespace TodoAPIBAL
{
    public class TodoService : ITodoService
    {
     public readonly ITodoRepo _TodoRepo;
        public TodoService( ITodoRepo todoRepo)
        {
            _TodoRepo = todoRepo;
        }
        public void CreateTodo(string title, string discription, string status, int useris)
        {
            _TodoRepo.CreateTodo(title, discription, status, useris);
            
        }

        public bool DeleteTodo(int id)
        {
            return _TodoRepo.DeleteTodo(id);
        }

        public Todo GetTodo(int id)
        {
            return _TodoRepo.GetTodo(id);
        }

        public List<Todo> GetTodoById(int id)
        {
            var result=_TodoRepo.GetTodoById(id);
            if (result != null)
            {
                return result;
            }
            return null;
        }

        public List<Todo> GetTodoByStatus(string status, int id)
        {
         return  _TodoRepo.GetTodoByStatus(status, id);
        }

        public bool UpdateTodo(int id, string title, string discription, string status, int userid)
        {
            if (_TodoRepo.UpdateTodo(id,  title,  discription, status, userid))
                {
                return true;
            }
            return false;
        }
    }
}
