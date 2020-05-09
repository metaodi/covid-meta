for sha in `git rev-list HEAD -- dashboard/dashboard.png`; do
    git show ${sha}:dashboard/dashboard.png > dashboard/export/${(l(5)(0))i}_dashboard.png
    (( i = i + 1 ))
done


cd dashboard/export

# create gif from all images
convert -delay 10 *.png -loop 0 movie.gif

# make gif small (size/4)
convert movie.gif -coalesce -resize 640x941 -fuzz 2% +dither -layers Optimize +map output.gif

mv output.gif dashboard-evolution.gif
