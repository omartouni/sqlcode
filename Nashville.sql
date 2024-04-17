 create table housing( uniqueID int,
     ParcelID varchar(40),
     LandUse varchar(50),
     PropertyAddress varchar(120),
     SaleDate varchar(50),
     SalePrice int,
     LegalReference varchar(100),
     SoldAsVacant varchar(3),
     OwnerName varchar(60),
     OwnerAddress varchar(130),
     Acreage float,
     TaxDistrict varchar(120),
     LandValue int,
     BuildingValue int,
     TotalValue int,
     YearBuilt int,
     Bedrooms int,
     FullBath int,
     HalfBath int);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\nashville.csv'
     INTO TABLE housing
      FIELDS TERMINATED BY ','
      LINES TERMINATED BY '\n'
      IGNORE 1 ROWS;
SELECT
SUBSTRING(PropertyAddress, 1, LOCATE(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress) + 1 , LENGTH(PropertyAddress)) as Address

From housing


ALTER TABLE housing
Add PropertySplitAddress Nvarchar(255);

Update housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, LOCATE(',', PropertyAddress) -1 )


ALTER TABLE housing
Add PropertySplitCity Nvarchar(255);

Update housing
SET PropertySplitCity = SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress) + 1 , LENGTH(PropertyAddress))

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From housing
Group by SoldAsVacant
order by 2




Select SoldAsVacant,
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From housing


Update hosuing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END