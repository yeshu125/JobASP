using System;

namespace JobASP.DataLayer
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<TEntity> Repository<TEntity>() where TEntity : class;

        void  Dispose(bool disposing);

        void Save();
    }
}
