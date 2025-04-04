#!/bin/bash

echo "Generating README.md..."
echo "# Wallpapers" > README.md
echo "" >> README.md
echo "<table>" >> README.md

shopt -s nullglob
count=0

for img in wallpapers/*.{png,jpg,jpeg}; do
    if [[ -f "$img" ]]; then
        if (( count % 3 == 0 )); then
            echo "<tr>" >> README.md
        fi

        echo "<td align=\"center\" width=\"5\">" >> README.md
        echo "<img src=\"$img\" width=\"200px\"><br>$(basename "$img")" >> README.md
        echo "</td>" >> README.md

        if (( count % 3 == 2 )); then
            echo "</tr>" >> README.md
        fi

        ((count++))
    fi
done

if (( count % 3 != 0 )); then
    echo "</tr>" >> README.md
fi

echo "</table>" >> README.md
echo "README.md updated!"
