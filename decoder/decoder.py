# Abraham Magaña Hernández - Equipo #1
# Seminario de Solución de Problemas de Arquitectura de Computadoras - D13
# Python 3.9.2 - 03/06/2021
# Decodificador de Instrucciones de Tipo R y Tipo I (solo R en lenguaje máquina) al momento.

# Librerias Importadas para la GUI.
from tkinter import *
from tkinter.ttk import Combobox
from typing import MappingView

# La variable más importante del programa, sin ella los mensajes no se actualizan.
delete=False

# Esta función limpia las labels para que no se vayan acumulando cada vez que se actualiza un mensaje.
def clear(function):
    global delete
    function.destroy()
    delete=False

# Esta función abre la ventana para las Instrucciones de Tipo R y su desarrollo.
def RTypeFunc():
    global mainTitle,RTypeDesign,RType,Block,ROutput,mainWindow,delete,InsSave
    global OpCode,OpCodeIn,RSBits,RSBitsIn,RDBits,RDBitsIn,RTBits,RTBitsIn,ShamtBits,ShamtBitsIn,Funct,FunctIn
    delete=False
    InsSave=False
    root.destroy()

    # Configuración de la nueva ventana.

    mainWindow=Tk()
    mainWindow.title("R Type Instruction Decoder")
    mainWindow.geometry("600x350")
    mainWindow.config(bg="#3464eb")
    mainWindow.resizable(0,0)
    
    # Configuración Gráfica de la Ventana y las Entradas de Datos Default

    mainTitle=PhotoImage(file="MipsTitle.gif")
    mainLabel=Label(mainWindow,image=mainTitle,bg="#3464eb")
    mainLabel.place(x=0,y=3)
    RType=PhotoImage(file="R3.gif")
    RTypeDesign=PhotoImage(file="R2.gif")
    Label(mainWindow,image=RType,bg="#3464eb").place(x=100,y=120)
    Label(mainWindow,image=RTypeDesign,bg="#3464eb").place(x=100,y=150)
    OpCode=Entry(mainWindow,width=12)
    OpCode.insert(0,"000000")
    OpCode.config(state=DISABLED)
    OpCode.place(x=107,y=180)
    RSBits=Entry(mainWindow,width=10)
    RSBits.insert(0,"000000")
    RSBits.config(state=DISABLED)
    RSBits.place(x=178,y=180)
    RTBits=Entry(mainWindow,width=10)
    RTBits.insert(0,"000000")
    RTBits.config(state=DISABLED)
    RTBits.place(x=242,y=180)
    RDBits=Entry(mainWindow,width=10)
    RDBits.insert(0,"000000")
    RDBits.config(state=DISABLED)
    RDBits.place(x=302,y=180)
    ShamtBits=Entry(mainWindow,width=10)
    ShamtBits.insert(0,"000000")
    ShamtBits.config(state=DISABLED)
    ShamtBits.place(x=362,y=180)
    Funct=Entry(mainWindow,width=11)
    Funct.insert(0,"000000")
    Funct.config(state=DISABLED)
    Funct.place(x=425,y=180)
    ROutput=PhotoImage(file="R1.gif")
    R3=Label(mainWindow,image=ROutput,bg="#3464eb")
    R3.place(x=100,y=210)

    # Apartado de Input, aquí entran los valores en decimal en los widget y también su diseño.

    OpCodeIn=Entry(mainWindow,width=12)
    OpCodeIn.insert(0,"Default")
    OpCodeIn.config(state=DISABLED)
    OpCodeIn.place(x=107,y=245)
    RSBitsIn=Entry(mainWindow,width=10)
    RSBitsIn.place(x=178,y=245)
    RTBitsIn=Entry(mainWindow,width=10)
    RTBitsIn.place(x=242,y=245)
    RDBitsIn=Entry(mainWindow,width=10)
    RDBitsIn.place(x=302,y=245)
    ShamtBitsIn=Entry(mainWindow,width=10)
    ShamtBitsIn.insert(0,"Default")
    ShamtBitsIn.config(state=DISABLED)
    ShamtBitsIn.place(x=362,y=245)
    FunctIn=Combobox(mainWindow,width=8,values=["ADD","SUB","AND","OR","SLT","XOR","DIV","MULT","SHIFTL"])
    FunctIn.place(x=425,y=245)

    # Botones de Funciones, aquí se empieza a trabajar con los valores colocados ya en binario.

    Button(mainWindow,text="Convert",width=10,command=convertR).place(x=170,y=290)
    Button(mainWindow,text="Save",width=10,command=savedR).place(x=260,y=290)
    Button(mainWindow,text="Reset",width=10,command=reset).place(x=350,y=290)

