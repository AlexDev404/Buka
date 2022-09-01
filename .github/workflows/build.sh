i=0
shopt -s extglob
THISSCRIPT=buildCheck_new.sh
FILE=build_win0.tar.gz
sudo apt-get install tar

function checkfile {
if [ -f "$FILE" ]; then
	echo "$FILE exists."
	i=$((i+1))
	FILE=build_win${i}.tar.gz
	checkfile

else
	clearName="build_win-latest.tar.gz"

if [ -f "$clearName" ]; then
	echo "[CREATE] Renaming old 'LATEST' build... to $FILE"
	mv ${clearName} ${FILE}
fi
	echo "[CREATE] Creating NEW 'LATEST' build..."
    	tar -czvf ${clearName} build
	
fi
}
checkfile