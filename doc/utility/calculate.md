# utility/calculate

## function(s)

### @.utility.calculate

Do some calculations.

#### usage

@.utility.calculate \<expression\>

### @.utility.\_calculate\_bc

A calculation function implemented using `bc`.

#### local variable/constant(s)

##### \_result

Store the original results.

#### note

##### The use of `if [ "${_result:0:1}" == "." ]`

if the integral part of the number is zero, then it won't display.

e.g. `bc -l <<< "1/2"` returns `.50000000000000000000`.

So I need to fill in the zero manually.

### @.utility.\_calculate\_awk

A calculation function implemented using `awk`.

### @.utility.\_calculate\_python

A calculation function implemented using `python`.

### @calculate

The alias of `@.utility.calculate`.

## dependency

miscellaneous/exist

miscellaneous/alias
