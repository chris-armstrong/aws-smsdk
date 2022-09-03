type t('v, 'ty) =
  | []: t('v, 'v)
  | ::('a, t('ty, 'v)): t('a => 'ty, 'v);
