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
    public class TodoRepo : ITodoRepo
    {
        string _connectionString;
        public TodoRepo(string connectionString)
        {
            _connectionString = connectionString;
        }

     

        public void CreateTodo(string title, string discription, string status, int userid)
        {
            var procedure = "createtodo";
            var parameters = new DynamicParameters();
            parameters.Add("@Title", title, DbType.String, ParameterDirection.Input);
            parameters.Add("@Discreiption",discription, DbType.String, ParameterDirection.Input);
            parameters.Add("@Status",status, DbType.String, ParameterDirection.Input);
            parameters.Add("@UserId", userid, DbType.Int64, ParameterDirection.Input);
            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
                conn.Execute(procedure, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public bool DeleteTodo(int id)
        {
            var procedure = "deletebyid";
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id, DbType.Int64, ParameterDirection.Input);
            parameters.Add("@Result", dbType: DbType.Int32, direction: ParameterDirection.Output);
            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
                conn.Execute(procedure, parameters, commandType: CommandType.StoredProcedure);
            }
            var result = parameters.Get<int>("@Result");
            return result == 1 ? true : false;

        }

        public Todo GetTodo(int id)
        {
            var procedure = "Todobyid";
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id, DbType.Int64, ParameterDirection.Input);
            using (IDbConnection connection = new SqlConnection(_connectionString))
            {
                var result =connection.Query<Todo>(procedure, parameters,commandType:CommandType.StoredProcedure);
                return result.FirstOrDefault();
            }
        }

        public List<Todo> GetTodoById(int id)
        {
            var procedure = "usersallTodo";
            var parameters = new DynamicParameters();
            parameters.Add("@UserId",id,DbType.Int64, ParameterDirection.Input);
            using (IDbConnection connection = new SqlConnection(_connectionString))
            {
                var result = connection.Query< Todo > (procedure, parameters, commandType: CommandType.StoredProcedure).ToList();
                
                return result;
            }
        }

        public List<Todo> GetTodoByStatus(string status,int id)
        {
            var procedure = "filterbystatus";
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id, DbType.Int64, ParameterDirection.Input);
            parameters.Add("@Status", status, DbType.String, ParameterDirection.Input);
            using (IDbConnection connection = new SqlConnection(_connectionString))
            {
                var result = connection.Query<Todo>(procedure, parameters, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }

        public bool UpdateTodo(int id, string title, string discription, string status, int userid)
        {
            var procedure = "updatetodo";
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id, DbType.Int64, ParameterDirection.Input);
            parameters.Add("@Title", title, DbType.String, ParameterDirection.Input);
            parameters.Add("@Discreiption", discription, DbType.String, ParameterDirection.Input);
            parameters.Add("@Status", status, DbType.String, ParameterDirection.Input);
            parameters.Add("@UserId", userid, DbType.Int64, ParameterDirection.Input);
            parameters.Add("@Result", dbType: DbType.Int32, direction: ParameterDirection.Output);
            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
                conn.Execute(procedure, parameters, commandType: CommandType.StoredProcedure);
            }
            var result = parameters.Get<int>("@Result");
            return result == 1 ? true : false;
        }
    }
}
