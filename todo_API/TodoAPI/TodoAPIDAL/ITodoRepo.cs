using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TodoAPIMODEL;

namespace TodoAPIDAL
{
    public interface ITodoRepo
    {
        void CreateTodo(string title, string discription, string status, int userid);
        List<Todo> GetTodoById(int id);
        List<Todo> GetTodoByStatus(string status, int id);
        Todo GetTodo(int id);
        bool UpdateTodo(int id, string title, string discription, string status, int userid);
        bool DeleteTodo(int id);
    }
}
