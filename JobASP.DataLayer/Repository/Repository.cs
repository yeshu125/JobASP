using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace JobASP.DataLayer
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        private readonly IDbContext _context;
        private readonly IDbSet<TEntity> _dbset;

        public Repository(IDbContext context)
        {
            _context = context;
            _dbset = context.Set<TEntity>();
        }

        public virtual IEnumerable<TEntity> GetAll()
        {
            return _dbset;
        }

        public TEntity FindById(int id)
        {
            return _dbset.Find(id);
        }

        public virtual void Insert(TEntity entity)
        {
            _dbset.Add(entity);
        }

        public virtual void Delete(TEntity entity)
        {
            var entry = _context.Entry(entity);
            entry.State = EntityState.Deleted;
            _dbset.Remove(entity);
        }

        public virtual void DeleteAll(IEnumerable<TEntity> entity)
        {
            foreach (var ent in entity)
            {
                var entry = _context.Entry(ent);
                entry.State = EntityState.Deleted;
                _dbset.Remove(ent);
            }
        }

        public virtual void Update(TEntity entity)
        {
            var entry = _context.Entry(entity);
            _dbset.Attach(entity);
            entry.State = EntityState.Modified;
        }

        public virtual bool Any()
        {
            return _dbset.Any();
        }

        public virtual int ExecuteProcedure(string Query, params object[] Parameters)
        {
            var con = new JobASPContext();
            return con.Database.ExecuteSqlCommand(Query, Parameters);
        }

        public virtual IEnumerable<TEntity> ExecuteProcedureForList(string Query, params object[] Parameters)
        {
            var con = new JobASPContext();
            return con.Database.SqlQuery<TEntity>(Query, Parameters);
        }
    }
}
