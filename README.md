# WebAccountBook

메인 화면
![Alt text](/ScreenShot/1.PNG)
로그인 화면
![Alt text](/ScreenShot/2.PNG)
장부 항목 관리
![Alt text](/ScreenShot/8.PNG)
장부기록
![Alt text](/ScreenShot/10.PNG)
작성된 장부
![Alt text](/ScreenShot/12.PNG)
판매량 예측(텐서플로우 기반)
![Alt text](/ScreenShot/11.PNG)
판매량 예측2
![Alt text](/ScreenShot/13.PNG)



아파치 v9.0으로 개발했습니다.

기존에 날씨를 가져오는 API를 사용했으나 사용하던 API가 서비스를 종료해 삭제
날씨 데이터를 수동으로 일일이 넣어줘야 정상 작동

WebProject/src/SQL/SQLConnect.java에서 DB 계정 설정을 해야 됩니다.
WebProject/src/SQL/SQLBaseInference.java에서 텐서플로우가 설치된 아나코다 주소와 WebWorkSpace/th 경로를 지정해줘야 합니다.