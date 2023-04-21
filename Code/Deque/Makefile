app : deque.cmo driver.cmo
	ocamlc -o app deque.cmo driver.cmo

deque.cmo : deque.ml deque.cmi
	ocamlc -c deque.ml

deque.cmi : deque.mli
	ocamlc -c deque.mli

driver.cmo : driver.ml driver.cmi
	ocamlc -c driver.ml

driver.cmi : driver.mli deque.cmi
	ocamlc -c driver.mli

clean :
	rm *.cmo *.cmi