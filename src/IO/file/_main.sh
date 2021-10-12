#@ include ../file.sh
@.io.file.write "test.txt" '0'
@.io.file.add "test.txt" '1'
@.io.file.read "test.txt"
