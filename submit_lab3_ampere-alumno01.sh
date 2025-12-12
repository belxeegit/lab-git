#!/bin/bash 
#SBATCH --job-name=lab3_git 
#SBATCH --partition=hpc-bio-ampere 
#SBATCH --ntasks=4 
#SBATCH --cpus-per-task=1 
#SBATCH --time=00:10:00 
#SBATCH --output=slurm-%j.out
#SBATCH --chdir=/home/alumno01/lab-git

export OMP_NUM_THREADS=1 

echo "=== Inicio del trabajo ===" 
echo "Fecha: $(date)" 
echo "Nodo: $(hostname)" 
echo "Directorio: $(pwd)" 
echo "Tareas: $SLURM_NTASKS" 
echo "OMP_NUM_THREADS: $OMP_NUM_THREADS" 
echo ""

# Listar ficheros originales
echo "=== Ficheros originales ===" 
ls -lh *.fastq 
echo ""

# Array con los ficheros
FILES=(Sample1.fastq Sample2.fastq Sample3.fastq Sample4.fastq)

# Ejecutar en paralelo
echo "=== Procesando ficheros en paralelo ===" 
for FILE in "${FILES[@]}"; do 
	./file-cut.sh "$FILE" & 
done 
wait 

echo "" 
echo "=== Renombrando ficheros cortados ===" 
for FILE in "${FILES[@]}"; do
	if [ -f "${FILE}.cut" ]; then 
		mv "${FILE}.cut" "$FILE" 
		echo "Renombrado ${FILE}.cut -> $FILE" 
	fi 
done 
echo "" 

echo "=== Ficheros finales ===" 
ls -lh *.fastq 
echo "" 
echo "=== Fin del trabajo ==="
echo "Fecha: $(date)"
