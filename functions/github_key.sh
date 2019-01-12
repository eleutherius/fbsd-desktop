function github_key () {

echo -n "Enter pleace your local user:"
read USER
DIR=`getent passwd $USER | cut -f6 -d:`
DIRECTORY="$DIR/.ssh"

echo -n "Enter pleace your username on github:"
read USERNAME 
echo $USERNAME 

if [ ! -d "$DIRECTORY" ]; then
  mkdir "$DIRECTORY" && chmod 0700 "$DIRECTORY" && chown "$USER : $USER" 

   if [! -f "$DIRECTORY/authorized_keys"]; then 
   touch "$DIRECTORY/authorized_keys" && chmod 0644 "$DIRECTORY/authorized_keys"
   fi 
fi

curl -O "https://github.com/$USERNAME.keys"

cat "$USERNAME.keys"  >>  "$DIRECTORY/authorized_keys"

rm "$USERNAME.keys"

}
