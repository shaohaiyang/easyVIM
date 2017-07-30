#!/usr/bin/env python
# coding: utf8

import urllib
from lxml import etree


def getHtml(url):
    page = urllib.urlopen(url)
    html = page.read()
    return html

text = getHtml('http://tieba.baidu.com/p/5147735367')

html = etree.HTML(text)
result = html.xpath('//li/div/a/')
print result

'''
<li class="icon">
		  			<div class="icon_relative j_user_card" data-field='{&quot;un&quot;:&quot;\u6211\u662f\u83c7\u51c9\u5927\u5927&quot;}'>
				  		<a style="" target="_blank" class="p_author_face " href="/home/main?un=%E6%88%91%E6%98%AF%E8%8F%87%E5%87%89%E5%A4%A7%E5%A4%A7&ie=utf-8&fr=pb&ie=utf-8"><img username="我是菇凉大大" class="" src="http://tb2.bdstatic.com/tb/static-pb/img/head_80.jpg" data-tb-lazyload="http://tb.himg.baidu.com/sys/portrait/item/0431e68891e698afe88f87e58789e5a4a7e5a4a7dba1"/></a>

			  		</div>
			 	</li>

'''
