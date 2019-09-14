CREATE PROCEDURE addproduct
(
	@PID int ,
	@PName nvarchar(50) ,
	@PDescription nvarchar(100) ,
	@PCategoryName nvarchar(50) 
)

	WITH RECOMPILE

	AS

	IF EXISTS(SELECT * FROM DBO.ProductInfo WHERE ProductID = @PID)
	BEGIN
	PRINT 'ALREADY EXIST'
	END

	ELSE
	BEGIN
	INSERT INTO DBO.ProductInfo VALUES(@PID,@PName,@PDescription,@PCategoryName);
	PRINT 'SUCCESFULLY ADDED'
	END



	EXEC addproduct 11 , 'p_name','p_description','p_category'