CREATE PROCEDURE RegionInsert(
	@RegionDescription nchar(50),
	@RegionId int output
) AS 
BEGIN
	INSERT INTO Region (RegionDescription)
	VALUES (@RegionDescription);

	SET @RegionId = SCOPE_IDENTITY();
END

GO

CREATE PROCEDURE RegionUpdate(
	@RegionDescription nchar(50),
	@RegionId int
) AS 
BEGIN
	UPDATE Region SET RegionDescription = @RegionDescription
	WHERE RegionID = @RegionId;
END

GO

CREATE PROCEDURE RegionDelete(
	@RegionId int output
) AS 
BEGIN
	DELETE Region 
	WHERE RegionID = @RegionId;
END

GO
