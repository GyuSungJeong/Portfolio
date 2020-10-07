drop table p_reply;
drop sequence p_reply_seq;
drop table p_file;
drop sequence p_file_seq;
drop table p_board;
drop sequence p_board_seq;
drop table p_users;
drop sequence p_users_seq;

create sequence p_users_seq; --ȸ����ȣ ������
create table p_users(  --ȸ�����̺�
user_no number(5) primary key, --ȸ����ȣ
user_id varchar2(50) not null, --ȸ�����̵�
user_pw varchar2(50) not null, --ȸ����й�ȣ
user_name varchar2(50) not null, --ȸ���̸�
user_email varchar2(50) not null, --ȸ���̸��� 
user_phone varchar2(50), --ȸ����ȭ��ȣ
user_postno varchar2(50), --ȸ�������ȣ
user_addr varchar2(100), --ȸ���ּ�
user_addr2 varchar2(100), --ȸ�����ּ�
user_grade char(1) not null check(user_grade in('S','M','U','N')), --ȸ�����
user_putdate date  default sysdate not null, --���Գ�¥
user_outdate date --Ż��¥
);

create sequence p_board_seq; --�Խ��ǹ�ȣ ������
create table p_board(  --�Խ������̺�
board_no number(5) primary key, --�Խ��ǹ�ȣ
user_no number(5) not null, --ȸ����ȣ
board_title varchar(100) not null, --�Խñ�����
board_content varchar(2000) not null, --�Խñ� ����
board_cnt number(5), --�Խñ� ��Ƚ��
reply_cnt number(5), --�Խñ� ��� ����
board_indate date default sysdate not null, --�Խñ� �ۼ���¥
board_modifydate date, --�Խñ� ������¥
board_inout char(1) not null check(board_inout in('N','Y','M')), --�Խñ� ��������
FOREIGN KEY (user_no) REFERENCES p_users (user_no) 
);



create sequence p_file_seq; --���� ������
create table p_file( --���� ���̺�
file_no number(5) primary key, --���Ϲ�ȣ
board_no number(5) not null, --�Խñ� ��ȣ
file_name varchar2(200) not null, --�����̸�
FOREIGN KEY (board_no) REFERENCES p_board (board_no)
);


create sequence p_reply_seq; --��� ������
create table p_reply(  -- ��� ���̺�
reply_no number(5) primary key, --��۹�ȣ
user_no number(5) not null,  --ȸ����ȣ
board_no number(5) not null, --�Խñ� ��ȣ
reply_content varchar2(500) not null, -- ��� ����
reply_indate date default sysdate not null, --��ۻ�����¥
FOREIGN KEY (user_no) REFERENCES p_users (user_no),
FOREIGN KEY (board_no) REFERENCES p_board (board_no)
);


