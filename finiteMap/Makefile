app : map.cmo driver.cmo
	ocamlc -o app map.cmo driver.cmo

map.cmo : map.ml map.cmi
	ocamlc -c map.ml

map.cmi : map.mli
	ocamlc -c map.mli

driver.cmo : driver.ml driver.cmi
	ocamlc -c driver.ml

driver.cmi : driver.mli map.cmi
	ocamlc -c driver.mli

clean :
	rm *.cmo *.cmi