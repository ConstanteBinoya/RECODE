using BinaCadastro.Data;
using BinaCadastro.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        var host = Host.CreateDefaultBuilder(args)
            .ConfigureServices((context, services) =>
            {
                services.AddEndpointsApiExplorer();
                services.AddSwaggerGen();
                services.AddControllers();
                services.AddDbContext<DataContext>(options => options.UseMySql(context.Configuration.GetConnectionString("DefaultConnection"), ServerVersion.AutoDetect(context.Configuration.GetConnectionString("DefaultConnection"))));
            })
            .Build();

        var app = host.Services.GetRequiredService<IHostApplicationLifetime>();

        app.ApplicationStarted.Register(() =>
        {
            using (var scope = host.Services.CreateScope())
            {
                var serviceProvider = scope.ServiceProvider;
                var context = serviceProvider.GetRequiredService<DataContext>();

                // Aplica as migrações para garantir que o banco de dados esteja atualizado (não entendi as migrations)
                context.Database.Migrate();

            }
        });

        host.Run();

        // Testes no console após o término do aplicativo (tentativa de CRUD)
        await TestarApiAsync();
    }

    static async Task TestarApiAsync()
    {
        Console.WriteLine("Testando API de Cadastro");

        using (var httpClient = new HttpClient())
        {
            var cadastro = new Cadastro { Name = "Teste", Cpf = "12345678901" };

            // POST (Inserir novo cadastro)
            var response = await httpClient.PostAsync("http://localhost:5184/api/Cadastro",
                new StringContent(JsonConvert.SerializeObject(cadastro), Encoding.UTF8, "application/json"));
            response.EnsureSuccessStatusCode();
            Console.WriteLine("Cadastro criado com sucesso!");

            // GET (Visualiza todos os cadastros)
            var getCadastrosResponse = await httpClient.GetAsync("http://localhost:5184/api/Cadastro");
            getCadastrosResponse.EnsureSuccessStatusCode();
            var cadastros = JsonConvert.DeserializeObject<List<Cadastro>>(await getCadastrosResponse.Content.ReadAsStringAsync());
            Console.WriteLine($"Lista de cadastros: {string.Join(", ", cadastros.Select(c => c.Name))}");

            // GET (Visualiza um cadastro específico)
            var getCadastroResponse = await httpClient.GetAsync($"http://localhost:5184/api/Cadastro/{cadastros.First().Id}");
            getCadastroResponse.EnsureSuccessStatusCode();
            var cadastroRecuperado = JsonConvert.DeserializeObject<Cadastro>(await getCadastroResponse.Content.ReadAsStringAsync());
            Console.WriteLine($"(um cadastro): {cadastroRecuperado.Name}, {cadastroRecuperado.Cpf}");

            // PUT (Edita um cadastro específico pelo seu Id)
            cadastroRecuperado.Name = "TesteAtualizado";
            var putResponse = await httpClient.PutAsync($"http://localhost:5184/api/Cadastro/{cadastroRecuperado.Id}",
                new StringContent(JsonConvert.SerializeObject(cadastroRecuperado), Encoding.UTF8, "application/json"));
            putResponse.EnsureSuccessStatusCode();
            Console.WriteLine("Cadastro atualizado com sucesso!");

            // DELETE (Apaga um cadastro existente)
            var deleteResponse = await httpClient.DeleteAsync($"http://localhost:5184/api/Cadastro/{cadastroRecuperado.Id}");
            deleteResponse.EnsureSuccessStatusCode();
            Console.WriteLine("Cadastro excluído com sucesso!");
        }

        Console.WriteLine("Testes concluídos. Pressione qualquer tecla para sair.");
        Console.ReadKey();
    }
}
