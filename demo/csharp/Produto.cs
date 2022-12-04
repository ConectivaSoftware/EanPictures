using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EanPictures
{
    public class Produto
    {
        public string? Status { get; set; }
        public string? Status_Desc { get; set; }
        public string? Nome { get; set; }
        public string? Ncm { get; set; }
        public string? Cest_Codigo { get; set; }
        public string? Embalagem { get; set; }
        public string? QuantidadeEmbalagem { get; set; }
        public string? Marca { get; set; }
        public string? Categoria { get; set; }
        public string? Peso { get; set; }
        public string? id_categoria { get; set; }
        public string? tributacao { get; set; }
        public byte[]? foto { get; set; }
    }
}
