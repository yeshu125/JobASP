using System;
using System.Collections;
using System.Data.Entity;

namespace JobASP.DataLayer
{
   public class UnitOfWork:IUnitOfWork
    {
        private readonly DbContext _context;
        private bool _disposed;
        private Hashtable _repositories;

        public UnitOfWork(DbContext context)
        {
            _context = context;
        }
        public UnitOfWork()
        {
            _context = new JobASPContext();
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public virtual void Dispose(bool disposing)
        {
            if (!_disposed)
                if (disposing)
                    _context.Dispose();

            _disposed = true;
        }

        public IRepository<TEntity> Repository<TEntity>() where TEntity : class
        {
            if (_repositories == null)
                _repositories = new Hashtable();

            var type = typeof(TEntity).Name;

            if (!_repositories.ContainsKey(type))
            {
                var repositoryType = typeof(Repository<>);

                var repositoryInstance =
                    Activator.CreateInstance(repositoryType.MakeGenericType(typeof(TEntity)), _context);

                _repositories.Add(type, repositoryInstance);
            }
            // If the repository for that Model class doesn't exist, create it
            return (IRepository<TEntity>)_repositories[type];
        }

        public void Save()
        {
            _context.SaveChanges();
        }
    }
}
