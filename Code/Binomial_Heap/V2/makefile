BH.cmi : BH.mli
	ocamlopt -c BH.mli

BH.cmx : BH.ml
	ocamlopt -c BH.ml

driver.cmx : driver.ml
	ocamlopt -c driver.ml

all	: BH.cmi BH.cmx driver.cmx
	ocamlopt -o driver BH.cmx driver.cmx

clear :
	rm *.o *.cmi *.cmx