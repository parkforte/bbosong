/* 회원계정 */
CREATE TABLE account (
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	nickname VARCHAR2(50) NOT NULL, /* 닉네임 */
	birth DATE DEFAULT sysdate
 NOT NULL, /* 생년월일 */
	address VARCHAR2(100) NOT NULL, /* 주소 */
	tel VARCHAR2(50) NOT NULL, /* 연락처 */
	gradeNo NUMBER NOT NULL, /* 등급번호 */
	joindate DATE DEFAULT sysdate NOT NULL /* 회원가입일 */
);

CREATE UNIQUE INDEX PK_account
	ON account (
		email ASC
	);

CREATE UNIQUE INDEX UIX_account
	ON account (
		nickname ASC,
		tel ASC
	);

ALTER TABLE account
	ADD
		CONSTRAINT PK_account
		PRIMARY KEY (
			email
		);

ALTER TABLE account
	ADD
		CONSTRAINT UK_account
		UNIQUE (
			nickname,
			tel
		);

/* 지점정보 */
CREATE TABLE store (
	storeNo NUMBER NOT NULL, /* 지점번호 */
	storeName VARCHAR2(50) NOT NULL, /* 지점명 */
	address VARCHAR2(100) NOT NULL, /* 주소 */
	tel VARCHAR2(50) NOT NULL /* 연락처 */
);

CREATE UNIQUE INDEX PK_store
	ON store (
		storeNo ASC
	);

ALTER TABLE store
	ADD
		CONSTRAINT PK_store
		PRIMARY KEY (
			storeNo
		);

/* 주문 */
CREATE TABLE order_ (
	orderNo NUMBER NOT NULL, /* 주문번호 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	storeNo NUMBER NOT NULL, /* 지점번호 */
	laundryNo NUMBER NOT NULL, /* 세탁분류코드 */
	qty NUMBER NOT NULL, /* 주문수량 */
	orderDate DATE DEFAULT sysdate
 NOT NULL, /* 주문날짜 */
	pickupDate DATE NOT NULL, /* 수거날짜 */
	orderState VARCHAR2(50) NOT NULL, /* 주문상태 */
	serialNo NUMBER NOT NULL /* 발급번호 */
);

CREATE UNIQUE INDEX PK_order_
	ON order_ (
		orderNo ASC
	);

ALTER TABLE order_
	ADD
		CONSTRAINT PK_order_
		PRIMARY KEY (
			orderNo
		);

/* 관리자계정 */
CREATE TABLE admin (
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	pwd VARCHAR2(50) NOT NULL, /* 비밀번호 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	storeNo NUMBER NOT NULL /* 지점번호 */
);

CREATE UNIQUE INDEX PK_admin
	ON admin (
		email ASC
	);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			email
		);

/* 이용후기게시판 */
CREATE TABLE review (
	no NUMBER NOT NULL, /* 이용후기번호 */
	title VARCHAR2(50) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	readcount NUMBER NOT NULL, /* 조회수 */
	groupNo NUMBER NOT NULL, /* 그룹번호 */
	step NUMBER NOT NULL, /* 단계 */
	sortNo NUMBER NOT NULL, /* 정렬순서 */
	delFlag VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 삭제플래그 */
	fileName VARCHAR2(50) NOT NULL, /* 파일명 */
	fileSize NUMBER NOT NULL, /* 파일사이즈 */
	downcount NUMBER NOT NULL, /* 다운로드수 */
	originalFileName VARCHAR2(50) NOT NULL, /* 원본파일명 */
	regdate DATE DEFAULT sysdate
 NOT NULL, /* 작성일 */
	score NUMBER NOT NULL /* 별점 */
);

CREATE UNIQUE INDEX PK_review
	ON review (
		no ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			no
		);

/* 회원등급 */
CREATE TABLE grade (
	gradeNo NUMBER NOT NULL, /* 등급번호 */
	gradeName VARCHAR2(50) NOT NULL /* 등급명 */
);

CREATE UNIQUE INDEX PK_grade
	ON grade (
		gradeNo ASC
	);

ALTER TABLE grade
	ADD
		CONSTRAINT PK_grade
		PRIMARY KEY (
			gradeNo
		);

/* 세탁분류 */
CREATE TABLE laundryMenu (
	laundryNo NUMBER NOT NULL, /* 세탁분류코드 */
	laundryName VARCHAR2(50) NOT NULL, /* 분류명 */
	price NUMBER NOT NULL /* 단가 */
);

