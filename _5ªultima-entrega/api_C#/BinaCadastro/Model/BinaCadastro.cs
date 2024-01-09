using System.ComponentModel.DataAnnotations.Schema;

namespace BinaCadastro.Models
{
    [Table("cadastros")]
    public class Cadastro
    {
        [Column("id")]
        public int Id { get; set; }

        [Column("client_name")]
        public string Name { get; set; } = string.Empty;

        [Column("client_cpf")]
        public string Cpf { get; set; } = string.Empty;
    }
}
