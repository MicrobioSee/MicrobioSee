get_res <- function(API,keyword){
          api_key <- API
          query <- paste0(keyword,"*[Title/Abstract] AND english[LA] AND Journal Article[PT] AND 2000:2020[DP]")
          res <- pmQueryTotalCount(query = query, api_key = api_key)
          print(res$total_count)
}

get_all <- function(API,keyword,num){
          api_key <- API
          query <- paste0(keyword,"*[Title/Abstract] AND english[LA] AND Journal Article[PT] AND 2000:2020[DP]")
          if (num >= 200){
            num=200}
          D <- pmApiRequest(query = query, limit = num, api_key = api_key)
          M <- pmApi2df(D,format = "raw")
          M2 = M %>% mutate_if(is.character, stri_enc_toutf8)  # 修改成utf-8编码方式
          # M3 <- M2
          # M3$AB <- NULL
          return(M2)
}

get_ab <- function(AB,papnum){
          text <- AB
          b <- ""
          for (i in 1:papnum){
            Encoding(text[i])<-'UTF-8'
            b <- text[i]
          }
          return(b)
}

get_worldcloud <- function(str){
  cleanD=cleanAbstracts(str)
  print(wordcloud2(data = cleanD))
}

main_wd <- function(API,keyword,number){
        num <- get_res(API,keyword)
        M <- get_all(API,keyword)
        ab <- get_ab(M2,number)
        get_worldcloud(ab)
}

# saveWidget(my_graph,"tmp.html",selfcontained = F) #先保存为网页格式
# webshot("tmp.html","wordcloud.jpg", delay = 3,vwidth = 1000, vheight=1000)
#在依据网页格式生成jpg图片格式
#其中“delay =”设置在保存图片之前需要等待的时间(单位：秒)，这主要是因为字云图要完全显示出绘制的单词时间较慢，需要等到，需要依据显示的单词数量合理设置；
#“vwidth =”和“ vheight=”指定保存时的高宽
