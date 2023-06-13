namespace FunniShop.Models
{
    public class Order
    {
        public int Id { get; set; }
        public Customer Customer { get; set; } = null!;
        public Product Product { get; set; } = null!;
        public int Quantity { get; set; }
    }
}