data = LOAD '/user/somasundaram/pig/campaign_analysis/dev/sample1' as (keyword: chararray, campaign_id: chararray, date: chararray,
          time: chararray, website: chararray, was_clicked: int, cpc: int, country: chararray, placement: chararray);

reordered = FOREACH unique generate campaign_id,
              date,
              time,
              UPPER(TRIM(kepword)),
              website,
              placement,
              was_clicked,
              cpc,
              'p1' as source;

STORE reordered INTO '/user/somasundaram/campaign_analysis/dev/sample1_reordered';