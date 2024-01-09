using BinaCadastro.Models;
using Microsoft.EntityFrameworkCore;

namespace BinaCadastro.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }

        public DbSet<Cadastro> BinaCadastro { get; set; }
    }
}
