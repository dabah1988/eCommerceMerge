using Ocelot.DependencyInjection;
using Ocelot.Middleware;
using Ocelot.Provider.Polly;

var builder = WebApplication.CreateBuilder(args);
//Add cors services
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(builder =>
    {
        builder.WithOrigins("http://localhost:4200")
        .AllowAnyMethod()
         .AllowCredentials()
        .AllowAnyHeader()
         .SetIsOriginAllowed(_ => true); // ⬅ utile si certaines policies strictes posent problème
        ;
    });
});
//builder.Configuration.AddJsonFile("ocelot.json",optional:false,reloadOnChange:true);
builder.Configuration.AddJsonFile("/ocelot/ocelot.json", optional: false, reloadOnChange: true);

builder.Services.AddOcelot()
    .AddPolly();
var app = builder.Build();
// ✅ Ajouter un message d’accueil sur la route racine
app.Use(async (context, next) =>
{
    if (context.Request.Path == "/")
    {
        context.Response.StatusCode = 200;
        context.Response.ContentType = "text/plain";
        await context.Response.WriteAsync("🚀 Bienvenue sur la Gateway API avec Ocelot !");
    }
    else
    {
        await next(); // laisse les autres routes passer à Ocelot
    }
});
app.UseCors();
app.UseHttpsRedirection();
app.UseHsts();
await app.UseOcelot();
app.Run();
