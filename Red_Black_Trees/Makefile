app : rbt.cmo driver.cmo
	ocamlc -o app rbt.cmo driver.cmo

rbt.cmo : rbt.ml rbt.cmi
	ocamlc -c rbt.ml

rbt.cmi : rbt.mli
	ocamlc -c rbt.mli

driver.cmo : driver.ml driver.cmi
	ocamlc -c driver.ml

driver.cmi : driver.mli rbt.cmi
	ocamlc -c driver.mli

clean :
	rm *.cmo *.cmi