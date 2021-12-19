import discord
from discord.ext import commands

# Inicializaciones

bot=commands.Bot(command_prefix="-")
bot.remove_command("help")

@bot.event
async def on_ready():
    await bot.change_presence(activity=discord.Game(name="¡Computación! | -help"))

@bot.event
async def on_command_error(ctx, error): 
    if isinstance(error, commands.CommandNotFound):
        await ctx.send(f"```diff\n- No conozco ese comando :(\n```")

# Comandos Generales

@bot.command()
async def help(ctx):
    embed=discord.Embed(colour=discord.Colour.green())
    thumbnail="https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Circle-icons-computer.svg/768px-Circle-icons-computer.svg.png"
    embed.set_thumbnail(url=thumbnail)
    embed.set_author(name="Esta es una Lista de todos los Comandos Disponibles :")
    embed.add_field(name="_-ping_", value="Muestra la Latencia del Bot al Servidor!", inline=False)
    embed.add_field(name="_-mips_", value="Decodifica una Instrucción de MIPS!", inline=False)
    embed.add_field(name="_-bi_", value="Convierte un número decimal a binario!", inline=False)
    embed.add_field(name="_-hexa_", value="Convierte un número decimal a hexa!", inline=False)
    embed.add_field(name="_-prom_", value="Calculo del Promedio de Tres Parciales!", inline=False)
    embed.add_field(name="_-clear_", value="Limpia los mensajes de un canal de texto!", inline=False)
    embed.set_image(url="https://i.gyazo.com/9feb38bdc5d70bdb93005b5d95c7345f.png")
    await ctx.send(embed=embed)

@bot.command() 
async def clear(ctx, amount : int):
    limite=amount+1
    await ctx.channel.purge(limit=limite)
    if amount==1:
        await ctx.send(f"```diff\n- ¡Se ha eliminado {amount} mensaje! :)\n```")
    else:
        await ctx.send(f"```diff\n- ¡Se han eliminado {amount} mensajes! :)\n```")

@clear.error
async def clear_error(ctx, error):
    if isinstance(error, commands.MissingRequiredArgument):
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```\nEjemplo :\n -clear 10 \n Este comando eliminaria 10 mensajes!\n```")

@bot.command()
async def ping(ctx):
    await ctx.send(f"```\n¡Tengo una latencia de {round(bot.latency * 1000)}ms! :)\n```")

# Calificaciones

@bot.command()
async def prom(ctx,x:float,y:float,z:float):
    promedio=[]
    promedio.append(x)
    promedio.append(y)
    promedio.append(z)
    promediofinal=sum(promedio)/len(promedio)
    promediofinal=str(round(promediofinal,2))
    if x>100 or y>100 or z>100:
        await ctx.send(f"```diff\n- ¡Las calificaciones de los parciales no pueden ser mayores a cien!\n```")
    elif x<0 or y<0 or z<0:
        await ctx.send(f"```diff\n- ¡Las calificaciones de los parciales no pueden ser menores a cero!\n```")
    else:
        await ctx.send(f"```\nConversión de Promedio de Tres Parciales :\n\n -Alumno : {ctx.author.name}\n\n -Parcial #1 = {x}\n -Parcial #2 = {y}\n -Parcial #3 = {z}\n\n -Promedio Final = {promediofinal}\n\n```")
        await ctx.send(f"```\n ¡Conversión Exitosa! :)\n```")

@prom.error
async def prom(ctx, error):
    if isinstance(error, commands.MissingRequiredArgument):
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```\nEjemplo :\n -prom 100 90 85\n Este comando calcularía un promedio de 91.67!\n```")

# Arquitectura de Computadoras 

@bot.command()
async def bi(ctx,zeros:int,decimal:int):
    binario=bin(int(decimal))[2:]
    binario=binario.zfill(zeros)
    await ctx.send(f"```\nConversión de Decimal a Binario :\n\n -Número Original : {decimal}\n -Número en Binario : {binario}\n -Representado en {zeros} bits\n\n```")
    await ctx.send(f"```\n ¡Conversión Exitosa! :)\n```")

