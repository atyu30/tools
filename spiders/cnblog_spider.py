#coding:utf-8
from scrapy.selector import Selector
try:
    from scrapy.spiders import Spider
except:
    from scrapy.spider import BaseSpider as Spider

from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors.sgml import SgmlLinkExtractor as sle
from cnblogs.items import *
import logging

class CnblogsSpider(CrawlSpider):
    name = "cnblogs"
    allowed_domains = ["cnblogs.com"]
    start_urls = ["http://www.cnblogs.com/rwxwsblog/default.html?page=1"]
    rules = [
        Rule(sle(allow=("/rwxwsblog/default.html\?page=\d{1,}")),
			 follow=True,
			 callback='parse_item')
    ]

    # 开启日志
    logging.basicConfig(level = logging.DEBUG,
                        format = '%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                        datefmt='%a, %d %b %Y %H:%M:%S',
                        filename='spiders.log',
                        filemode='w')


    # 定义回调函数
    def parse_item(self, response):
        items = []
        sel = Selector(response)
        postTitle = sel.css('div.day div.postTitle')
        postCon = sel.css('div.postCon div.c_b_p_desc')
        for index in range(len(postTitle)):
            item = CnblogsItem()
            item['title'] = postTitle[index].css("a").xpath('text()').extract()[0]
            item['body'] = ''.join(sel.select("//body//text()").extract()).strip()
            item['link'] = postTitle[index].css('a').xpath('@href').extract()[0]
            item['desc'] = postCon[index].xpath('text()').extract()[0]
            items.append(item)
        return items
