using NextPassAPI.Data.DbContexts;
using NextPassAPI.Data.Repositories;
using NextPassAPI.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
// Mongodb 
builder.Services.Configure<MongoDbConfigs>(builder.Configuration.GetSection("MongodbConfigs"));
builder.Services.AddScoped(typeof(MongoDbContext<>));

// Dependency Indejection
builder.Services.AddServices();
builder.Services.AddRepositories();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
