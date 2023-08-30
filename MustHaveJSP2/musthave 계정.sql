-- 테이블 목록 저회
select * from tab; --계정에 테이블이 몇개 있는지 확인

drop table member;
drop table board;
drop sequence seq_board_num; -- 세가지를 순서대로 drop해야 삭제가 된다.
--혹은 delect all을 해도 된다?

-- 회원 테이블 만들기
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key(id)
);

-- 모델1 방식의 게시판 테이블 만들기
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null, --content는 내용을 치는 것
    id varchar2(10) not null, --위의 회원 varchar2(10) 10숫자를 동일하게 맞춰줘야함
    postdate date default sysdate not null,
    visitcount number(6)
);


-- 외래키 설정
alter table board
    add constraint board_mem_fk foreign key(id) --board mem_fk라는 변수를 줌
    references member(id);
    
-- 시퀀스 생성
create sequence seq_board_num --seq_board_num 변수 이름 위와동일
    increment by 1   -- 1씩 증가
    start with 1     -- 시작값이 1이다.
    minvalue 1       -- 최소값 1
    nomaxvalue       -- 최대값은 무한대
    nocycle          -- 순환하지 않음
    nocache;         -- 캐시 안 함
    
--테이블을 새로 만들필요 없이 회원관리자를 생성해서 건네줌 p178
--외래키 설정(권한을 줌) 권한을 준 상태에서 에러가 발생하는 것은 참조가
--될 부모 레코드가 없어서 오류 발생
--회원을 생성(관리자 회원)
--테이블 데이터를 생성해 더미데이터 입력 (커밋해서 저장해야함)


-- 더미 데이터 입력
insert into member(id, pass, name) values ('musthave', '1234', '머스트헤브');
insert into board (num, title, content, id, postdate, visitcount)
    values(seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave',
            sysdate,0);
commit;

select * from member;

select count (*) from board WHERE title like '%2%';
SELECT * FROM board WHERE title like '%1%'; --컬럼이기 때문에 소문자로 작성(title) 자동완성
--검색이 여러개 있을때 앞에있는 num이 중요하기 때문에 (고유번호 1)을 검색하면 
--날짜와 함께 전부 다 검색 되기 때문에 ORDER BY num DESC;를 query로 줌

INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);

commit;

desc member;
select * from member;
select id, pass, rownum from member;
select *from (
    select Tb.*, rownum rNum from(
        select * from board order by num desc
    )Tb --최신 게시물부터 보기 위해서 desc사용
) --select문에는 order by가 맨 마지막으로 옴
where rNum between 1 and 10;

--drop table myfile;

create table myfile(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(30),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);
desc myfile;

-- tomcat을 servers에서 삭제한 후 다시 불러온 후 남은 데이터의 충돌을 막기 위해
--기존에 만들어 두었던 데이터를 --drop table myfile; 으로 삭제하고 다시
--create table myfile 테이블을 만들어 주고 FileUploadMain에서 파일을 등록해서
--데이터를 만들어준다.
drop table mvcboard;   
-- 모델2 방식의 파일첨부형 게시판 테이블 생성
create table mvcboard(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);
desc mvcboard;

insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');    
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');    
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');    
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');  

commit;  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    