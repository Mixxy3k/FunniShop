namespace FunniShop.Data;

using FunniShop.Models;
using Microsoft.EntityFrameworkCore;

public class ShopDbContext: DbContext
{
    public ShopDbContext(DbContextOptions<ShopDbContext> options) : base(options)
    {
    }

    public ShopDbContext()
    {
    }

    public DbSet<Products> Products { get; set; } = null!;
    public DbSet<Customer> Customers { get; set; } = null!;
    public DbSet<Adress> Adresses { get; set; } = null!;
    public DbSet<Order> Orders { get; set; } = null!;
    public DbSet<OrderItem> OrderItems { get; set; } = null!;
    public DbSet<CustomerAdress> CustomerAdresses { get; set; } = null!;
}