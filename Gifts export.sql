use RE7
SELECT
gs.GiftId
, g.CONSTIT_ID as records_id
, p.APPEAL_ID as appeal_id
, p.ID as package_id
, gs.Amount
, g.RECEIPT_AMOUNT
, g.DTE as gift_date
, g.DATE_1ST_PAY
, g.DATEADDED
, CAMPAIGN.DESCRIPTION as campaign
, FUND.DESCRIPTION as fund
, APPEAL.DESCRIPTION as appeal
, p.DESCRIPTION as package
, g.PAYMENT_TYPE
, g.ACKNOWLEDGE_FLAG
, g.CHECK_NUMBER
, g.CHECK_DATE
, g.BATCH_NUMBER
, g.ANONYMOUS
, gst.LONGDESCRIPTION as giftsubtype
, g.TYPE
, DBO.TranslateGiftType(g.TYPE) as type2
, g.REF
, g.REFERENCE_DATE
, g.REFERENCE_NUMBER
, g.ANONYMOUS
, g.ACKNOWLEDGE_FLAG
, g.AcknowledgeDate
, g.GiftSubType
FROM GiftSplit gs
LEFT JOIN FUND on gs.FundId = FUND.id
LEFT JOIN APPEAL on gs.AppealId = APPEAL.id
LEFT JOIN CAMPAIGN on gs.CampaignId = CAMPAIGN.id 
LEFT JOIN GIFT g on gs.GiftId = g.ID
LEFT JOIN Package p on gs.PackageId = p.ID
LEFT JOIN TABLEENTRIES gst on g.GIFTSUBTYPE = gst.TABLEENTRIESID