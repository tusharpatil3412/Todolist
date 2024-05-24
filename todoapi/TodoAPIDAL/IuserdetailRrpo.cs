using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TodoAPIMODEL;

namespace TodoAPIDAL
{
    public interface IUserdetailRrpo
    {
        user ValidateUser(string mail, string password);

        user CreateUser(int id, string name, string mail, string password);

        List<user> GetAllUser();
    }
}