def ITypeFunc():
    global mainTitle,ITypeDesign,IType,Block,IOutput,mainWindow,delete,InsSave
    global OpCode,OpCodeIn,RSBits,RSBitsIn,RDBits,RDBitsIn,RTBits,RTBitsIn,Funct,FunctIn
    delete=False
    InsSave=False
    root.destroy()

    # Configuración de la nueva ventana.

    mainWindow=Tk()
    mainWindow.title("I Type Instruction Decoder")
    mainWindow.iconbitmap("icon.ico")
    mainWindow.geometry("600x350")
    mainWindow.config(bg="#3464eb")
    mainWindow.resizable(0,0)
    
    # Configuración Gráfica de la Ventana y las Entradas de Datos Default

    mainTitle=PhotoImage(file="MipsTitle.gif")
    mainLabel=Label(mainWindow,image=mainTitle,bg="#3464eb")
    mainLabel.place(x=0,y=3)
    IType=PhotoImage(file="I3.gif")
    ITypeDesign=PhotoImage(file="I2.gif")
    Label(mainWindow,image=IType,bg="#3464eb").place(x=100,y=120)
    Label(mainWindow,image=ITypeDesign,bg="#3464eb").place(x=100,y=150)
    OpCode=Entry(mainWindow,width=12)
    OpCode.insert(0,"000000")
    OpCode.config(state=DISABLED)
    OpCode.place(x=107,y=180)
    RSBits=Entry(mainWindow,width=10)
    RSBits.insert(0,"000000")
    RSBits.config(state=DISABLED)
    RSBits.place(x=178,y=180)
    RTBits=Entry(mainWindow,width=10)
    RTBits.insert(0,"000000")
    RTBits.config(state=DISABLED)
    RTBits.place(x=242,y=180)
    Funct=Entry(mainWindow,width=32)
    Funct.insert(0,"0000000000000000")
    Funct.config(state=DISABLED)
    Funct.place(x=302,y=180)
    IOutput=PhotoImage(file="I1.gif")
    I3=Label(mainWindow,image=IOutput,bg="#3464eb")
    I3.place(x=100,y=210)

    # Apartado de Input, aquí entran los valores en decimal en los widget y también su diseño.

    OpCodeIn=Combobox(mainWindow,width=8,values=["ADDI","ORI","ANDI","SLTI","LW","SW","BEQ"])
    OpCodeIn.place(x=107,y=244)
    RSBitsIn=Entry(mainWindow,width=10)
    RSBitsIn.place(x=178,y=245)
    RTBitsIn=Entry(mainWindow,width=10)
    RTBitsIn.place(x=242,y=245)
    FunctIn=Entry(mainWindow,width=32)
    FunctIn.place(x=302,y=245)

    # Botones de Funciones, aquí se empieza a trabajar con los valores colocados ya en binario.

    Button(mainWindow,text="Convert",width=10,command=convertI).place(x=170,y=290)
    Button(mainWindow,text="Save",width=10,command=savedI).place(x=260,y=290)
    Button(mainWindow,text="Reset",width=10,command=reset).place(x=350,y=290)

