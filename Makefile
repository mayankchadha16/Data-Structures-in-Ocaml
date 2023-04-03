app : stack.cmo
	ocamlc -o app stack.cmo 

stack.cmo : stack.ml stack.cmi
	ocamlc -c stack.ml

stack.cmi : stack.mli
	ocamlc -c stack.mli

clean :
	rm *.cmo *.cmi app