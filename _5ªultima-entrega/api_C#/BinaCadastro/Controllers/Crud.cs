using BinaCadastro.Data;
using BinaCadastro.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

[ApiController]
[Route("api/[controller]")]
public class CadastroController : ControllerBase
{
    private readonly DataContext _context;

    public CadastroController(DataContext context)
    {
        _context = context;
    }

    // GET: api/Cadastro
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Cadastro>>> GetCadastro()
    {
        return await _context.BinaCadastro.ToListAsync();
    }

    // GET: api/Cadastro/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Cadastro>> GetCadastro(int id)
    {
        var cadastro = await _context.BinaCadastro.FindAsync(id);

        if (cadastro == null)
        {
            return NotFound();
        }

        return cadastro;
    }

    // POST: api/Cadastro
    [HttpPost]
    public async Task<ActionResult<Cadastro>> PostCadastro(Cadastro cadastro)
    {
        _context.BinaCadastro.Add(cadastro);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetCadastro), new { id = cadastro.Id }, cadastro);
    }

    // PUT: api/Cadastro/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutCadastro(int id, Cadastro cadastro)
    {
        if (id != cadastro.Id)
        {
            return BadRequest();
        }

        _context.Entry(cadastro).State = EntityState.Modified;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!CadastroExists(id))
            {
                return NotFound();
            }
            else
            {
                throw;
            }
        }

        return NoContent();
    }

    // DELETE: api/Cadastro/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteCadastro(int id)
    {
        var cadastro = await _context.BinaCadastro.FindAsync(id);
        if (cadastro == null)
        {
            return NotFound();
        }

        _context.BinaCadastro.Remove(cadastro);
        await _context.SaveChangesAsync();

        return NoContent();
    }

    private bool CadastroExists(int id)
    {
        return _context.BinaCadastro.Any(e => e.Id == id);
    }
}
