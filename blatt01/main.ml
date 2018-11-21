let add a b = 
  a + b;;

let calc a b f =
  let k = 34 in
    let p = 35 in 
      let g p1 p2 = p1 * p2 in
        a + b + (f a b) + k + p + (g k p);;


let () = 
  print_int (add 12 14);
  print_newline ();
  print_int (calc 2 3 (fun c d -> c * d * 2));
  print_newline ();
  print_int (calc 2 3 add);;