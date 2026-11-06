DECLARE
    n NUMBER ;
    fact NUMBER ;
    i NUMBER ;

BEGIN
     n := 38;
    fact := 1;
    i := 1;
    WHILE i <= n LOOP
        fact := fact * i;
        i := i + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Factorial = ' || fact);
END;
