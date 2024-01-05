--функція яка видаляє з таблиці book всі книги в яких рейтинг < 4
drop function if exists clean_book();

create or replace function clean_book() returns void
language plpgsql
as $$
begin
	delete from book_author where book_id in (select book_id from book where rating < 4);
	delete from book where rating < 4;
end;
$$
		