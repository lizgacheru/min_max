---Function to get min and max values from variables given 

-- FUNCTION: public.min_max(numeric[])

-- DROP FUNCTION IF EXISTS public.min_max(numeric[]);

CREATE OR REPLACE FUNCTION public.min_max(
	VARIADIC var numeric[],
	OUT result text)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
   SELECT INTO result MIN(var[i]) || '->' ||  max(var[i])
   FROM generate_subscripts(var, 1) g(i);---change format of results here

 END; 
$BODY$;

ALTER FUNCTION public.min_max(numeric[])
    OWNER TO postgres;

--How to execute FUNCTION example

SELECT * FROM min_max2(1.2,3,6,7,9,30,7);