#/usr/bin/env python
#coding:utf8

#Title: string
#Date: 2017-05-28 13:55
#Author: Shaohy<shaohaiyang@gmail.com>
#Tags: 
#Slug: string

import random

'''
file = open('/Users/shaohy/myDemo/python_apps/math.txt')
for line in file:
  print '%s = %d' %(line.strip(),eval(line))

while True:
  line = raw_input('请输入计算式:')
  if line == 'quit':
    break
  print eval(line)
'''

def genMath(seed=2,max=10):
  num = []
  symboList = ('+','-','*','/')
  for i in xrange(0,seed):
    num.append(random.randrange(1,max))
  if seed == 2:
    return '{} {} {} '.format(num[0],symboList[random.randrange(0,4)],num[1])
  if seed == 3:
    return '{} {} {} {} {}'.format(num[0],symboList[random.randrange(0,4)],num[1],symboList[random.randrange(0,4)],num[2])
  
for i in xrange(1,10):
  gongshi = genMath(seed=3,max=10)
  result = eval(gongshi)
  print( gongshi  + ' = ' + str(result)) 
