namespace FunniShop.Models
{
    public class CustomerAdress
    {
        public int Id { get; set; }
        public Customer Customer { get; set; } = null!;
        public Adress Adress { get; set; } = null!;
    }
}