USE RE7
SELECT     cc.constit_id as record_id, t.LONGDESCRIPTION, cc.DATE_FROM, cc.DATE_TO, c.NAME
FROM         dbo.Constituent_Codes AS cc INNER JOIN
                      dbo.TABLEENTRIES AS t ON cc.CODE = t.TABLEENTRIESID INNER JOIN
                      dbo.CODETABLES AS c ON c.NAME = 'Constituent Codes' AND t.CODETABLESID = c.CODETABLESID