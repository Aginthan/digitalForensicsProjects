#! /bin/bash
cat << "EOF"
 $$$$$$\                                 $$\     $$\               $$\           $$\ $$\ $$\           $$\                      $$$$$$\
$$  __$$\                                $$ |    \__|              $$ | $\  $$ | \__|$$ |            $$ |                    $$  __$$\
$$ /  \__| $$$$$$\  $$\   $$\  $$$$$$\ $$$$$$\   $$\  $$$$$$$\     $$ |$$$\ $$ | $$\ $$ | $$$$$$$\ $$$$$$\                   $$ /  \__| $$$$$$\  $$$$$$\  $$\   $$\  $$$$$$\   $$$$$$\
$$ |      $$  __$$\ $$ |  $$ |$$  __$$\\_$$  _|  $$ |$$  _____|    $$ $$ $$\$$ | $$ |$$ |$$  _____|\_$$  _|                  $$ |       $$  __$$\ $$  __$$\ \$$\ $$  |$$  __$$\ $$  __$$\
$$ |      $$ |  \__|$$ |  $$ |$$ /  $$ | $$ |    $$ |$$ /          $$$$  _$$$$ | $$ |$$ |\$$$$$$\    $$ |                    $$ |       $$ /  $$ |$$ |  \__| \$$$$  / $$$$$$$$ |$$ |  \__|
$$ |  $$\ $$ |      $$ |  $$ |$$ |  $$ | $$ |$$\ $$ |$$ |          $$$  / \$$$ | $$ |$$ | \____$$\   $$ |$$\                 $$ |  $$\ $$ |  $$ |$$ |       \$$$  /  $$   ____|$$ |
\$$$$$$  |$$ |      \$$$$$$$ |$$$$$$$  | \$$$$  |$$ |\$$$$$$$\    $$  /   \$$ | $$ |$$ |$$$$$$$  |  \$$$$  |                \$$$$$$  |\$$$$$$  |$$ |        \$  /   \$$$$$$$\ $$ |
 \______/ \__|       \____$$ |$$  ____/   \____/ \__| \_______|   \__/     \__| \__|\__|\_______/    \____/                  \______/  \______/ \__|         \_/     \_______|\__|
                    $$\   $$ |$$ |
                    \$$$$$$  |$$ |
                     \______/ \__|
EOF

echo "Welcome to the Carving Script! (Hand Coded) 🔥"
echo ""

echo " -------------------------------------------------"
echo ""

echo " Please specify the Filetype to get the metadata from: "
echo ""

echo " (1) jpg "
echo " (2) png "
echo " (3) gif "
read -p " Select Options 1 - 3: " type

if [[ $type == "1" ]]; then
    $filetype=".jpg"
elif [[ $type == "2" ]]; then
    $filetype=".png"
elif [[ $type == "3" ]]; then
    $filetype=".gif"
fi

number=""
flags=""

while [[ $number != "q" ]]; do
    echo ""
    echo "Please specify the metadata that you want to base the carving on! Options >> "
    echo "(1) Make"
    echo "(2) CameraModelName"
    echo "(3) Artist"
    echo "(4) Creator"
    echo "(5) Type Yourself"
    read -p "Select from options (1 - 5), q to finish selection: " number
    if [[ "$number" == "1" ]]; then
        flags="$flags -Make"
    elif [[ "$number" == "2" ]]; then
        flags="$flags -CameraModelName"
    elif [[ "$number" == "3" ]]; then
        flags="$flags -Artist"
    elif [[ "$number" == "4" ]]; then
        flags="$flags -Creator"
    elif [[ "$number" == "5" ]]; then
        read -p " Your metadata, Use Camel Case: " new
        flags="$flags -$new"
    fi

done


read -p "Please Specify the path: " path
read -p "Please Specify the Filename: " outputfile

read -p " Please specify the search term or Press "Enter" to get all the information related to the Metadata: " operation

if [[ "$operation" == "" ]]; then
    exiftool -T -Filename $flags $path/*$filetype | grep -v "-" > $outputfile.txt
else
    exiftool -T -Filename $flags $path/*$filetype | grep -i "$operation" > $outputfile.txt
fi

echo ""
echo ""
echo " Few Minutes Please 🙏..................... "
echo ""
echo ""
echo "Done 😎😎😎😎😎😎😎😎 Please see the $outputfile.txt for the results"
