--тригер який дозволяє одразу видалити запис з таблиці book,
--не видаляючи її спочатку в book_author

select * from book_author;


create or replace function delete_record() returns trigger
as
$$
begin
	delete from book_author where book_id = OLD.book_id;
	return OLD;
end;
$$ LANGUAGE plpgsql;



drop trigger if exists delete_from_book_author on book;
create trigger delete_from_book_author before delete on book
	for each row execute function delete_record();