# Esta función convierte los valores de decimal a binario y también rellena con ceros si hace falta.
def convertR():
    global delete,InfoLabel,Instruction,InsSave,RSIn,RTIn,RDIn,FunctText
    RSIn=RSBitsIn.get()
    RTIn=RTBitsIn.get()
    RDIn=RDBitsIn.get()
    FunctText=FunctIn.get()

    # Transformamos el texto en un case gigante a su codigo en binario (solo funct).

    if FunctText=="ADD":
        FunctOut="100000"
    elif FunctText=="SUB":
        FunctOut="100010"
    elif FunctText=="AND":
        FunctOut="100100"
    elif FunctText=="OR":
        FunctOut="100101"
    elif FunctText=="SLT":
        FunctOut="101010"
    elif FunctText=="XOR":
        FunctOut="100110"
    elif FunctText=="DIV":
        FunctOut="011010"
    elif FunctText=="MULT":
        FunctOut="011000"
    elif FunctText=="SHIFTL":
        FunctOut="010000"
    else:
        FunctOut="No Value"
        
    binary(RSIn)
    RSBits.config(state=NORMAL)
    RSBits.delete(0,END)
    if len(y)<5:
        RSOut=y.zfill(5)
    elif len(y)>5:
        RSOut="Too Long"
    else:
        RSOut=y
    RSBits.insert(0,RSOut)
    RSBits.config(state=DISABLED)

    binary(RTIn)
    RTBits.config(state=NORMAL)
    RTBits.delete(0,END)
    if len(y)<5:
        RTOut=y.zfill(5)
    elif len(y)>5:
        RTOut="Too Long"
    else:
        RTOut=y
    RTBits.insert(0,RTOut)
    RTBits.config(state=DISABLED)

    binary(RDIn)
    RDBits.config(state=NORMAL)
    RDBits.delete(0,END)
    if len(y)<5:
        RDOut=y.zfill(5)
    elif len(y)>5:
        RDOut="Too Long"
    else:
        RDOut=y
    RDBits.insert(0,RDOut)
    RDBits.config(state=DISABLED)

    Funct.config(state=NORMAL)
    Funct.delete(0,END)
    Funct.insert(0,FunctOut)
    Funct.config(state=DISABLED)

    # Se crea una Instrucción RAW ya en binario con sus elemtos corregidos.

    Instruction=str("000000"+str(RSOut)+str(RTOut)+str(RDOut)+"00000"+FunctOut)

    # Se compara si la Instrucción es Correcta o si hay algún error para que no se pueda guardar.

    if len(Instruction)==32:
        # Este "token" hace que la instrucción no se pueda guardar si es que no es de 32 bits.
        InsSave=True
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Instrucción Creada!",fg="white",bg="#3464eb")
        InfoLabel.place(x=245,y=320)
        delete=True
    else:
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Hay un Error en tu Instrucción!",fg="white",bg="#3464eb")
        InfoLabel.place(x=215,y=320)
        delete=True

def convertI():
    global delete,InfoLabel,RSIn,RTIn,FunctText,InsSave,Instruction,OPCIn,FunctOut,FunctText
    OPCIn=OpCodeIn.get()
    RSIn=RSBitsIn.get()
    RTIn=RTBitsIn.get()
    FunctText=FunctIn.get()

    if OPCIn=="LW":
        OpCodeOut="110001"
    elif OPCIn=="SW":
        OpCodeOut="110101"
    elif OPCIn=="BEQ":
        OpCodeOut="001000"
    elif OPCIn=="ADDI":
        OpCodeOut="001000"
    elif OPCIn=="ANDI":
        OpCodeOut="001100"
    elif OPCIn=="ORI":
        OpCodeOut="001101"
    elif OPCIn=="SLTI":
        OpCodeOut="001010"
    else:
        OpCodeOut="No Value"

    binary(RSIn)
    RSBits.config(state=NORMAL)
    RSBits.delete(0,END)
    if len(y)<5:
        RSOut=y.zfill(5)
    elif len(y)>5:
        RSOut="Too Long"
    else:
        RSOut=y
    RSBits.insert(0,RSOut)
    RSBits.config(state=DISABLED)

    binary(RTIn)
    RTBits.config(state=NORMAL)
    RTBits.delete(0,END)
    if len(y)<5:
        RTOut=y.zfill(5)
    elif len(y)>5:
        RTOut="Too Long"
    else:
        RTOut=y
    RTBits.insert(0,RTOut)
    RTBits.config(state=DISABLED)

    binary(FunctText)
    Funct.config(state=NORMAL)
    Funct.delete(0,END)
    if len(y)<16:
        FunctOut=y.zfill(16)
    elif len(y)>16:
        FunctOut="Too Long"
    else:
        FunctOut=y
    Funct.insert(0,FunctOut)
    Funct.config(state=DISABLED)

    OpCode.config(state=NORMAL)
    OpCode.delete(0,END)
    OpCode.insert(0,OpCodeOut)
    OpCode.config(state=DISABLED)

    Instruction=str(OpCodeOut+str(RSOut)+str(RTOut)+str(FunctOut))

    if len(Instruction)==32:
        InsSave=True
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Instrucción Creada!",fg="white",bg="#3464eb")
        InfoLabel.place(x=245,y=320)
        delete=True
    else:
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Hay un Error en tu Instrucción!",fg="white",bg="#3464eb")
        InfoLabel.place(x=215,y=320)
        delete=True

