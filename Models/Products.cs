using System;
using System.Collections.Generic;

namespace FunniShop.Models
{
    public class Products
    {
        public int Id { get; set; }
        public string ProductName { get; set; } = null!;
        public int ProductPrice { get; set; }
        public string? ProductDescription { get; set; }
        public string? ProductImageURL { get; set; } = null!;
    }
}