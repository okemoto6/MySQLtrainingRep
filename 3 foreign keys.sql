ALTER TABLE batches_details
ADD CONSTRAINT fk_equipment
FOREIGN KEY (Equipment) REFERENCES equipment(ID);

alter table batches 
add constraint
foreign key(ID) references batches_details(BatchID);

alter table batches_details
add constraint fk_yeastid
foreign key(Yeast) references yeast(ID);

alter table batches_details
add constraint
foreign key(BatchStyle) references bjcp_guideline(style_id);

alter table batches
add constraint
foreign key(yeast) references batches_details(Yeast);

alter table batches
add constraint
foreign key(style_name) references batches_details(BatchStyle);