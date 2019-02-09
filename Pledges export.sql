/* Find all GIFT records with one or more associated Installment records.  These are pledges OR recurring gifts. */
SELECT DISTINCT
g.CONSTIT_ID
, g.ID as GiftId
, g.Amount
, g.DTE as receive_date
, FUND.DESCRIPTION as fund
, FUND.FUND_ID
, CAMPAIGN.DESCRIPTION as campaign
, APPEAL.DESCRIPTION as appeal
, g.PAYMENT_TYPE
, g.ACKNOWLEDGEDATE
, DBO.TranslateGiftType(g.TYPE) as type
, g.REF as note
,DATE_1ST_PAY
,g.DATEADDED
,g.DATECHANGED
,INSTALLMENT_FREQUENCY
,NUMBER_OF_INSTALLMENTS
,POST_DATE
,POST_STATUS
,REMIND_FLAG
,Schedule_Month
,Schedule_DayOfMonth
,Schedule_MonthlyDayOfWeek
,Schedule_Spacing
,Schedule_MonthlyType
,Schedule_MonthlyOrdinal
,Schedule_WeeklyDayOfWeek
,Schedule_DayOfMonth2
,Schedule_SMDayType1
,Schedule_SMDayType2
,NextTransactionDate
,Schedule_EndDate
,FrequencyDescription
, r.CONSTITUENT_ID
FROM Gift g
LEFT JOIN GiftSplit gs on g.ID = gs.GiftId
LEFT JOIN FUND on gs.FundId = FUND.id
LEFT JOIN APPEAL on gs.AppealId = APPEAL.id
LEFT JOIN CAMPAIGN on gs.CampaignId = CAMPAIGN.id 
LEFT JOIN RECORDS r ON g.CONSTIT_ID = r.ID
JOIN Installment i ON g.ID = i.PledgeId