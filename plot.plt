set term png
set xlabel "Hidden nodes"
set zlabel "Epochs"
set ylabel "Learning rate"
set output "plot.png"
set multiplot
set ticslevel 0
splot "res.txt" using 1:2:5 with points