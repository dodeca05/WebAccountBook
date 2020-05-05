# WebAccountBook

### 메인 화면

![Alt text](/ScreenShot/1.PNG)

### 로그인 화면

![Alt text](/ScreenShot/2.PNG)

### 장부 항목 관리

![Alt text](/ScreenShot/8.PNG)

### 장부기록

![Alt text](/ScreenShot/10.PNG)

### 작성된 장부

![Alt text](/ScreenShot/12.PNG)

### 판매량 예측

이 예측은 2019-12-19기준으로  하였습니다.

12월 20일에는 비가 예보되어 있습니다.
12월 23일까지 기온은 모두 5도 이하입니다.

![Alt text](/ScreenShot/13.PNG)

1일 후인 12월 20일에는 붕어빵 판매량이 조금 줄어들었지만 우산 판매량이 늘것이라는 예측을 하였습니다.

### 부가적인 설명

아파치 v9.0으로 개발했습니다.

기존에 날씨를 가져오는 API를 사용했으나 사용하던 API가 서비스를 종료해 삭제

날씨 데이터를 SQL터미널에서 일일이 넣어줘야 정상 작동

WebProject/src/SQL/SQLConnect.java에서 DB 계정 설정을 해야 됩니다.


WebProject/src/SQL/SQLBaseInference.java에서 텐서플로우가 설치된 아나코다 주소와 WebWorkSpace/th 경로를 지정해줘야 합니다.



DB는 MySQL을 사용했으며 다음과 같이 4가지의 테이블을 생성했습니다.
![Alt text](/ScreenShot/DB1.png)
![Alt text](/ScreenShot/DB2.png)
![Alt text](/ScreenShot/DB3.png)
![Alt text](/ScreenShot/DB4.png)