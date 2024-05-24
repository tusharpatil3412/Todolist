using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TodoAPIMODEL
{
    public class usercs
    {
    }
    public class login
    {

        public string mail { get; set; }

        public string password { get; set; }

    }
    public class user 
    {   
        public int id { get; set; }

        public string name { get; set; }

        public string mail { get; set; }

        public string password { get; set; }
    }
}