CREATE UNIQUE INDEX PK_laundryMenu
	ON laundryMenu (
		laundryNo ASC
	);

ALTER TABLE laundryMenu
	ADD
		CONSTRAINT PK_laundryMenu
		PRIMARY KEY (
			laundryNo
		);

/* 해쉬테이블 */
CREATE TABLE hash (
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	digest VARCHAR(64) NOT NULL, /* 해쉬값 */
	salt VARCHAR(32) NOT NULL /* 솔트 */
);

CREATE UNIQUE INDEX PK_hash
	ON hash (
		email ASC
	);

ALTER TABLE hash
	ADD
		CONSTRAINT PK_hash
		PRIMARY KEY (
			email
		);

/* 쿠폰 */
CREATE TABLE coupon (
	couponNo NUMBER NOT NULL, /* 쿠폰번호 */
	couponName VARCHAR2(50) NOT NULL, /* 쿠폰이름 */
	discount NUMBER NOT NULL, /* 할인금액 */
	expire DATE NOT NULL /* 사용기한 */
);

CREATE UNIQUE INDEX PK_coupon
	ON coupon (
		couponNo ASC
	);

ALTER TABLE coupon
	ADD
		CONSTRAINT PK_coupon
		PRIMARY KEY (
			couponNo
		);

/* 소유쿠폰 */
CREATE TABLE myCoupon (
	serialNo NUMBER NOT NULL, /* 발급번호 */
	couponNo NUMBER NOT NULL, /* 쿠폰번호 */
	email VARCHAR2(50) NOT NULL /* 이메일 */
);

CREATE UNIQUE INDEX PK_myCoupon
	ON myCoupon (
		serialNo ASC
	);

ALTER TABLE myCoupon
	ADD
		CONSTRAINT PK_myCoupon
		PRIMARY KEY (
			serialNo
		);

/* Q&A */
CREATE TABLE qna (
	no NUMBER NOT NULL, /* Q&A번호 */
	title VARCHAR2(50) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	readcount NUMBER NOT NULL, /* 조회수 */
	groupNo NUMBER NOT NULL, /* 그룹번호 */
	step NUMBER NOT NULL, /* 단계 */
	sortNo NUMBER NOT NULL, /* 정렬순서 */
	delFlag VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 삭제플래그 */
	fileName VARCHAR2(50) NOT NULL, /* 파일명 */
	fileSize NUMBER NOT NULL, /* 파일사이즈 */
	downcount NUMBER NOT NULL, /* 다운로드수 */
	originalFileName VARCHAR2(50) NOT NULL, /* 원본파일명 */
	regdate DATE DEFAULT sysdate
 NOT NULL /* 작성일 */
);

CREATE UNIQUE INDEX PK_qna
	ON qna (
		no ASC
	);

ALTER TABLE qna
	ADD
		CONSTRAINT PK_qna
		PRIMARY KEY (
			no
		);

/* 세탁정보게시판 */
CREATE TABLE tipboard (
	no NUMBER NOT NULL, /* 번호 */
	title VARCHAR2(50) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	readcount NUMBER NOT NULL, /* 조회수 */
	groupNo NUMBER NOT NULL, /* 그룹번호 */
	step NUMBER NOT NULL, /* 단계 */
	sortNo NUMBER NOT NULL, /* 정렬순서 */
	delFlag VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 삭제플래그 */
	fileName VARCHAR2(50) NOT NULL, /* 파일명 */
	fileSize NUMBER NOT NULL, /* 파일사이즈 */
	downcount NUMBER NOT NULL, /* 다운로드수 */
	originalFileName VARCHAR2(50) NOT NULL, /* 원본파일명 */
	regdate DATE DEFAULT sysdate
 NOT NULL /* 작성일 */
);

CREATE UNIQUE INDEX PK_tipboard
	ON tipboard (
		no ASC
	);

ALTER TABLE tipboard
	ADD
		CONSTRAINT PK_tipboard
		PRIMARY KEY (
			no
		);

