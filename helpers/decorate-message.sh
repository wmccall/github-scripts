#!/bin/bash
message="$1"

SAVEIFS=$IFS       # Save current IFS
IFS=$'\n'          # Change IFS to new line
message=($message) # split to array $names
IFS=$SAVEIFS       # Restore IFS

max_len=0

tlcorner="╔"
trcorner="╗"
blcorner="╚"
brcorner="╝"
vertical="║"
horizontal="═"

print_decorators () {
  dec_len=$max_len+6
  for (( i=0; i<$dec_len; i++ ));
  do
    if [[ i -eq 0 ]]; then
      printf "$1"
    elif [[ i -ne $dec_len-1 ]]; then
      printf "$2"
    else 
      printf "$3"
    fi
  done
  printf "\n"
}

print_line () {
  line="$1"
  line_len=${#line}
  line_dif=$(expr $max_len - $line_len)
  left=$(expr $line_dif / 2)
  right=$(expr $line_dif - $left)

  printf "$vertical  "
  for (( k=0; k<$left; k++ ));
  do
    printf " "
  done

  printf "$line"

  for (( l=0; l<$right; l++ ));
  do
    printf " "
  done

  printf "  $vertical\n"
}

print_message () {
  for (( i=0; i<${#message[@]}; i++ ))
  do
    line="${message[$i]}"
    print_line "$line"
  done
}

get_max_line_len () {
  for (( i=0; i<${#message[@]}; i++ ))
  do
    line="${message[$i]}"
    line_len=${#line}
    if [[ "$line_len" -gt "$max_len" ]]; then
      max_len=$line_len
    fi
  done
}

get_max_line_len

print_decorators $tlcorner $horizontal $trcorner
print_decorators $vertical " " $vertical
print_message
print_decorators $vertical " " $vertical
print_decorators $blcorner $horizontal $brcorner