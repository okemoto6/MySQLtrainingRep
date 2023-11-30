-- #1: Feeling like repeating some light beer but have remnant of malt, which 3 batches had the least malt in it?

SELECT batch_id, batch_name, grist_sum
FROM `my-beers-project.my_beers.batches`
ORDER BY grist_sum ASC
LIMIT 5

-- #2: Want to brew something but the weather is hot, show me yeast strains with highest fermentation temperatures

SELECT id, name, temp_max
FROM `my-beers-project.my_beers.yeast`
ORDER BY temp_max DESC
LIMIT 10

-- #3: Which equipment I've used most in 2021?

SELECT eqp.eqp_type AS eqp_type, COUNT(*) AS batches_brewed
FROM `my-beers-project.my_beers.batches` as batches
LEFT JOIN `my-beers-project.my_beers.equipment` as eqp
ON batches.eqp = eqp.id
GROUP BY eqp_type
ORDER BY batches_brewed DESC

-- #4: What is average fermentation time for all my batches?

SELECT CEIL(AVG(ferm_time)) AS avg_ferm_time
FROM(
  SELECT DATE_DIFF(ferm_end, ferm_start, DAY) AS ferm_time
  FROM (
    SELECT CAST(ferm_start AS DATE FORMAT 'DD.MM.YYYY') AS ferm_start, CAST(ferm_end AS DATE FORMAT 'DD.MM.YYYY') AS ferm_end
    FROM `my-beers-project.my_beers.batches`
    )
)

-- #5: What is an average fermentation time by yeast type?

SELECT type, ROUND(AVG(DATE_DIFF(CAST(ferm_end AS DATE FORMAT 'DD.MM.YYYY'), CAST(ferm_start AS DATE FORMAT 'DD.MM.YYYY'), DAY)), 1) as avg_ferm_time
FROM (
  SELECT batches.batch_id, batches.batch_name, batches.yeast, yeast.name, yeast.type, yeast.laboratory, batches.ferm_start, batches.ferm_end
  FROM `my-beers-project.my_beers.batches` as batches
  LEFT JOIN `my-beers-project.my_beers.yeast` as yeast
  ON batches.yeast = yeast.id
  )
GROUP BY type


-- #6: I would like to brew a crystal clear lager. I remember that I've already brewed one and it came out great but don't remember which batch was it and which yeast I've used. Can you help with that?

SELECT batches.batch_id, batches.batch_name, yeast.name
FROM `my-beers-project.my_beers.batches` as batches
LEFT JOIN `my-beers-project.my_beers.yeast` as yeast
ON batches.yeast = yeast.id
WHERE yeast.flocc = "high" AND yeast.type = "Lager"
ORDER BY batches.batch_id