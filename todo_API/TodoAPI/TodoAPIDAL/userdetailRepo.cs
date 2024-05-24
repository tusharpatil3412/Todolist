using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TodoAPIMODEL;

namespace TodoAPIDAL
{
    public class UserdetailRepo : IUserdetailRrpo
    {
        string _connectionString;
        public UserdetailRepo(string connectionString)
        {
            _connectionString = connectionString;
        }
        public user CreateUser(int id, string name, string mail, string password)
        {
            var procedure = "CreateUser";
            var parameters = new DynamicParameters();
            parameters.Add("@Name", name, DbType.String, ParameterDirection.Input);
            parameters.Add("@Mail", mail, DbType.String, ParameterDirection.Input);
            parameters.Add("@Password", password, DbType.String, ParameterDirection.Input);
            parameters.Add("@Result", dbType: DbType.Int32, direction: ParameterDirection.Output);

            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
                conn.Execute(procedure, parameters, commandType: CommandType.StoredProcedure);
                int resultId = parameters.Get<int>("@Result");

                // Retrieve the created user
                var createdUser = conn.QuerySingleOrDefault<user>("SELECT id,name,mail FROM Users WHERE id = @Id", new { Id = resultId });
                return createdUser;
            }
        }

        public List<user> GetAllUser()
        {
            var procedure = "AllUsers";
            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                var result = conn.Query<user>(procedure, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
            
        }

        public user ValidateUser(string mail, string password)
        {
            var procedure = "checkcredential";
            var parameters = new DynamicParameters();
            parameters.Add("@Mail", mail, DbType.String, ParameterDirection.Input);
            parameters.Add("@Password", password, DbType.String, ParameterDirection.Input);
            parameters.Add("@Result", dbType: DbType.Int32, direction: ParameterDirection.Output);
            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
              var result =  conn.Query<user>(procedure, parameters, commandType: CommandType.StoredProcedure);
                return result.FirstOrDefault() ;
            }


            return null; 
        }
    }
}
