create table todo (id serial, name varchar(255), description text);
insert into todo (name, description) values ('Clean',' Clean the room');
insert into todo (name, description) values ('Tidy up',' Tidy up the room');
insert into todo (name, description) values ('Organize',' Organize the room');
insert into todo (name, description) values ('Sleep',' Sleep in the room');

create table person (id serial, name varchar(255), description text);
insert into person (name, description) values ('Joao','The portuguese guy');
insert into person (name, description) values ('Miguel',' Another portuguese guybut with a room');
insert into person (name, description) values ('Alex','The Bulgarian guy');
insert into person (name, description) values ('Matthias','The Swiss guy');

create table room (id serial, name varchar(255), description text);
insert into room (name, description) values ('Bedroom','Just an room with a bed');
insert into room (name, description) values ('Livving room','The room where you live');
insert into room (name, description) values ('Kitchen','The room where you ');
insert into room (name, description) values ('Office','The room where you work');

create table typeahead_results (id serial, searchable JSONB,result_type varchar(255),parent_id integer, parent_attr varchar(255), searchable_vector tsvector);

insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name": "Joao",   "description": "The portuguese guy"}', 'person', 1, 'person');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name": "Miguel",   "description": " Another portuguese guy but with a room"}', 'person', 2, 'person');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name": "Alex",   "description": "The Bulgarian guy"}', 'person', 3, 'person');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name": "Matthias",   "description": "The Swiss guy"}', 'person', 4, 'person');

insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Bedroom", "description": "Just an room with a bed"}', 'room', 1, 'room');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Livving room", "description": "The room where you live"}', 'room', 2, 'room');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Kitchen", "description": "The room where you "}', 'room', 3, 'room');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Office", "description": "The room where you work"}', 'room', 4, 'room');

insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Clean", "description":" Clean the room"}', 'todo', 1, 'todo');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Tidy up", "description":" Tidy up the room"}', 'todo', 2, 'todo');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Organize", "description":" Organize the room"}', 'todo', 3, 'todo');
insert into typeahead_results (searchable, result_type, parent_id, parent_attr)
values ('{"name":"Sleep", "description":" Sleep in the room"}', 'todo', 4, 'todo');


UPDATE typeahead_results SET searchable_vector = to_tsvector('simple', searchable);
CREATE INDEX ON typeahead_results USING GIN (searchable_vector);
