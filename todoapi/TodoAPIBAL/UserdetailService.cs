using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TodoAPIDAL;
using TodoAPIMODEL;

namespace TodoAPIBAL
{
    public class UserdetailService : IUserdetailservice
    {
         private readonly IUserdetailRrpo _usredetailRepo;

        public UserdetailService(IUserdetailRrpo iuserdetailRrpo) 
        {
            _usredetailRepo = iuserdetailRrpo;
        }
       public user CreateUser(int id, string name, string mail, string password)
        {


            return _usredetailRepo.CreateUser(id, name, mail, password);
            
            
        }

        public List<user> GetAllUser()
        {
           return _usredetailRepo.GetAllUser();
        }

        public user ValidateUser(string mail, string password)
        {
            return _usredetailRepo.ValidateUser(mail, password);



        }
    }
}
