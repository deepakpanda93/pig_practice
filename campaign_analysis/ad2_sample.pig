data = LOAD '/user/somasundaram/campaign_analysis/dev/sample2' USING PigStorage(',')
        AS (campaign_id: chararray, date: chararray, time: chararray, website: chararray,
        placement: chararray, was_clicked: int, cpc: int, keyword: chararray);

unique = distinct data;

reordered = FOREACH unique generate campaign_id,
              REPLACE(date, '-', '/'),
              time,
              UPPER(TRIM(kepword)),
              website,
              placement,
              was_clicked,
              cpc,
              'p2' as source;

STORE reordered INTO '/user/somasundaram/campaign_analysis/dev/sample2_reordered';


