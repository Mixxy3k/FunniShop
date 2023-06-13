namespace FunniShop.Models
{
    public class Customer
    {
        public int Id { get; set; }
        public string CustomerName { get; set; } = null!;
        public string CustomerEmail { get; set; } = null!;
        public string CustomerPassword { get; set; } = null!;
        public string CustomerAddress { get; set; } = null!;
        public string CustomerPhone { get; set; } = null!;
        public ICollection<Order> Orders { get; set; } = null!;
    }
}