USE RE7
SELECT
RECORDS.id
, RECORDS.is_constituent
, RECORDS.last_name
, RECORDS.first_name
, RECORDS.org_name
, PHONES.phonetypeid
, PHONES.num
, PHONES.DO_NOT_CALL
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
FROM RECORDS
LEFT JOIN CONSTIT_ADDRESS ON RECORDS.id = CONSTIT_ADDRESS.constit_id
LEFT JOIN dbo.ADDRESS ON CONSTIT_ADDRESS.id = ADDRESS.id
LEFT JOIN CONSTIT_ADDRESS_PHONES ON ADDRESS.id = CONSTIT_ADDRESS_PHONES.constitaddressid
LEFT JOIN PHONES ON CONSTIT_ADDRESS_PHONES.phonesid = PHONES.phonesid
where num is not null
order by records.last_name asc, records.first_name asc, records.org_name asc