# Esta función guarda las intrucciones que esten establecidas y que tengan 32 bits mientras lo preciones.  
def savedR():
    global Instruction,delete,mainWindow,InfoLabel,InsSave

    if InsSave==True:
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Instrucción Guardada!",fg="white",bg="#3464eb")
        InfoLabel.place(x=240,y=320)
        delete=True
    else:
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Error al Guardar Instrucción!",fg="white",bg="#3464eb")
        InfoLabel.place(x=215,y=320)
        delete=True
        InsSave=False
    if len(Instruction)==32:
        logs=open("Memory.txt","a")
        machinecode=open("MachineCode.txt","a")
        firstIndex=-8
        secondIndex=0
        MachineWrite=True
        for i in range(0,4):
            if MachineWrite==True:
                machinecode.write(FunctText.lower()+" $"+RDIn+" $"+RSIn+" $"+RTIn+str("\n"))
                MachineWrite=False
            else:
                machinecode.close()
            firstIndex=firstIndex+8
            secondIndex=secondIndex+8    
            logs.write(Instruction[firstIndex:secondIndex]+str("\n"))
    else:
        pass

def savedI():
    global Instruction,delete,mainWindow,InfoLabel,InsSave
    if InsSave==True:
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Instrucción Guardada!",fg="white",bg="#3464eb")
        InfoLabel.place(x=240,y=320)
        delete=True
    else:
        if delete==False:
            pass
        else:
            clear(InfoLabel)
        InfoLabel=Label(mainWindow,text="¡Error al Guardar Instrucción!",fg="white",bg="#3464eb")
        InfoLabel.place(x=215,y=320)
        delete=True
        InsSave=False
    if len(Instruction)==32:
        logs=open("Memory.txt","a")
        machinecode=open("MachineCode.txt","a")
        firstIndex=-8
        secondIndex=0
        MachineWrite=True
        for i in range(0,4):
            if MachineWrite==True:
                machinecode.write(OPCIn.lower()+" $"+RSIn+" $"+RTIn+" $ #"+FunctText+str("\n"))
                MachineWrite=False
            else:
                machinecode.close()
            firstIndex=firstIndex+8
            secondIndex=secondIndex+8    
            logs.write(Instruction[firstIndex:secondIndex]+str("\n"))
    else:
        pass

# Este botón resetea completamente el archivo donde se guardan las intrucciones.
def reset():
    global delete,InfoLabel
    if delete==False:
            pass
    else:
        clear(InfoLabel)
    InfoLabel=Label(mainWindow,text="¡Archivo Reseteado!",fg="white",bg="#3464eb")
    InfoLabel.place(x=245,y=320)
    delete=True
    logs=open("Memory.txt","w")
    logs.close()

# Esta función sirve para corregir el formato de bits que da python, borrando su formado 0bx a x solamente.
def binary(x):
    global y
    y=bin(int(x))[2:]
    return y

# Esta función compara y envia dependiendo que Instrucción quieras desarrollar (por ahora solo Tipo R)    
def accept():
    global option,delete,msgLabel,root
    option=insBox.get()
    wait=Label()
    if option in [" Instrucción Tipo R"]:
        if delete==False:
            pass
        else:
            clear(msgLabel)
        msgLabel=Label(root,text="¡Instrucción de Tipo R!",fg="green1",bg="#3464eb")
        msgLabel.pack()
        delete=True
        RTypeFunc()
    elif option in [" Instrucción Tipo I"]:
        if delete==False:
            pass
        else:
            clear(msgLabel)
        msgLabel=Label(root,text="¡Instrucción de Tipo I!",fg="green1",bg="#3464eb")
        msgLabel.pack()
        delete=True
        ITypeFunc()
    elif option in [" Instrucción Tipo J"]:
        if delete==False:
            pass
        else:
            clear(msgLabel)
        msgLabel=Label(root,text="¡Instrucción de Tipo J!",fg="green1",bg="#3464eb")
        msgLabel.pack()
        delete=True
    else:
        if delete==False:
            pass
        else:
            clear(msgLabel)
        msgLabel=Label(root,text="¡Ingresa una Instrucción Válida!",fg="white",bg="#3464eb")
        msgLabel.pack()
        delete=True

# Ventana Principal, aquí elegimos que Tipo de Instruccion vamos a desarrollar.
root=Tk()
root.title("Decoder - Instruction Maker")
root.geometry("400x235")
root.config(bg="#3464eb")
root.resizable(0,0)

imageTitle=PhotoImage(file="ImageMain.gif")
LabelTop=Label(root,image=imageTitle,bg="#3465eb")
LabelTop.pack(pady=10)
SecondTitle=PhotoImage(file="SecondTitle.gif")
LabelTop2=Label(root,image=SecondTitle,bg="#3465eb")
LabelTop2.pack()
Instructions=[" Instrucción Tipo R"," Instrucción Tipo I"," Instrucción Tipo J"]
insBox=Combobox(root,values=Instructions)
insBox.pack()
Button(root,text="Accept",font=("Calibri",10),command=accept).pack(pady=5)

root.mainloop()
