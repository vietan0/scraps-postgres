SELECT 'Alfredo''s Pizza';

-- $$ is useful when content has many single quotes
-- (similar to backticks)
-- SELECT $$Alfredo's Pizza$$;
SELECT $function$ 
  BEGIN 
    RETURN ($1 ~ $q$ [\t\r\n\v\\] $q$);
  END;
$function$