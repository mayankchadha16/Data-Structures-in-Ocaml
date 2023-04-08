app : bst.cmo driver.cmo
	ocamlc -o app bst.cmo driver.cmo

bst.cmo : bst.ml bst.cmi
	ocamlc -c bst.ml

bst.cmi : bst.mli
	ocamlc -c bst.mli

driver.cmo : driver.ml driver.cmi
	ocamlc -c driver.ml

driver.cmi : driver.mli bst.cmi
	ocamlc -c driver.mli

clean :
	rm *.cmo *.cmi