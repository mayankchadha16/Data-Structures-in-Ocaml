module Deque = struct
  type 'a node = { value: 'a; mutable prev: 'a node option; mutable next: 'a node option }
  type 'a t = { mutable front: 'a node option; mutable back: 'a node option }

  let empty  = { front = None; back = None }

  let is_empty deque =
    deque.front = None

  let push_front deque value =
    let new_node = { value; prev = None; next = deque.front } in
    match deque.front with
    | None ->
        deque.front <- Some new_node;
        deque.back <- Some new_node
    | Some front_node ->
        front_node.prev <- Some new_node;
        deque.front <- Some new_node

  let push_back deque value =
    let new_node = { value; prev = deque.back; next = None } in
    match deque.back with
    | None ->
        deque.front <- Some new_node;
        deque.back <- Some new_node
    | Some back_node ->
        back_node.next <- Some new_node;
        deque.back <- Some new_node

  let pop_front deque =
    match deque.front with
    | None -> None
    | Some front_node ->
        let value = front_node.value in
        (match front_node.next with
        | None ->
            deque.front <- None;
            deque.back <- None
        | Some next_node ->
            next_node.prev <- None;
            deque.front <- Some next_node);
        Some value

  let pop_back deque =
    match deque.back with
    | None -> None
    | Some back_node ->
        let value = back_node.value in
        (match back_node.prev with
        | None ->
            deque.front <- None;
            deque.back <- None
        | Some prev_node ->
            prev_node.next <- None;
            deque.back <- Some prev_node);
        Some value

  let front deque =
    match deque.front with
    | None -> None
    | Some front_node -> Some front_node.value

  let back deque =
    match deque.back with
    | None -> None
    | Some back_node -> Some back_node.value
end

let test_case () =
  let dq = Deque.empty in
  assert (Deque.is_empty dq);

  Deque.push_front dq 1;
  assert (not (Deque.is_empty dq));
  assert (Deque.front dq = Some 1);
  assert (Deque.back dq = Some 1);

  Deque.push_back dq 2;
  assert (Deque.front dq = Some 1);
  assert (Deque.back dq = Some 2);

  assert (Deque.pop_back dq = Some 2);
  assert (not (Deque.is_empty dq));
  assert (Deque.front dq = Some 1);
  assert (Deque.back dq = Some 1);

  assert (Deque.pop_front dq = Some 1);
  assert (Deque.pop_front dq = None);
  assert (Deque.is_empty dq);

  print_endline "All test cases passed."
