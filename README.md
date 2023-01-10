# 요-요 프로젝트 소개

## 요리초보들을 위한 요리대책 프로젝트
-----------------------------
#### 목차
>프로젝트 소개 및 선정이유
> >개발환경
> > >프로젝트 일정
> > > > 프로젝트 기능소개
> > > > >  Use Case/ERD
> > > > > >  요구사항 명세서
> > > > > > > > 느낀점
-----------------------------
#### 프로젝트 소개 및 선정이유
주제 : 1인 가구의 건강한 식문화를 위한 요리 레시피 제공 및 공유 사이트
선정 이유 : 사람들이 관심 있어 하는 주제로 개발 할 수 있으면 좋겠고 생각 기능이 아무리 뛰어나도 주제가 별로라면 사람들의 흥미를 이끌어내지 못 할 거라고 예상함.
----------------------------
#### 개발 환경
<img width="1512" alt="스크린샷 2023-01-10 오후 4 59 05" src="https://user-images.githubusercontent.com/110651556/211494028-553618c1-a64b-47a8-9d7a-d7878d88b34c.png">


-----------------------------

#### 프로젝트 일정

2022/11/25~2022/12/02
  * 프로젝트 주제 선정, 요구사항 명세서, 스토리보드 작성

2022/12/02~2022/12/08
  * DBMS 설계,정규화,ERD,TABLE 구조 생성, SQL 생성

2022/12/09~2022/12/14
  * 프로젝트 주제 개인 역할, 파이썬을 활용한 크롤링

2022/12/15~2022/12/30
  * 웹 개발
----------------------------

#### 프로젝트 핵심 기능
##### [웹 크롤링을 이용해 DB에 필요한 데이터 저장]
  * 코드
<pre>
<code>
a = "bread06053"
conn = pymysql.connect(
    user="recipe",
    password="recipe",
    host="localhost",
    db="recipe",
    charset="utf8",
    autocommit=True
)
cursor=conn.cursor()
for c in cate3:
    url="https://www.10000recipe.com/recipe/list.html?q=&query=&cat1=&cat2=18&cat3="+c+"&cat4=&fct=&order=reco&lastcate=cat3&dsearch=&copyshot=&scrap=&degree=&portion=&time=&niresource="    
    html=urllib.request.urlopen(url) #url요청하여 응답받은 웹페이지 저장
    soup=BeautifulSoup(html,'html.parser') #BeautifulSoup 객체 생성
    rcp = soup.select("a.common_sp_link") #a태그의 클래스 이름이 common_sp_link

    for r in rcp:
        hrefs = r.attrs['href']
        url1="https://www.10000recipe.com/%s"%hrefs
        html1=urllib.request.urlopen(url1)
        soup1=BeautifulSoup(html1,'html.parser')

        for t in soup1.find_all("div",{"class":"st3"}): #제목 크롤링하는 for문
            t.find_all('h3')
        title=t.find('h3').text.strip()
    
        for t in soup1.find_all("div",{"class":"view2_summary_info"}): #요리시간 크롤링하는 for문
            if t.find('span',{"class":"view2_summary_info2"})==None:
                time="조리능력에 따라 상의 그리고 바지는 하의 인삿말은 하위"
            else:
                time= t.find('span',{"class":"view2_summary_info2"}).text.strip()
            if t.find('span',{"class":"view2_summary_info3"}) ==None:
                level="상대성 이론은 베토벤"
            else:
                level= t.find('span',{"class":"view2_summary_info3"}).text.strip()
        logic=""  
        for t in soup1.find_all("div",{"class":"view_step"}):
            for s in t.find_all('div',{"class":"view_step_cont"}):        
                
                logic += str(s)
                if s.find("img")==None:
                    continue
                else:
                    logic += str(s.find("img")) # 요리 사진 링크
        if soup1.find("div",{"class":"view2_summary_in"})==None:
            info="설명이 없습니다."
        else:
            info=soup1.find("div",{"class":"view2_summary_in"}).text #요리 설명
        thumbnail=soup1.find_all("img",{"id":"main_thumbs"}) #썸네일 이미지
        for t in soup1.find_all("dl",{"class":"view_step_tip"}): #요리 팁
            if t.find('dd')==None:
                tip= '팁이 없습니다.'
            else:
                tip= t.find('dd').text
        for t in soup1.find_all("div",{"class":"ready_ingre3"}): #재료
            prep=t.get_text()
            prep=prep.replace("\n\n\n",",")
            prep=prep.replace("구매","")
            prep=prep.replace("\n","")
            prep=prep.replace("                                                        "," ")
            prep=prep.rstrip(',')
        sql="INSERT INTO recipe(userid,rtitle,rinfo,rtime,rlevel,rprep,rlogic,rthumimg,rtip,cateno,rstate,rlikes) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        cursor.execute(sql,(a,title,info,time,level,prep,logic,thumbnail,tip,int(c),0,0))
        
conn.close()        
</code>
</pre>


##### [API 활용(다음,카카오,네이버..)]
###### 사진 첨부
###### 카카오 로그인
![KakaoTalk_Photo_2023-01-10-17-44-37](https://user-images.githubusercontent.com/110651556/211504178-eb55b58f-57e5-4450-8246-414a4849b8ce.png)

##### 다음 지도
![KakaoTalk_Photo_2023-01-10-17-44-40](https://user-images.githubusercontent.com/110651556/211504221-5f4ffb7f-3df1-46e4-b2a6-410da988df1d.png)

##### 네이버 스마트 에디터
![KakaoTalk_Photo_2023-01-10-17-44-43](https://user-images.githubusercontent.com/110651556/211504280-3bf3f02d-4f4f-4b37-9941-157d464740cc.png)

##### 카카오 페이
![KakaoTalk_Photo_2023-01-10-17-58-04](https://user-images.githubusercontent.com/110651556/211506530-bcf13ea9-a317-4489-a1b3-bdf4e83de5f0.png)


##### google email
![IMG_BE0EEFA92F36-1](https://user-images.githubusercontent.com/110651556/211504890-233bd8de-b7f9-4a03-b368-bd679eefb4ff.jpeg)

#### 관리자 페이지
##### 기능 소개
  * spring security를 이용해 권한을 나눠서 관리자가 홈페이지를 조금 편하게 관리하게 끔 만들었다.
  * 워드 클라우를 통해 사용자들이 어떤 재료에 관심이 있는지 워드 클라우드로 구현하였고 가장 관심 있어하는 레시피 3개를 보여준다.
  * 사용자 명단을 csv파일로 다운로드 받을 수 있다.
  * 배너를 이미지를 시즌별로 바꿀 수 있다.
---------------------------------------

#### Use Case
> ![카카오페이(수정)](https://user-images.githubusercontent.com/110651556/211500128-ee013dd3-6f03-4492-825c-579f5d17e480.png)


---------------------------------------

#### ERD


![그림1](https://user-images.githubusercontent.com/110651556/211500331-04338e6c-196c-4c82-a807-a4a95dc64928.png)

---------------------------------------

#### 느낀점
찬혁 
> 내가 부족한 부분을 다른 사람이 채워줄 수 있기에 팀 프로젝트의 중요성을 알았다.
> 개발과정에서 에러를 내는 걸 두려워하지 않고 학습하면 더 좋은 개발자가 될 수 있다고 생각한다. 