@bi.error
async def bi(ctx, error):
    if isinstance(error, commands.MissingRequiredArgument):
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```\nEjemplo :\n -bi 8 10\n Este comando convertiria el 10 a binario en formato de 8 bits!\n```")

@bot.command()
async def hexa(ctx,num:int):
    hexa=hex(num)
    await ctx.send(f"```\nConversión de Decimal a Hexadecimal :\n\n -Número Original : {num}\n -Número en Hexadecimal : {hexa}\n\n```")
    await ctx.send(f"```\n ¡Conversión Exitosa! :)\n```")

@hexa.error
async def hexa(ctx, error):
    if isinstance(error, commands.MissingRequiredArgument):
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```\nEjemplo :\n -hexa 10\n Este comando convertiria el 10 a Hexadecimal!\n```")

@bot.command()
async def mips(ctx,instruction:str):
    if len(instruction)==32:
        if instruction[0:6] in ["000000"]:
            Tipo="R"
            if instruction[25:31]=="100000":
               funct="ADD"
            elif instruction[25:31]=="100010":
                funct="SUB"
            elif instruction[25:31]=="100100":
                funct="AND"
            elif instruction[25:31]=="100101":
                funct="OR"
            elif instruction[25:31]=="101010":
                funct="SLT"
            elif instruction[25:31]=="100110":
                funct="XOR"
            elif instruction[25:31]=="011010":
                funct="DIV"
            elif instruction[25:31]=="011000":
                funct="MULT"
            elif instruction[25:31]=="010000":
                funct="SHIFTL"
            else:
                funct=f"Error - No existe función para : {instruction[25:31]}"

            if instruction[20:25]!="00000":
                shamt=f"Error - El Shamt es diferente de 00000"
            else:
                shamt="00000"

            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -RD = {instruction[16:21]}\n -Shamt = {shamt}\n -Funct = {funct}\n```")
            await ctx.send(f"```\n ¡Detección Exitosa!\n```")
        
        elif instruction[0:6] in ["001000"]: #addi
            Tipo="I"
            funct="ADDI"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["001100"]: #andi
            Tipo="I"
            funct="ANDI"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["001101"]: #ori
            Tipo="I"
            funct="ORI"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["001110"]: #xori
            Tipo="I"
            funct="XORI"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["001010"]: #slti
            Tipo="I"
            funct="SLTI"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["000100"]: #beq
            Tipo="I"
            funct="BEQ"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["110001"]: #lw
            Tipo="I"
            funct="LW"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        elif instruction[0:6] in ["101011"]: #sw
            Tipo="I"
            funct="SW"
            await ctx.send(f"```\nDetector de Instrucciones MIPS :\n\n -Instrucción : {instruction}\n -Tipo : {Tipo}\n -OpCode = {instruction[0:6]}\n -RS = {instruction[6:11]}\n -RT = {instruction[11:16]}\n -Offset = {instruction[16:32]}\n -Funct = {funct}\n```")
        else:
            await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
            await ctx.send(f"```diff\n- No existe un OpCode registrado para {instruction[0:6]}\n\n```")
    elif len(instruction)<32:
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```diff\n- La Instrucción contiene menos de 32 bits!\n\n```")
    elif len(instruction)>32:
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```diff\n- La Instrucción contiene más de 32 bits!\n\n```")
    else:
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")

@mips.error
async def mips(ctx, error):
    if isinstance(error, commands.MissingRequiredArgument):
        await ctx.send(f"```diff\n- Error de Sintaxis!\n\n```")
        await ctx.send(f"```\nEjemplo :\n -mips 00101000000010010000000000001010\n Este comando daría como output una Instrucción de Tipo R!\n```")

bot.run("")