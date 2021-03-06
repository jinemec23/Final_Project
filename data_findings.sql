SELECT O.ID_VND_PAYTO,
CONVERT(VARCHAR, O.DATE_ADD, 101) AS DATE_ADD, 
O.ID_VOUCH, 
O.ID_INVC_VND, 
O.REF,
DATALENGTH(O.REF),
SUBSTRING(O.REF,1,6),
SUBSTRING(O.REF,8,4), *
FROM APOPEN O WHERE O.DATE_ADD > '2020-10-01' AND O.REF NOT LIKE '%P/O%'
ORDER BY O.DATE_ADD DESC

SELECT A.ID_VND_PAYTO AS [VENDOR #], 
A.ID_ITEM,
CONVERT(VARCHAR, A.DATE_INVC, 101) AS [INVOICE DATE],
A.ID_VOUCH,
A.ID_INVC_VND,
A.AMT_DISTRIB,
A.ACCT_ID_DB,
A.ACCT_DIV_DB, 
A.ACCT_LOC_DB,
A.ACCT_ID_VA,
* FROM APINTR A WHERE A.DATE_VOUCH > '2020-10-01' AND A.ACCT_ID_DB = '5046' 

SELECT A.ID_VND_PAYTO AS [VENDOR #], 
CONVERT(VARCHAR, A.DATE_INVC, 101) AS [INVOICE DATE],
A.ID_VOUCH,
A.ID_INVC_VND,
A.AMT_DISTRIB,
A.ACCT_ID_DB,
A.ACCT_DIV_DB, 
A.ACCT_LOC_DB,
A.ACCT_ID_VA,
* FROM APINTR A WHERE A.DATE_VOUCH > '2020-10-01' AND A.ACCT_ID_DB = '4009' 

SELECT O.ID_VND_PAYTO,
V.NAME_VND,
V.ID_ST,
CONVERT(VARCHAR, O.DATE_ADD, 101) AS DATE_ADD, 
O.ID_VOUCH, 
O.ID_INVC_VND, 
O.REF,
 A.ID_VND_PAYTO AS [VENDOR #], 
CONVERT(VARCHAR, A.DATE_INVC, 101) AS [INVOICE DATE],
A.ID_VOUCH,
A.ID_INVC_VND,
A.AMT_DISTRIB,
A.ACCT_ID_DB,
A.ACCT_DIV_DB, 
A.ACCT_LOC_DB,
A.ACCT_ID_VA
FROM APOPEN O 
LEFT JOIN APINTR A ON A.ID_VOUCH=O.ID_VOUCH
LEFT JOIN VENMAS_PAYTO V ON V.ID_VND=O.ID_VND_PAYTO
WHERE A.DATE_VOUCH > '2020-10-01' AND A.ACCT_ID_DB = '5046' 

SELECT * FROM VENMAS_PAYTO  V

SELECT P.ID_VOUCH AS [VOUCHER #],
CONVERT(VARCHAR, P.DATE_VOUCH, 101) AS [VOUCH DATE],
P.ID_INVC_VND AS [VENDOR INV#],
CONVERT(VARCHAR,P.DATE_INVC,101) AS [VND INV/SHIP DATE], 
P.ID_PO AS [PO#],
P.ID_ITEM AS [ITEM #],
P.QTY_PAID AS [QTY],
P.AMT_DISTRIB AS [TOTAL COST],
STR(ROUND(P.AMT_DISTRIB/P.QTY_PAID,2),10,4) AS [UNIT_PRICE]
FROM POHIST_LINE_INVC P 
WHERE DATE_VOUCH > '2020-10-01'

SELECT P.ID_VOUCH AS [ID_VOUCH],
CONVERT(VARCHAR, P.DATE_VOUCH, 101) AS [DATE_VOUCH],
P.ID_INVC_VND,
CONVERT(VARCHAR,P.DATE_INVC,101) AS [DATE_INVC], 
P.ID_PO,
P.ID_ITEM,
P.QTY_PAID,
P.AMT_DISTRIB,
STR(ROUND(P.AMT_DISTRIB/P.QTY_PAID,2),10,4) AS [UNIT_PRICE]
FROM POHIST_LINE_INVC P 
WHERE DATE_VOUCH > '2020-10-01'

SELECT TABLE_NAME,
COLUMN_NAME,
IS_NULLABLE,
DATA_TYPE,
CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'POHIST_LINE_INVC' AND (COLUMN_NAME = 'ID_VOUCH' OR COLUMN_NAME = 'ID_PO' OR COLUMN_NAME = 'DATE_VOUCH' OR COLUMN_NAME = 'ID_INVC_VND'OR COLUMN_NAME = 'DATE_INVC'
OR COLUMN_NAME = 'ID_PO'OR COLUMN_NAME = 'ID_ITEM'OR COLUMN_NAME = 'QTY_PAID' OR COLUMN_NAME = 'AMT_DISTRIB')