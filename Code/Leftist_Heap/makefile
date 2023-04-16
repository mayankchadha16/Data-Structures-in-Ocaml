leftist.cmi : leftist.mli
	ocamlopt -c leftist.mli

leftist.cmx : leftist.ml
	ocamlopt -c leftist.ml

driver.cmx : driver.ml
	ocamlopt -c driver.ml

all	: leftist.cmi leftist.cmx driver.cmx
	ocamlopt -o driver leftist.cmx driver.cmx

clear :
	rm *.o *.cmi *.cmx