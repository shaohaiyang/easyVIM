#!/usr/bin/env python
# coding: utf8
 
def all_perms(L):
  if len(L) <= 1:
    yield L
  else:
    for p in all_perms(L[1:]):
      for i in range(len(p) + 1):
        yield p[:i] + L[0:1] + p[i:]

for i in all_perms([7,7,4,4]):
  print i
