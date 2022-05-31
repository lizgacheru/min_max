
---Using a function to get a value from a specified column on a table

create function min_max( cols text,tables text)
returns SETOF RECORD
 LANGUAGE plpgsql
 AS $$

  begin

      RETURN QUERY EXECUTE 'select format(''%s -> %s'',min('||$1||E'),max('||$1||E') ) AS min_max_var from '||$2||E';';

 end
$$ ;

---How to execute the procedure
select min_max_var from min_max('col_name','table_name') 
as t( min_max_var text)
							