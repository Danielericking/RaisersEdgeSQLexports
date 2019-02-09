use RE7
SELECT
RECORDS.id
, RECORDS.last_name
, RECORDS.first_name
, RECORDS.org_name
, CONSTITUENT.records_id
, CONSTITUENT.id
, CONSTITUENT.key_name
, CONSTITUENT.first_name
, ADDRESS.address_block
, ADDRESS.city
, ADDRESS.state
, ADDRESS.post_code
, ADDRESS.country
, CONSTIT_ADDRESS.type
, CONSTIT_ADDRESS.indicator
, CONSTIT_ADDRESS.preferred
, CONSTIT_ADDRESS.sendmail
, CONSTIT_ADDRESS.seasonal
, CONSTIT_ADDRESS.seasonal_from
, CONSTIT_ADDRESS.seasonal_to
, CONSTIT_ADDRESS.date_from as valid_from
, CONSTIT_ADDRESS.date_to as valid_to
FROM RECORDS
LEFT JOIN CONSTITUENT ON RECORDS.id = CONSTITUENT.records_id
LEFT JOIN CONSTIT_ADDRESS ON CONSTITUENT.records_id = CONSTIT_ADDRESS.constit_id
LEFT JOIN dbo.ADDRESS ON CONSTIT_ADDRESS.address_id = ADDRESS.id