#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PRINT_INFO() {
  echo $1 | while IFS="|" read TYPE_ID NUM SYMBOL NAME MASS MELT BOIL TYPE; do
    echo "The element with atomic number $NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
}

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  # if arg only has digits
  if [[ $1 =~ ^[0-9]+$ ]]; then
    FOUND_ELEM=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
  else
    FOUND_ELEM=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
    if [[ -z $FOUND_ELEM ]]; then
      FOUND_ELEM=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")
    fi
  fi

  if [[ -z $FOUND_ELEM ]]; then
    echo "I could not find that element in the database."
  else
    PRINT_INFO $FOUND_ELEM
  fi
fi
