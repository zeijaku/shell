#/bin/sh

## Line ##
#/bin/sh

## Line ##
LV=1
CLEAR=10

## Word ##
# Q=()
Q=("hellow" "world" "that" "excelent" "nice" "fine" "this" "paper" "read" "it's")

## 問題作成 ##
function lottery() {
  unset Q_A
  for (( i=0; i<2; i++ ))
  do
      RDM=`expr $RANDOM % ${#Q[*]}`
      Q_A="${Q_A} ${Q[$RDM]}"
  done

  echo $Q_A
}

## 比較 ##
function compare() {
  Q_A=`lottery`
  echo -en "== LV: ${LV} ==\n"
  echo -en "> $Q_A\n"
  echo -en "Input \n> "
  read INPUT

  # RESULT=${RESULT}$INPUT

  if [ "$INPUT" == "$Q_A" ]; then
    echo -en "GOOD\n"; sleep 0.5
    ((LV++))
    if [ "$LV" -eq "$CLEAR" ]; then
      echo -en "Clear!!\n"
      exit 0
    fi
  else
    echo -en "BAD!\n"; sleep 0.5
    ((LV--))
  fi

  clear
  compare

}
