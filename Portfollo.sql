drop table p_reply;
drop sequence p_reply_seq;
drop table p_file;
drop sequence p_file_seq;
drop table p_board;
drop sequence p_board_seq;
drop table p_users;
drop sequence p_users_seq;

create sequence p_users_seq; --회원번호 시퀀스
create table p_users(  --회원테이블
user_no number(5) primary key, --회원번호
user_id varchar2(50) not null, --회원아이디
user_pw varchar2(50) not null, --회원비밀번호
user_name varchar2(50) not null, --회원이름
user_email varchar2(50) not null, --회원이메일 
user_phone varchar2(50), --회원전화번호
user_postno varchar2(50), --회원우편번호
user_addr varchar2(100), --회원주소
user_addr2 varchar2(100), --회원상세주소
user_grade char(1) not null check(user_grade in('S','M','U','N')), --회원등급
user_putdate date  default sysdate not null, --가입날짜
user_outdate date --탈퇴날짜
);

create sequence p_board_seq; --게시판번호 시퀀스
create table p_board(  --게시판테이블
board_no number(5) primary key, --게시판번호
user_no number(5) not null, --회원번호
board_title varchar(100) not null, --게시글제목
board_content varchar(2000) not null, --게시글 내용
board_cnt number(5), --게시글 조횟수
reply_cnt number(5), --게시글 댓글 갯수
board_indate date default sysdate not null, --게시글 작성날짜
board_modifydate date, --게시글 수정날짜
board_inout char(1) not null check(board_inout in('N','Y','M')), --게시글 삭제여부
FOREIGN KEY (user_no) REFERENCES p_users (user_no) 
);



create sequence p_file_seq; --파일 시퀀스
create table p_file( --파일 테이블
file_no number(5) primary key, --파일번호
board_no number(5) not null, --게시글 번호
file_name varchar2(200) not null, --파일이름
FOREIGN KEY (board_no) REFERENCES p_board (board_no)
);


create sequence p_reply_seq; --댓글 시퀀스
create table p_reply(  -- 댓글 테이블
reply_no number(5) primary key, --댓글번호
user_no number(5) not null,  --회원번호
board_no number(5) not null, --게시글 번호
reply_content varchar2(500) not null, -- 댓글 내용
reply_indate date default sysdate not null, --댓글생성날짜
FOREIGN KEY (user_no) REFERENCES p_users (user_no),
FOREIGN KEY (board_no) REFERENCES p_board (board_no)
);


