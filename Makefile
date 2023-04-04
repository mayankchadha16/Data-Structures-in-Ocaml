app : stack.cmo bst.cmo
	ocamlc -o app stack.cmo bst.cmo

stack.cmo : stack.ml stack.cmi
	ocamlc -c stack.ml

stack.cmi : stack.mli
	ocamlc -c stack.mli

bst.cmo : bst.ml bst.cmi
	ocamlc -c bst.ml

bst.cmi : bst.mli
	ocamlc -c bst.mli

clean :
	rm *.cmo *.cmi app