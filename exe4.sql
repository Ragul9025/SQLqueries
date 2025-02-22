use db;

delimiter //
create function cases(flag int, a int , b int) returns varchar(40)deterministic
begin
  declare abre varchar(40) ;
  set abre=case
    when flag=1 then a+b
    when flag=2 then a-b
    when flag=3 then a*b
    when flag=4 then 
	    case when b=0 then 'in appropriate'
             when b=1 && a=8 then a
             else a/b
        end
   end;
   return abre;
   end //
   delimiter ;
   
select  grade,name,   cases (1,grade,grade) from calc;

delimiter //
create function arithmetic (oper varchar(20),o1 int, o2 int)returns varchar(100) deterministic
begin 
    return case
    when oper='add' then o1+o2
    when oper='min' then o1-o2
    when oper='mul' then o1*o2
    when oper='div' then 
       case
           when o2=0 then 'in appropriate second operent is 0'
          end
	
		  when o2=1 and o1>1 then o1
            when  o1=o2  then 1
            when o2>o1 then 
            	case when o1<o2 then o1/o2
            else o1/o2
       end
    end;
   end //
   
select grade, name , arithmetic('add',5,grade) from calc;
select arithmetic('min',6,5);
select arithmetic('mul',5,5);
select arithmetic ('div',2,10);
select arithmetic('sqrt',20,0);
select 5  between 3 and 7;

-- use cascading-- 
delimiter //
create function int_to_double(val int) returns double deterministic
begin
      declare value double;
      set value = convert(val,double);
      return value;
     end // 
	delimiter ;
    select int_to_double(20);
    
   delimiter //
   create function var_decimal(val varchar(30))returns decimal(10,2) deterministic
      begin 
            declare res decimal(10,2);
            set res = CAST(VAL AS DECIMAL(10,2));
            RETURN RES;
            END //
        DELIMITER ; 
        
  SELECT VAR_DECIMAL('123.89');
  
 --  CONVERT VARCHAR TO DATE--
 DELIMITER //
 CREATE FUNCTION VAR_TO_DATE(DET VARCHAR(30)) RETURNS DATE DETERMINISTIC
 BEGIN 
      RETURN CONVERT(DET,DATE);
	END //
    DELIMITER ;
 SELECT VAR_TO_DATE('2012 -2- 3') AS DATE;
 
--  CONVERT DATE TO  VARCHAR -- 
DELIMITER --
CREATE FUNCTION DATE_TO_VAR(VAL DATE)RETURNS VARCHAR (30) DETERMINISTIC
 BEGIN
     RETURN DATE_FORMAT(VAL,'%Y-%M-%D');
     END --
     DELIMITER ;
	
    SELECT DATE_TO_VAR('2002-8-9') AS DATE;
    
    DELIMITER --
CREATE FUNCTION VARS_TO_DATE(VAL VARCHAR(20))RETURNS DATE DETERMINISTIC
 BEGIN
     RETURN STR_TO_DATE(VAL,'%Y-%M-%D');
     END --
     DELIMITER ;
     
  SELECT VARS_TO_DATE("2012-7-9") AS DATE ;