/* 이벤트게시판 */
CREATE TABLE eventboard (
	no NUMBER NOT NULL, /* 번호 */
	title VARCHAR2(50) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	readcount NUMBER NOT NULL, /* 조회수 */
	groupNo NUMBER NOT NULL, /* 그룹번호 */
	step NUMBER NOT NULL, /* 단계 */
	sortNo NUMBER NOT NULL, /* 정렬순서 */
	delFlag VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 삭제플래그 */
	fileName VARCHAR2(50) NOT NULL, /* 파일명 */
	fileSize NUMBER NOT NULL, /* 파일사이즈 */
	downcount NUMBER NOT NULL, /* 다운로드수 */
	originalFileName VARCHAR2(50) NOT NULL, /* 원본파일명 */
	regdate DATE DEFAULT sysdate
 NOT NULL /* 작성일 */
);

CREATE UNIQUE INDEX PK_eventboard
	ON eventboard (
		no ASC
	);

ALTER TABLE eventboard
	ADD
		CONSTRAINT PK_eventboard
		PRIMARY KEY (
			no
		);

/* 공지사항 */
CREATE TABLE notice (
	no NUMBER NOT NULL, /* 공지사항번호 */
	title VARCHAR2(50) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	readcount NUMBER NOT NULL, /* 조회수 */
	groupNo NUMBER NOT NULL, /* 그룹번호 */
	step NUMBER NOT NULL, /* 단계 */
	sortNo NUMBER NOT NULL, /* 정렬순서 */
	delFlag VARCHAR2(1) DEFAULT 'N' NOT NULL, /* 삭제플래그 */
	fileName VARCHAR2(50) NOT NULL, /* 파일명 */
	fileSize NUMBER NOT NULL, /* 파일사이즈 */
	downcount NUMBER NOT NULL, /* 다운로드수 */
	originalFileName VARCHAR2(50) NOT NULL, /* 원본파일명 */
	regdate DATE DEFAULT sysdate
 NOT NULL /* 작성일 */
);

CREATE UNIQUE INDEX PK_notice
	ON notice (
		no ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			no
		);

ALTER TABLE account
	ADD
		CONSTRAINT FK_grade_TO_account
		FOREIGN KEY (
			gradeNo
		)
		REFERENCES grade (
			gradeNo
		);

ALTER TABLE order_
	ADD
		CONSTRAINT FK_account_TO_order_
		FOREIGN KEY (
			email
		)
		REFERENCES account (
			email
		);

ALTER TABLE order_
	ADD
		CONSTRAINT FK_laundryMenu_TO_order_
		FOREIGN KEY (
			laundryNo
		)
		REFERENCES laundryMenu (
			laundryNo
		);

ALTER TABLE order_
	ADD
		CONSTRAINT FK_store_TO_order_
		FOREIGN KEY (
			storeNo
		)
		REFERENCES store (
			storeNo
		);

ALTER TABLE order_
	ADD
		CONSTRAINT FK_myCoupon_TO_order_
		FOREIGN KEY (
			serialNo
		)
		REFERENCES myCoupon (
			serialNo
		);

ALTER TABLE admin
	ADD
		CONSTRAINT FK_store_TO_admin
		FOREIGN KEY (
			storeNo
		)
		REFERENCES store (
			storeNo
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_account_TO_review
		FOREIGN KEY (
			email
		)
		REFERENCES account (
			email
		);

ALTER TABLE hash
	ADD
		CONSTRAINT FK_account_TO_hash
		FOREIGN KEY (
			email
		)
		REFERENCES account (
			email
		);

ALTER TABLE myCoupon
	ADD
		CONSTRAINT FK_coupon_TO_myCoupon
		FOREIGN KEY (
			couponNo
		)
		REFERENCES coupon (
			couponNo
		);

ALTER TABLE myCoupon
	ADD
		CONSTRAINT FK_account_TO_myCoupon
		FOREIGN KEY (
			email
		)
		REFERENCES account (
			email
		);

ALTER TABLE qna
	ADD
		CONSTRAINT FK_account_TO_qna
		FOREIGN KEY (
			email
		)
		REFERENCES account (
			email
		);

ALTER TABLE tipboard
	ADD
		CONSTRAINT FK_admin_TO_tipboard
		FOREIGN KEY (
			email
		)
		REFERENCES admin (
			email
		);

ALTER TABLE eventboard
	ADD
		CONSTRAINT FK_admin_TO_eventboard
		FOREIGN KEY (
			email
		)
		REFERENCES admin (
			email
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_admin_TO_notice
		FOREIGN KEY (
			email
		)
		REFERENCES admin (
			email
		);