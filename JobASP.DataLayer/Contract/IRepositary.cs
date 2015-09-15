using System.Collections.Generic;

namespace JobASP.DataLayer
{
    public interface IRepository<TEntity> where TEntity : class
    {
        void Insert(TEntity entity);
        void Update(TEntity entity);
        void Delete(TEntity entity);
        void DeleteAll(IEnumerable<TEntity> entity);
        IEnumerable<TEntity> GetAll();
        TEntity FindById(int id);
        int ExecuteProcedure(string Query, params object[] Parameters);
        IEnumerable<TEntity> ExecuteProcedureForList(string Query, params object[] Parameters);
        bool Any();
    }
}
