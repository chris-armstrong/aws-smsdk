type ('v, 'ty) t =
  | []: ('v, 'v) t 
  | (::): 'a * ('ty, 'v) t -> ('a -> 'ty, 'v) t 