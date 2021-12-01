#Esto es una manera de declarar una variable X = T_1 (el tiempo de 1 thread de eigen sin blas).

set table "/dev/null"
X=0
X_row=0
X_col=3
plot "eigen.txt" using (($0==X_row)?(X=column(X_col),X):0)
unset table

#Ahora, sí, la gráfica:

set title 'Wall time vs number of threads, 6/12 (core/thread) computer (#37)'
set xlabel 'Number of threads'; set ylabel 'Scaling of wall time'
set grid
set term png; set out 'scaling.png'
plot 'eigen.txt' u 1:(X/$3) w l t 'eigen', 'eigen_blas.txt' u 1:(X/$3) w l t 'eigen with blas'
