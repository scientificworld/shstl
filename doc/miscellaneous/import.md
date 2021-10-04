# miscellaneous/import

## function(s)

### @.miscellaneous.import

Import a file.

#### usage

@.miscellaneous.import \<files\>

#### local variable/constant(s)

##### \_original\_path

Stores the original current path.

#### note

##### `cd "$(dirname "$(readlink "$BASH_SOURCE")")"` after `cd "$(dirname "$BASH_SOURCE")"`

Because `readlink` returns relative path.

For example, `/usr/local/bin/gcc-11` links to `/usr/local/Cellar/gcc/11.1.0_1/bin/gcc-11`.

Then when I run `readlink /usr/local/bin/gcc-11`, it will return `../Cellar/gcc/11.1.0_1/bin/gcc-11`.

If I run `cd $(dirname $(readlink "/usr/local/bin/gcc-11"))` in other directories \(for example, my home directory\), the following error will occur:

`cd: no such file or directory: ../Cellar/gcc/11.1.0_1/bin`

So I need to switch to the directory of the current file first.

### @import

The alias of `@.miscellaneous.import`.
