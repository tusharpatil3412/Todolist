using Microsoft.VisualBasic;
using TodoAPIBAL;
using TodoAPIDAL;

namespace TodoAPI
{
    public static class ServicesExtention
    {
        public static void RegisterRepos( this IServiceCollection collection ,ConfigurationManager configuration)
        {
            var connectionString = configuration["ConnectionStrings:Todo_DB_Connection"];

            collection.AddTransient<IUserdetailservice, UserdetailService>();
            collection.AddTransient<IUserdetailRrpo>(s => new UserdetailRepo(connectionString));
            collection.AddTransient<ITodoService, TodoService>();
            collection.AddTransient<ITodoRepo>(s => new TodoRepo(connectionString));



        }
    }
}
