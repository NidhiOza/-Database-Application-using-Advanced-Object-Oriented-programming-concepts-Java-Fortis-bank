drop user fortisbank CASCADE;
create user fortisbank identified by 123;
grant connect,resource to fortisbank;
connect fortisbank/123

CREATE TABLE Customer
( vIdNumber numeric(10) NOT NULL ,
  vName varchar2(50) ,
  vPin varchar2(10) NOT NULL ,
  CONSTRAINT Customer_pk PRIMARY KEY (vIdNumber)
);

CREATE TABLE SavingsAccount
( vAccountNumber numeric(10) NOT NULL,
  accountType varchar2(10) NOT NULL,
  vOpenDate date ,
  vBalance numeric(10,2) ,
  vStatus varchar2(10) ,
  vInterestRate numeric(10,2) ,
  vAnnualGain numeric(10,2) ,
  vExtraFee numeric(10,2),
  vIdNumber numeric(10) NOT NULL,
  CONSTRAINT SavingsAccount_pk PRIMARY KEY (vAccountNumber),
  CONSTRAINT fk_SavingsAccount FOREIGN KEY (vIdNumber)
    REFERENCES Customer(vIdNumber)
    ON DELETE CASCADE
);

CREATE TABLE CreditAccount
( vAccountNumber numeric(10) NOT NULL ,
  accountType varchar2(10) NOT NULL ,
  vOpenDate date ,
  vBalance numeric(10,2) ,
  vStatus varchar2(10) ,
  vIdNumber number(10) NOT NULL ,
  CONSTRAINT CreditAccount_pk PRIMARY KEY (vAccountNumber),
  CONSTRAINT fk_CreditAccount FOREIGN KEY (vIdNumber)
    REFERENCES Customer(vIdNumber)
    ON DELETE CASCADE
);

CREATE TABLE CurrencyAccount
( vAccountNumber numeric(10) NOT NULL ,
  accountType varchar2(10) NOT NULL,
  vOpenDate date ,
  vBalance numeric(10,2) ,
  vStatus varchar2(10) ,
  vIdNumber number(10) NOT NULL ,
  CONSTRAINT CurrencyAccount_pk PRIMARY KEY (vAccountNumber),
  CONSTRAINT fk_CurrencyAccount FOREIGN KEY (vIdNumber)
    REFERENCES Customer(vIdNumber)
    ON DELETE CASCADE
);

CREATE TABLE CheckingAccount
( vAccountNumber numeric(10) NOT NULL ,
  accountType varchar2(10) NOT NULL ,
  vOpenDate date ,
  vBalance numeric(10,2) ,
  vStatus varchar2(10) ,
  vExtraFee number(10,2) ,
  vIdNumber number(10) NOT NULL ,
  CONSTRAINT CheckingAccount_pk PRIMARY KEY (vAccountNumber),
  CONSTRAINT fk_CheckingAccount FOREIGN KEY (vIdNumber)
    REFERENCES Customer(vIdNumber)
    ON DELETE CASCADE
);

CREATE TABLE Transaction
( vTransactionNumber numeric(10) NOT NULL,
  accountType varchar2(10) NOT NULL,
  vDescription varchar2(50) ,
  vTransactionDate date  NOT NULL,
  vTransactionType varchar2(10)  NOT NULL,
  vTransactionAmount numeric(10,2) NOT NULL,
  vAccountNumber numeric(10) NOT NULL,
  CONSTRAINT Transaction_pk PRIMARY KEY (vTransactionNumber)
);

commit;


