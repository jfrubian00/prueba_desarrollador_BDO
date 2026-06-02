#Programa para la creación de una lista de estudiantes y muestre la segunda nota mas baja

estudiantes = []
est_nota_baja = []

num_estudiantes = int(input("Cuantos estudiantes ingresará a la lista? (entre 2 a 5): "))

if (num_estudiantes>=2 and num_estudiantes<=5):

    for i in range(num_estudiantes):
        try:
            print("Estudiante #",i+1)
            nombre = input("Nombre: ")
            nota = float(input("Nota: "))

            estudiantes.append([nombre, nota])
        except Exception :
            print("Valor no valido, no se agregó el estudiante")

    notas_sin_rep = set(nota for (nombre,nota) in estudiantes)
    if len(notas_sin_rep) >= 2:
        notas_asc = sorted(notas_sin_rep)
        segunda_nota_baja = notas_asc[1]

        for estudiante in estudiantes:
            if (estudiante[1] == segunda_nota_baja):
                est_nota_baja.append(estudiante[0])

        est_nota_baja.sort()
        print ("Estudiante(s) con segunda nota mas baja")
        for nombre in est_nota_baja:
            print(nombre)
    else:   
        print("No existe una segunda nota más baja, todos tienen la misma nota")
        segunda_nota_baja = notas_sin_rep
    
else:
    print("Numero de estudiantes fuera de rango, deben ser entre 2 a 5 estudiantes")