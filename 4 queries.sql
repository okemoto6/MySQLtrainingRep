-- Feeling like repeating some light beer but have remnant of malt, which 3 batches had the least malt in it?
select BatchID, BatchName, GristSum_KG from batches_details order by GristSum_KG asc limit 3;
-- Thx SQL, I'll brew 'Rice Nelson APA' again, it was a nice beer.

-- Which equipment I've used most in 2021?
select Equipment as Equipment_type, count(Equipment) as Used_sum from batches_details where BrewDate between '2021-01-01' and '2021-12-31' group by Equipment_type order by count(equipment) desc;
-- No suprises here, kettle is the king of brewing like pike is the king of the waters.

-- Want to brew sth but the weather is hot, show me yeast strains with highest fermentation temperatures.
select ID, YeastName, YeastType, FermTempMax_C from yeast order by FermTempMax_C desc limit 10;
-- Thx SQL, kveik saved the day. Again.

-- I would like to brew a crystal clear lager. I remember that I've already brewed one and it came out great but don't remember which batch was it and which yeast I've used. Can you help with that?
select batches_details.BatchName as batch, yeast.YeastName as YeastStrain from batches_details join yeast on yeast.ID = batches_details.Yeast where yeast.YeastType = 'Lager' and yeast.Flocculation = 'high';
-- Great, it was one of those, thanks.

-- Want to make a gift for a friend but he doesn't like bitter beer. Please show me a list of previous batches that I could brew again
select BatchID, BatchName, Bitterness_IBU, 
	case
		when Bitterness_IBU between 1 and 30 then 'OK'
		when Bitterness_IBU between 31 and 45 then 'Not sure'
		else 'Nope.' 
	end as Info
from batches_details order by Info desc;
-- Thx, will choose one of those. 