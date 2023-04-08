app : stack.cmo driver.cmo
	ocamlc -o app stack.cmo driver.cmo

stack.cmo : stack.ml stack.cmi
	ocamlc -c stack.ml

stack.cmi : stack.mli
	ocamlc -c stack.mli

driver.cmo : driver.ml driver.cmi
	ocamlc -c driver.ml

driver.cmi : driver.mli stack.cmi
	ocamlc -c driver.mli

clean :
	rm *.cmo *.cmi