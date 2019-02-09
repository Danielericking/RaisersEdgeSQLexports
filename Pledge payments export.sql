/* Find all pledge installments, and their related payments if they exist. */
SELECT
i.InstallmentId
, i.PledgeId
, i.AdjustmentId
, i.Amount as scheduled_amount
, i.Dte
, ip.Amount as actual_amount
, ip.PaymentId
, g.CONSTIT_ID
, g.RECEIPT_AMOUNT
, g.DTE as receive_date
, g.TYPE
, DBO.TranslateGiftType(g.TYPE) as type
FROM Installment i
LEFT JOIN InstallmentPayment ip ON i.InstallmentId = ip.InstallmentId
LEFT JOIN GIFT g ON ip.PaymentId = g.ID
/* Adjustments are stored in here too - when an adjustment happens, the pledge ID of the original value is blanked */
WHERE i.PledgeId IS NOT NULL 
ORDER BY i.AdjustmentId
/* Write-off Types: Covenant WriteOff, MG Write Off, Write Off */