import pandas as pd

DS_crudo = pd.read_csv('Gaming_Academic_Performance.csv')

print("- Buscar si hay algun dato nulo- \n",DS_crudo.isnull().sum())
print("- Buscar si hay duplicados- \n",DS_crudo.duplicated().sum())
print("\n -Ver cada tipo de dato- \n",DS_crudo.dtypes)


print(DS_crudo.describe())

#Se encontraron puntajes mayores a 100 (nota maxima)
print("\n Registros con puntaje mayor a 100: ",DS_crudo[DS_crudo["grades"] > 100].shape[0])
grades_desfasados = DS_crudo[DS_crudo["grades"] > 100]
print(grades_desfasados.head(3))

DS_crudo = DS_crudo[DS_crudo["grades"] <= 100]
print("Registros con puntaje mayor a 100 despues de limpieza: ",DS_crudo[DS_crudo["grades"] > 100].shape[0])

#se encontraron valores negativos en addiction_score
print("\n Registros con valores negativos e addiction_score: ",DS_crudo[DS_crudo["addiction_score"] < 0].shape[0])
as_desfasados = DS_crudo[DS_crudo["addiction_score"] < 0]
print(as_desfasados.head(3))

DS_crudo = DS_crudo[DS_crudo["addiction_score"] >= 0]
print("Registros con valores negativos e addiction_score despues de limpieza: ",DS_crudo[DS_crudo["addiction_score"] < 0].shape[0])

#Verificando que ninguno de los campos de textos tengan valores repetidos
print(DS_crudo["gender"].unique())
print(DS_crudo["stress_level"].unique())
print(DS_crudo["gaming_genre"].unique())


DS_crudo["AVG"] = (DS_crudo["sleep_hours"]+DS_crudo["gaming_hours"])/2
print(DS_crudo.head(3))

DS_crudo.to_parquet("Gaming_Academic_Performance_Limpio.parquet",index=False)
print("Archivo parquet guardado bajo el nombre 'Gaming_Academic_Performance_Limpio'")