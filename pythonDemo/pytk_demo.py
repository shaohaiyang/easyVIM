#!/usr/bin/env python
#coding:utf8

#Title: pytk_demo
#Date: 2017-05-28 16:44
#Author: Shaohy<shaohaiyang@gmail.com>
#Tags: 
#Slug: pytk_demo

import sys,random
from Tkinter import *
import tkFont


def zz(string):
  codec = sys.getfilesystemencoding()
  return string.decode(codec)

def genCard():
  lbl_font = tkFont.Font(family='Arial',size=60,weight='bold')
  for i in range(0,4):
    rand_number = random.randrange(1,11)
    lbl = Label(window,text=str(rand_number),font=lbl_font,padx=10,pady=10).grid(row=2,column=(i+1))

window = Tk()
window.title(zz('24点游戏'))
window.geometry('600x400')

btn_font = tkFont.Font(family='Arial',size=20,weight='bold')
btn_bg = '#D5E0EE'  
btn_active_bg = '#E5E35B'

btn = Button(window,text=zz('随机发牌'),command=genCard,
    bg=btn_bg,activebackground=btn_active_bg,font=btn_font).grid(row=0,column=0)

window.mainloop()
  

