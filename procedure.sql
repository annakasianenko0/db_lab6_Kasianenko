--процедура, яка надає ім'я книги зв вказаним id в аргументі
-- процедура get_book_name()
drop procedure if exists insert_category(integer, varchar);
create or replace procedure insert_category(category_id_arg integer, name_arg varchar)
language plpgsql
as $$
begin
	insert into category(category_id, name)
		values(category_id_arg, name_arg );
end;
$$;
