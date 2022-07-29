
PRINT N'Creating table [#REGION_FLAT] ...';
CREATE TABLE [#REGION_FLAT]
(
	[RF_ID] INT IDENTITY(1, 1) NOT NULL, 
    [RF_NAME] VARCHAR(3) NOT NULL, 
    [RF_ENGLISH_NAME] VARCHAR(50) NOT NULL, 
    [RF_NATIVE_NAME] NVARCHAR(50) NOT NULL, 
    [RF_DISPLAY_NAME] NVARCHAR(50) NOT NULL, 
    [RF_CURRENCY_ENGLISH_NAME] VARCHAR(50) NULL, 
    [RF_CURRENCY_NATIVE_NAME] NVARCHAR(50) NULL, 
    [RF_CURRENCY_SYMBOL] NVARCHAR(8) NOT NULL, 
    [RF_GEO_ID] INT NOT NULL, 
    [RF_IS_METRIC] BIT NOT NULL, 
    [RF_ISO_CURRENCY_SYMBOL] VARCHAR(3) NOT NULL, 
    [RF_ISO_REGION_NAME_3] CHAR(3) NULL, 
    [RF_ISO_REGION_NAME_2] VARCHAR(3) NOT NULL, 
    [RF_POPULATION] INT NULL
);

PRINT N'Merging into [#REGION_FLAT] ...';
MERGE INTO [#REGION_FLAT] AS [target] USING 
(VALUES 
	 ('029', 'Caribbean', N'Caraïbes', N'Caraïbes', 'East Caribbean Dollar', N'dollar des Caraïbes orientales', N'EC$', 10039880, 0, 'XCD', NULL, '029', NULL)
	,('029', 'Caribbean', N'Caribbean', N'Caribbean', 'East Caribbean Dollar', N'XCD', N'EC$', 10039880, 0, 'XCD', NULL, '029', NULL)
	,('029', 'Caribbean', N'Caribbean', N'Caribbean', 'East Caribbean Dollar', N'East Caribbean Dollar', N'EC$', 10039880, 0, 'XCD', NULL, '029', NULL)
	,('419', 'Latin America', N'Latinoamérica', N'Latinoamérica', NULL, NULL, N'¤', 161832257, 1, '¤¤', NULL, '419', NULL)
	,('AE', 'United Arab Emirates', N'الإمارات العربية المتحدة', N'الإمارات العربية المتحدة', 'United Arab Emirates Dirham', N'درهم إماراتي', N'د.إ.‏', 224, 1, 'AED', 'ARE', 'AE', 928410)
	,('AF', 'Afghanistan', N'افغانستان', N'افغانستان', 'Afghan Afghani', N'افغانۍ', N'؋', 3, 1, 'AFN', 'AFG', 'AF', 40200000)
	,('AL', 'Albania', N'Shqipëri', N'Shqipëri', 'Albanian Lek', N'Leku shqiptar', N'Lekë', 6, 1, 'ALL', 'ALB', 'AL', 2845955)
	,('AM', 'Armenia', N'Հայաստան', N'Հայաստան', 'Armenian Dram', N'հայկական դրամ', N'֏', 7, 1, 'AMD', 'ARM', 'AM', 2963900)
	,('AR', 'Argentina', N'Argentina', N'Argentina', 'Argentine Peso', N'peso argentino', N'$', 11, 1, 'ARS', 'ARG', 'AR', 45605826)
	,('AT', 'Austria', N'Österreich', N'Österreich', 'Euro', N'Euro', N'€', 14, 1, 'EUR', 'AUT', 'AT', 8935112)
	,('AU', 'Australia', N'Australia', N'Australia', 'Australian Dollar', N'Australian Dollar', N'$', 12, 1, 'AUD', 'AUS', 'AU', 25977900)
	,('AZ', 'Azerbaijan', N'Azərbaycan', N'Azərbaycan', 'Azerbaijani Manat', N'Azərbaycan Manatı', N'₼', 5, 1, 'AZN', 'AZE', 'AZ', 10130100)
	,('AZ', 'Azerbaijan', N'Азәрбајҹан', N'Азәрбајҹан', 'Azerbaijani Manat', N'AZN', N'₼', 5, 1, 'AZN', 'AZE', 'AZ', 10130100)
	,('BA', 'Bosnia & Herzegovina', N'Bosna i Hercegovina', N'Bosna i Hercegovina', 'Bosnia-Herzegovina Convertible Mark', N'konvertibilna marka', N'KM', 25, 1, 'BAM', 'BIH', 'BA', 3824782)
	,('BA', 'Bosnia & Herzegovina', N'Bosna i Hercegovina', N'Bosna i Hercegovina', 'Bosnia-Herzegovina Convertible Mark', N'Bosanskohercegovačka konvertibilna marka', N'KM', 25, 1, 'BAM', 'BIH', 'BA', 3824782)
	,('BA', 'Bosnia & Herzegovina', N'Босна и Херцеговина', N'Босна и Херцеговина', 'Bosnia-Herzegovina Convertible Mark', N'Конвертибилна марка', N'КМ', 25, 1, 'BAM', 'BIH', 'BA', 3824782)
	,('BA', 'Bosnia & Herzegovina', N'Босна и Херцеговина', N'Босна и Херцеговина', 'Bosnia-Herzegovina Convertible Mark', N'Босанскохерцеговачка конвертибилна марка', N'КМ', 25, 1, 'BAM', 'BIH', 'BA', 3824782)
	,('BD', 'Bangladesh', N'বাংলাদেশ', N'বাংলাদেশ', 'Bangladeshi Taka', N'বাংলাদেশী টাকা', N'৳', 23, 1, 'BDT', 'BGD', 'BD', 161376708)
	,('BE', 'Belgium', N'België', N'België', 'Euro', N'Euro', N'€', 21, 1, 'EUR', 'BEL', 'BE', 11492641)
	,('BE', 'Belgium', N'Belgique', N'Belgique', 'Euro', N'euro', N'€', 21, 1, 'EUR', 'BEL', 'BE', 11492641)
	,('BG', 'Bulgaria', N'България', N'България', 'Bulgarian Lev', N'Български лев', N'лв.', 35, 1, 'BGN', 'BGR', 'BG',  6863422)
	,('BH', 'Bahrain', N'البحرين', N'البحرين', 'Bahraini Dinar', N'دينار بحريني', N'د.ب.‏', 17, 1, 'BHD', 'BHR', 'BH', 1569446)
	,('BN', 'Brunei', N'Brunei', N'Brunei', 'Brunei Dollar', N'Dolar Brunei', N'$', 37, 1, 'BND', 'BRN', 'BN', 460345)
	,('BO', 'Bolivia', N'Bolivia', N'Bolivia', 'Bolivian Boliviano', N'boliviano', N'Bs', 26, 1, 'BOB', 'BOL', 'BO', 11428245)
	,('BR', 'Brazil', N'Brasil', N'Brasil', 'Brazilian Real', N'Real brasileiro', N'R$', 32, 1, 'BRL', 'BRA', 'BR', 212688125)
	,('BT', 'Bhutan', N'འབྲུག', N'འབྲུག', 'Bhutanese Ngultrum', N'དངུལ་ཀྲམ', N'Nu.', 34, 1, 'BTN', 'BTN', 'BT', 754388)
	,('BW', 'Botswana', N'Botswana', N'Botswana', 'Botswanan Pula', N'BWP', N'P', 19, 1, 'BWP', 'BWA', 'BW', 2254608)
	,('BY', 'Belarus', N'Беларусь', N'Беларусь', 'Belarusian Ruble', N'беларускі рубель', N'Br', 29, 1, 'BYN', 'BLR', 'BY', 9255524)
	,('BZ', 'Belize', N'Belize', N'Belize', 'Belize Dollar', N'Belize Dollar', N'$', 24, 1, 'BZD', 'BLZ', 'BZ', 419199)
	,('CA', 'Canada', N'Canada', N'Canada', 'Canadian Dollar', N'CAD', N'CA$', 39, 1, 'CAD', 'CAN', 'CA', 38526760)
	,('CA', 'Canada', N'Canada', N'Canada', 'Canadian Dollar', N'Canadian Dollar', N'$', 39, 1, 'CAD', 'CAN', 'CA', 38526760)
	,('CA', 'Canada', N'Canada', N'Canada', 'Canadian Dollar', N'dollar canadien', N'$ CA', 39, 1, 'CAD', 'CAN', 'CA', 38526760)
	,('CD', 'Congo (DRC)', N'Congo (République démocratique du)', N'Congo (République démocratique du)', 'Congolese Franc', N'franc congolais', N'FC', 44, 1, 'CDF', 'COD', 'CD', 92377993)
	,('CH', 'Switzerland', N'Schweiz', N'Schweiz', 'Swiss Franc', N'Schweizer Franken', N'CHF', 223, 1, 'CHF', 'CHE', 'CH', 8570146)
	,('CH', 'Switzerland', N'Suisse', N'Suisse', 'Swiss Franc', N'franc suisse', N'CHF', 223, 1, 'CHF', 'CHE', 'CH', 8570146)
	,('CH', 'Switzerland', N'Svizra', N'Svizra', 'Swiss Franc', N'franc svizzer', N'CHF', 223, 1, 'CHF', 'CHE', 'CH', 8570146)
	,('CH', 'Switzerland', N'Svizzera', N'Svizzera', 'Swiss Franc', N'franco svizzero', N'CHF', 223, 1, 'CHF', 'CHE', 'CH', 8570146)
	,('CI', 'Ivory Coast', N'Côte d’Ivoire', N'Côte d’Ivoire', 'West African CFA Franc', N'franc CFA (BCEAO)', N'CFA', 119, 1, 'XOF', 'CIV', 'CI', 26378274)
	,('CL', 'Chile', N'Chile', N'Chile', 'Chilean Peso', N'Peso chileno', N'$', 46, 1, 'CLP', 'CHL', 'CL', 17574003)
	,('CL', 'Chile', N'Chile', N'Chile', 'Chilean Peso', N'CLP', N'CLP', 46, 1, 'CLP', 'CHL', 'CL', 17574003)
	,('CM', 'Cameroon', N'Cameroun', N'Cameroun', 'Central African CFA Franc', N'franc CFA (BEAC)', N'FCFA', 49, 1, 'XAF', 'CMR', 'CM', 26545864)
	,('CN', 'China', N'China', N'China', 'Chinese Yuan', N'юань', N'CN¥', 45, 1, 'CNY', 'CHN', 'CN', 1412600000)
	,('CN', 'China', N'جۇڭگو', N'جۇڭگو', 'Chinese Yuan', N'جۇڭگو يۈەنى', N'￥', 45, 1, 'CNY', 'CHN', 'CN', 1412600000)
	,('CN', 'China', N'རྒྱ་ནག', N'རྒྱ་ནག', 'Chinese Yuan', N'ཡུ་ཨན་', N'¥', 45, 1, 'CNY', 'CHN', 'CN', 1412600000)
	,('CN', 'China', N'ꍏꇩ', N'ꍏꇩ', 'Chinese Yuan', N'CNY', N'¥', 45, 1, 'CNY', 'CHN', 'CN', 1412600000)
	,('CO', 'Colombia', N'Colombia', N'Colombia', 'Colombian Peso', N'peso colombiano', N'$', 51, 1, 'COP', 'COL', 'CO', 50372424)
	,('CR', 'Costa Rica', N'Costa Rica', N'Costa Rica', 'Costa Rican Colón', N'colón costarricense', N'₡', 54, 1, 'CRC', 'CRI', 'CR', 5094118)
	,('CU', 'Cuba', N'Cuba', N'Cuba', 'Cuban Peso', N'peso cubano', N'$', 56, 1, 'CUP', 'CUB', 'CU', 11181595)
	,('CZ', 'Czech Republic', N'Česko', N'Česko', 'Czech Koruna', N'česká koruna', N'Kč', 75, 1, 'CZK', 'CZE', 'CZ', 10701777)
	,('DE', 'Germany', N'Deutschland', N'Deutschland', 'Euro', N'Euro', N'€', 94, 1, 'EUR', 'DEU', 'DE', 83190556)
	,('DE', 'Germany', N'Němska', N'Němska', 'Euro', N'euro', N'€', 94, 1, 'EUR', 'DEU', 'DE', 83190556)
	,('DE', 'Germany', N'Nimska', N'Nimska', 'Euro', N'euro', N'€', 94, 1, 'EUR', 'DEU', 'DE', 83190556)
	,('DK', 'Denmark', N'Danmark', N'Danmark', 'Danish Krone', N'dansk krone', N'kr.', 61, 1, 'DKK', 'DNK', 'DK', 5873420)
	,('DO', 'Dominican Republic', N'República Dominicana', N'República Dominicana', 'Dominican Peso', N'peso dominicano', N'RD$', 65, 1, 'DOP', 'DOM', 'DO', 10878246)
	,('DZ', 'Algeria', N'الجزائر', N'الجزائر', 'Algerian Dinar', N'دينار جزائري', N'د.ج.‏', 4, 1, 'DZD', 'DZA', 'DZ', 44700000)
	,('EC', 'Ecuador', N'Ecuador', N'Ecuador', 'US Dollar', N'dólar estadounidense', N'$', 66, 1, 'USD', 'ECU', 'EC', 17715822)
	,('EE', 'Estonia', N'Eesti', N'Eesti', 'Euro', N'euro', N'€', 70, 1, 'EUR', 'EST', 'EE', 1328439)
	,('EG', 'Egypt', N'مصر', N'مصر', 'Egyptian Pound', N'جنيه مصري', N'ج.م.‏', 67, 1, 'EGP', 'EGY', 'EG', 102674145)
	,('ER', 'Eritrea', N'ኤርትራ', N'ኤርትራ', 'Eritrean Nakfa', N'ERN', N'Nfk', 71, 1, 'ERN', 'ERI', 'ER', 6700000)
	,('ES', 'Spain', N'Espainia', N'Espainia', 'Euro', N'euroa', N'€', 217, 1, 'EUR', 'ESP', 'ES', 47450795)
	,('ES', 'Spain', N'España', N'España', 'Euro', N'euro', N'€', 217, 1, 'EUR', 'ESP', 'ES', 47450795)
	,('ES', 'Spain', N'Espanya', N'Espanya', 'Euro', N'euro', N'€', 217, 1, 'EUR', 'ESP', 'ES', 47450795)
	,('ET', 'Ethiopia', N'Ethiopia', N'Ethiopia', 'Ethiopian Birr', N'ETB', N'Br', 73, 1, 'ETB', 'ETH', 'ET', 117876227)
	,('ET', 'Ethiopia', N'Itoophiyaa', N'Itoophiyaa', 'Ethiopian Birr', N'Itoophiyaa Birrii', N'Br', 73, 1, 'ETB', 'ETH', 'ET', 117876227)
	,('ET', 'Ethiopia', N'ኢትዮጵያ', N'ኢትዮጵያ', 'Ethiopian Birr', N'የኢትዮጵያ ብር', N'Br', 73, 1, 'ETB', 'ETH', 'ET', 117876227)
	,('ET', 'Ethiopia', N'ኢትዮጵያ', N'ኢትዮጵያ', 'Ethiopian Birr', N'የኢትዮጵያ ብር', N'ብር', 73, 1, 'ETB', 'ETH', 'ET', 117876227)
	,('FI', 'Finland', N'Finland', N'Finland', 'Euro', N'euro', N'€', 77, 1, 'EUR', 'FIN', 'FI', 5536146)
	,('FI', 'Finland', N'Finland', N'Finland', 'Euro', N'EUR', N'€', 77, 1, 'EUR', 'FIN', 'FI', 5536146)
	,('FI', 'Finland', N'Suomâ', N'Suomâ', 'Euro', N'euro', N'€', 77, 1, 'EUR', 'FIN', 'FI', 5536146)
	,('FI', 'Finland', N'Suomi', N'Suomi', 'Euro', N'euro', N'€', 77, 1, 'EUR', 'FIN', 'FI', 5536146)
	,('FI', 'Finland', N'Suopma', N'Suopma', 'Euro', N'euro', N'€', 77, 1, 'EUR', 'FIN', 'FI', 5536146)
	,('FO', 'Faroe Islands', N'Føroyar', N'Føroyar', 'Danish Krone', N'donsk króna', N'kr', 81, 1, 'DKK', 'FRO', 'FO', 53752)
	,('FR', 'France', N'France', N'France', 'Euro', N'euro', N'€', 84, 1, 'EUR', 'FRA', 'FR', 6741300)
	,('FR', 'France', N'France', N'France', 'Euro', N'EUR', N'€', 84, 1, 'EUR', 'FRA', 'FR', 6741300)
	,('FR', 'France', N'Frànkrisch', N'Frànkrisch', 'Euro', N'Euro', N'€', 84, 1, 'EUR', 'FRA', 'FR', 6741300)
	,('FR', 'France', N'Frañs', N'Frañs', 'Euro', N'euro', N'€', 84, 1, 'EUR', 'FRA', 'FR', 6741300)
	,('GB', 'United Kingdom', N'An Rìoghachd Aonaichte', N'An Rìoghachd Aonaichte', 'British Pound', N'Punnd Sasannach', N'£', 242, 1, 'GBP', 'GBR', 'GB', 6708100)
	,('GB', 'United Kingdom', N'United Kingdom', N'United Kingdom', 'British Pound', N'British Pound', N'£', 242, 1, 'GBP', 'GBR', 'GB', 6708100)
	,('GB', 'United Kingdom', N'Y Deyrnas Unedig', N'Y Deyrnas Unedig', 'British Pound', N'Punt Prydain', N'£', 242, 1, 'GBP', 'GBR', 'GB', 6708100)
	,('GE', 'Georgia', N'საქართველო', N'საქართველო', 'Georgian Lari', N'ქართული ლარი', N'₾', 88, 1, 'GEL', 'GEO', 'GE', 3728573)
	,('GL', 'Greenland', N'Kalaallit Nunaat', N'Kalaallit Nunaat', 'Danish Krone', N'DKK', N'kr.', 93, 1, 'DKK', 'GRL', 'GL', 56081)
	,('GR', 'Greece', N'Ελλάδα', N'Ελλάδα', 'Euro', N'Ευρώ', N'€', 98, 1, 'EUR', 'GRC', 'GR', 10678632)
	,('GT', 'Guatemala', N'Guatemala', N'Guatemala', 'Guatemalan Quetzal', N'quetzal', N'Q', 99, 1, 'GTQ', 'GTM', 'GT', 17263239)
	,('HK', 'Hong Kong SAR', N'Hong Kong SAR', N'Hong Kong SAR', 'Hong Kong Dollar', N'Hong Kong Dollar', N'HK$', 104, 1, 'HKD', 'HKG', 'HK', 7413070)
	,('HN', 'Honduras', N'Honduras', N'Honduras', 'Honduran Lempira', N'lempira hondureño', N'L', 106, 1, 'HNL', 'HND', 'HN', 9587522)
	,('HR', 'Croatia', N'Hrvatska', N'Hrvatska', 'Croatian Kuna', N'hrvatska kuna', N'HRK', 108, 1, 'HRK', 'HRV', 'HR', 3888529)
	,('HT', 'Haiti', N'Haïti', N'Haïti', 'Haitian Gourde', N'gourde haïtienne', N'G', 103, 1, 'HTG', 'HTI', 'HT', 11439646)
	,('HU', 'Hungary', N'Magyarország', N'Magyarország', 'Hungarian Forint', N'magyar forint', N'Ft', 109, 1, 'HUF', 'HUN', 'HU', 9730000)
	,('ID', 'Indonesia', N'Indonesia', N'Indonesia', 'Indonesian Rupiah', N'Rupiah', N'IDR', 111, 1, 'IDR', 'IDN', 'ID', 273879750)
	,('ID', 'Indonesia', N'Indonesia', N'Indonesia', 'Indonesian Rupiah', N'Rupiah Indonesia', N'Rp', 111, 1, 'IDR', 'IDN', 'ID', 273879750)
	,('IE', 'Ireland', N'Éire', N'Éire', 'Euro', N'Euro', N'€', 68, 1, 'EUR', 'IRL', 'IE', 6572828)
	,('IE', 'Ireland', N'Ireland', N'Ireland', 'Euro', N'Euro', N'€', 68, 1, 'EUR', 'IRL', 'IE', 6572828)
	,('IL', 'Israel', N'ישראל', N'ישראל', 'Israeli New Shekel', N'שקל חדש', N'₪', 117, 1, 'ILS', 'ISR', 'IL', 9498100)
	,('IN', 'India', N'India', N'India', 'Indian Rupee', N'Indian Rupee', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'India', N'India', 'Indian Rupee', N'INR', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'بھارت', N'بھارت', 'Indian Rupee', N'بھارتی روپیہ', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'भारत', N'भारत', 'Indian Rupee', N'भारतीय रुपया', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'भारत', N'भारत', 'Indian Rupee', N'भारतीय रूपिँया', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'भारत', N'भारत', 'Indian Rupee', N'हिंदुस्तानी रुपयो', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'भारतः', N'भारतः', 'Indian Rupee', N'भारतीय रूप्यकम्', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'ভারত', N'ভারত', 'Indian Rupee', N'ভারতীয় রুপি', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'ভাৰত', N'ভাৰত', 'Indian Rupee', N'ভাৰতীয় ৰুপী', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'ભારત', N'ભારત', 'Indian Rupee', N'ભારતીય રૂપિયા', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'ଭାରତ', N'ଭାରତ', 'Indian Rupee', N'ଭାରତୀୟ ଟଙ୍କା', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'இந்தியா', N'இந்தியா', 'Indian Rupee', N'இந்திய ரூபாய்', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'భారతదేశం', N'భారతదేశం', 'Indian Rupee', N'రూపాయి', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'ಭಾರತ', N'ಭಾರತ', 'Indian Rupee', N'ಭಾರತೀಯ ರೂಪಾಯಿ', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IN', 'India', N'ഇന്ത്യ', N'ഇന്ത്യ', 'Indian Rupee', N'ഇന്ത്യൻ രൂപ', N'₹', 113, 1, 'INR', 'IND', 'IN', 1352642280)
	,('IQ', 'Iraq', N'العراق', N'العراق', 'Iraqi Dinar', N'دينار عراقي', N'د.ع.‏', 121, 1, 'IQD', 'IRQ', 'IQ', 40222503)
	,('IR', 'Iran', N'ایران', N'ایران', 'Iranian Rial', N'ریال ایران', N'ریال', 116, 1, 'IRR', 'IRN', 'IR', 83183741)
	,('IS', 'Iceland', N'Ísland', N'Ísland', 'Icelandic Króna', N'íslensk króna', N'ISK', 110, 1, 'ISK', 'ISL', 'IS', 371580)
	,('IT', 'Italy', N'Italia', N'Italia', 'Euro', N'euro', N'€', 118, 1, 'EUR', 'ITA', 'IT', 60317116)
	,('JM', 'Jamaica', N'Jamaica', N'Jamaica', 'Jamaican Dollar', N'Jamaican Dollar', N'$', 124, 1, 'JMD', 'JAM', 'JM', 2726667)
	,('JO', 'Jordan', N'الأردن', N'الأردن', 'Jordanian Dinar', N'دينار أردني', N'د.أ.‏', 126, 1, 'JOD', 'JOR', 'JO', 11042719)
	,('JP', 'Japan', N'日本', N'日本', 'Japanese Yen', N'日本円', N'￥', 122, 1, 'JPY', 'JPN', 'JP', 125584838)
	,('KE', 'Kenya', N'Kenya', N'Kenya', 'Kenyan Shilling', N'Shilingi ya Kenya', N'Ksh', 129, 1, 'KES', 'KEN', 'KE', 54985698)
	,('KG', 'Kyrgyzstan', N'Кыргызстан', N'Кыргызстан', 'Kyrgystani Som', N'Кыргызстан сому', N'сом', 130, 1, 'KGS', 'KGZ', 'KG', 6586600)
	,('KH', 'Cambodia', N'កម្ពុជា', N'កម្ពុជា', 'Cambodian Riel', N'រៀល​កម្ពុជា', N'៛', 40, 1, 'KHR', 'KHM', 'KH', 15552211)
	,('KR', 'Korea', N'대한민국', N'대한민국', 'South Korean Won', N'대한민국 원', N'₩', 134, 1, 'KRW', 'KOR', 'KR', 77000000)
	,('KW', 'Kuwait', N'الكويت', N'الكويت', 'Kuwaiti Dinar', N'دينار كويتي', N'د.ك.‏', 136, 1, 'KWD', 'KWT', 'KW', 4420110)
	,('KZ', 'Kazakhstan', N'Қазақстан', N'Қазақстан', 'Kazakhstani Tenge', N'Қазақстан теңгесі', N'₸', 137, 1, 'KZT', 'KAZ', 'KZ', 19082467)
	,('LA', 'Laos', N'ລາວ', N'ລາວ', 'Laotian Kip', N'ລາວ ກີບ', N'₭', 138, 1, 'LAK', 'LAO', 'LA', 7275556)
	,('LB', 'Lebanon', N'لبنان', N'لبنان', 'Lebanese Pound', N'جنيه لبناني', N'ل.ل.‏', 139, 1, 'LBP', 'LBN', 'LB', 6859408)
	,('LI', 'Liechtenstein', N'Liechtenstein', N'Liechtenstein', 'Swiss Franc', N'Schweizer Franken', N'CHF', 145, 1, 'CHF', 'LIE', 'LI', 38896)
	,('LK', 'Sri Lanka', N'இலங்கை', N'இலங்கை', 'Sri Lankan Rupee', N'இலங்கை ரூபாய்', N'Rs.', 42, 1, 'LKR', 'LKA', 'LK', 22156000)
	,('LK', 'Sri Lanka', N'ශ්‍රී ලංකාව', N'ශ්‍රී ලංකාව', 'Sri Lankan Rupee', N'ශ්‍රී ලංකා රුපියල', N'රු.', 42, 1, 'LKR', 'LKA', 'LK', 22156000)
	,('LT', 'Lithuania', N'Lietuva', N'Lietuva', 'Euro', N'Euras', N'€', 141, 1, 'EUR', 'LTU', 'LT', 2795680)
	,('LU', 'Luxembourg', N'Lëtzebuerg', N'Lëtzebuerg', 'Euro', N'Euro', N'€', 147, 1, 'EUR', 'LUX', 'LU', 633622)
	,('LU', 'Luxembourg', N'Luxembourg', N'Luxembourg', 'Euro', N'euro', N'€', 147, 1, 'EUR', 'LUX', 'LU', 633622)
	,('LU', 'Luxembourg', N'Luxemburg', N'Luxemburg', 'Euro', N'Euro', N'€', 147, 1, 'EUR', 'LUX', 'LU', 633622)
	,('LV', 'Latvia', N'Latvija', N'Latvija', 'Euro', N'eiro', N'€', 140, 1, 'EUR', 'LVA', 'LV', 1907675)
	,('LY', 'Libya', N'ليبيا', N'ليبيا', 'Libyan Dinar', N'دينار ليبي', N'د.ل.‏', 148, 1, 'LYD', 'LBY', 'LY', 6992701)
	,('MA', 'Morocco', N'Maroc', N'Maroc', 'Moroccan Dirham', N'dirham marocain', N'MAD', 159, 1, 'MAD', 'MAR', 'MA', 37112080)
	,('MA', 'Morocco', N'Meṛṛuk', N'Meṛṛuk', 'Moroccan Dirham', N'Derhem Umeṛṛuki', N'MAD', 159, 1, 'MAD', 'MAR', 'MA', 37112080)
	,('MA', 'Morocco', N'المغرب', N'المغرب', 'Moroccan Dirham', N'درهم مغربي', N'د.م.‏', 159, 1, 'MAD', 'MAR', 'MA', 37112080)
	,('MA', 'Morocco', N'ⵍⵎⵖⵔⵉⴱ', N'ⵍⵎⵖⵔⵉⴱ', 'Moroccan Dirham', N'ⴷⵔⵀⵎ ⴰⵎⵖⵔⴰⴱⵉ', N'ⴷⵔ', 159, 1, 'MAD', 'MAR', 'MA', 37112080)
	,('MC', 'Monaco', N'Monaco', N'Monaco', 'Euro', N'euro', N'€', 158, 1, 'EUR', 'MCO', 'MC', 38300)
	,('MD', 'Moldova', N'Republica Moldova', N'Republica Moldova', 'Moldovan Leu', N'leu moldovenesc', N'L', 152, 1, 'MDL', 'MDA', 'MD', 2597100)
	,('MD', 'Moldova', N'Молдова', N'Молдова', 'Moldovan Leu', N'молдавский лей', N'L', 152, 1, 'MDL', 'MDA', 'MD', 2597100)
	,('ME', 'Montenegro', N'Crna Gora', N'Crna Gora', 'Euro', N'Evro', N'€', 270, 1, 'EUR', 'MNE', 'ME', 620739)
	,('ME', 'Montenegro', N'Црна Гора', N'Црна Гора', 'Euro', N'Евро', N'€', 270, 1, 'EUR', 'MNE', 'ME', 620739)
	,('MK', 'North Macedonia', N'Северна Македонија', N'Северна Македонија', 'Macedonian Denar', N'Македонски денар', N'ден.', 19618, 1, 'MKD', 'MKD', 'MK', 1836713)
	,('ML', 'Mali', N'Mali', N'Mali', 'West African CFA Franc', N'franc CFA (BCEAO)', N'CFA', 157, 1, 'XOF', 'MLI', 'ML', 20250833)
	,('MM', 'Myanmar', N'မြန်မာ', N'မြန်မာ', 'Myanmar Kyat', N'မြန်မာ ကျပ်', N'K', 27, 1, 'MMK', 'MMR', 'MM', 53582855 )
	,('MN', 'Mongolia', N'Монгол', N'Монгол', 'Mongolian Tugrik', N'Монгол төгрөг', N'₮', 154, 1, 'MNT', 'MNG', 'MN', 3353470)
	,('MN', 'Mongolia', N'ᠮᠣᠩᠭᠣᠯ', N'ᠮᠣᠩᠭᠣᠯ', 'Mongolian Tugrik', N'ᠳᠥᠬᠥᠷᠢᠭ᠌', N'₮', 154, 1, 'MNT', 'MNG', 'MN', 3353470)
	,('MT', 'Malta', N'Malta', N'Malta', 'Euro', N'ewro', N'€', 163, 1, 'EUR', 'MLT', 'MT', 516100)
	,('MV', 'Maldives', N'Maldives', N'Maldives', 'Maldivian Rufiyaa', N'MVR', N'ރ.', 165, 1, 'MVR', 'MDV', 'MV', 557426 )
	,('MX', 'Mexico', N'México', N'México', 'Mexican Peso', N'peso mexicano', N'$', 166, 1, 'MXN', 'MEX', 'MX', 126014024)
	,('MY', 'Malaysia', N'Malaysia', N'Malaysia', 'Malaysian Ringgit', N'Ringgit Malaysia', N'RM', 167, 1, 'MYR', 'MYS', 'MY', 32730000)
	,('MY', 'Malaysia', N'Malaysia', N'Malaysia', 'Malaysian Ringgit', N'Malaysian Ringgit', N'RM', 167, 1, 'MYR', 'MYS', 'MY', 32730000)
	,('NG', 'Nigeria', N'Naịjịrịa', N'Naịjịrịa', 'Nigerian Naira', N'Naịra', N'₦', 175, 1, 'NGN', 'NGA', 'NG', 211400708)
	,('NG', 'Nigeria', N'Nàìjíríà', N'Nàìjíríà', 'Nigerian Naira', N'Náírà Nàìjíríà', N'₦', 175, 1, 'NGN', 'NGA', 'NG', 211400708)
	,('NG', 'Nigeria', N'Nigeria', N'Nigeria', 'Nigerian Naira', N'NGN', N'NGN', 175, 1, 'NGN', 'NGA', 'NG', 211400708)
	,('NI', 'Nicaragua', N'Nicaragua', N'Nicaragua', 'Nicaraguan Córdoba', N'córdoba nicaragüense', N'C$', 182, 1, 'NIO', 'NIC', 'NI', 6486201)
	,('NL', 'Netherlands', N'Nederlân', N'Nederlân', 'Euro', N'Euro', N'€', 176, 1, 'EUR', 'NLD', 'NL', 17708600)
	,('NL', 'Netherlands', N'Nederland', N'Nederland', 'Euro', N'Euro', N'€', 176, 1, 'EUR', 'NLD', 'NL', 17708600)
	,('NO', 'Norway', N'Noreg', N'Noreg', 'Norwegian Krone', N'norske kroner', N'kr', 177, 1, 'NOK', 'NOR', 'NO', 5425270)
	,('NO', 'Norway', N'Norga', N'Norga', 'Norwegian Krone', N'norgga kruvdno', N'kr', 177, 1, 'NOK', 'NOR', 'NO', 5425270)
	,('NO', 'Norway', N'Norge', N'Norge', 'Norwegian Krone', N'norske kroner', N'kr', 177, 1, 'NOK', 'NOR', 'NO', 5425270)
	,('NO', 'Norway', N'Norway', N'Norway', 'Norwegian Krone', N'NOK', N'NOK', 177, 1, 'NOK', 'NOR', 'NO', 5425270)
	,('NP', 'Nepal', N'नेपाल', N'नेपाल', 'Nepalese Rupee', N'नेपाली रूपैयाँ', N'नेरू', 178, 1, 'NPR', 'NPL', 'NP', 28095714)
	,('NZ', 'New Zealand', N'Aotearoa', N'Aotearoa', 'New Zealand Dollar', N'Tāra o Aotearoa', N'$', 183, 1, 'NZD', 'NZL', 'NZ', 5135610)
	,('NZ', 'New Zealand', N'New Zealand', N'New Zealand', 'New Zealand Dollar', N'New Zealand Dollar', N'$', 183, 1, 'NZD', 'NZL', 'NZ', 5135610)
	,('OM', 'Oman', N'عُمان', N'عُمان', 'Omani Rial', N'ريال عماني', N'ر.ع.‏', 164, 1, 'OMR', 'OMN', 'OM', 4829473)
	,('PA', 'Panama', N'Panamá', N'Panamá', 'Panamanian Balboa', N'balboa panameño', N'B/.', 192, 1, 'PAB', 'PAN', 'PA', 4379039)
	,('PE', 'Peru', N'Perú', N'Perú', 'Peruvian Sol', N'sol peruano', N'S/', 187, 1, 'PEN', 'PER', 'PE', 34294231)
	,('PH', 'Philippines', N'Philippines', N'Philippines', 'Philippine Piso', N'Philippine Peso', N'₱', 201, 1, 'PHP', 'PHL', 'PH', 109991095)
	,('PH', 'Philippines', N'Pilipinas', N'Pilipinas', 'Philippine Piso', N'Piso ng Pilipinas', N'₱', 201, 1, 'PHP', 'PHL', 'PH', 109991095)
	,('PK', 'Pakistan', N'پاکستان', N'پاکستان', 'Pakistani Rupee', N'روپئیہ', N'ر', 190, 1, 'PKR', 'PAK', 'PK', 226992332)
	,('PK', 'Pakistan', N'پاکستان', N'پاکستان', 'Pakistani Rupee', N'پاکستانی روپیہ', N'Rs', 190, 1, 'PKR', 'PAK', 'PK', 226992332)
	,('PK', 'Pakistan', N'پاڪستان', N'پاڪستان', 'Pakistani Rupee', N'پاڪستاني رپي', N'Rs', 190, 1, 'PKR', 'PAK', 'PK', 226992332)
	,('PL', 'Poland', N'Polska', N'Polska', 'Polish Zloty', N'złoty polski', N'zł', 191, 1, 'PLN', 'POL', 'PL', 38179800)
	,('PR', 'Puerto Rico', N'Puerto Rico', N'Puerto Rico', 'US Dollar', N'dólar estadounidense', N'$', 202, 1, 'USD', 'PRI', 'PR', 3285874)
	,('PT', 'Portugal', N'Portugal', N'Portugal', 'Euro', N'euro', N'€', 193, 1, 'EUR', 'PRT', 'PT', 10344802)
	,('PY', 'Paraguay', N'Paraguay', N'Paraguay', 'Paraguayan Guarani', N'PYG', N'₲', 185, 1, 'PYG', 'PRY', 'PY', 7359000)
	,('PY', 'Paraguay', N'Paraguay', N'Paraguay', 'Paraguayan Guarani', N'guaraní paraguayo', N'Gs.', 185, 1, 'PYG', 'PRY', 'PY', 7359000)
	,('QA', 'Qatar', N'قطر', N'قطر', 'Qatari Rial', N'ريال قطري', N'ر.ق.‏', 197, 1, 'QAR', 'QAT', 'QA', 2795484)
	,('RE', 'Réunion', N'La Réunion', N'La Réunion', 'Euro', N'euro', N'€', 198, 1, 'EUR', 'REU', 'RE', 868846)
	,('RO', 'Romania', N'România', N'România', 'Romanian Leu', N'leu românesc', N'RON', 200, 1, 'RON', 'ROU', 'RO', 19186201)
	,('RS', 'Serbia', N'Srbija', N'Srbija', 'Serbian Dinar', N'Srpski dinar', N'RSD', 271, 1, 'RSD', 'SRB', 'RS', 6871547)
	,('RS', 'Serbia', N'Србија', N'Србија', 'Serbian Dinar', N'Српски динар', N'RSD', 271, 1, 'RSD', 'SRB', 'RS', 6871547)
	,('RU', 'Russia', N'Russia', N'Russia', 'Russian Ruble', N'RUB', N'RUB', 203, 1, 'RUB', 'RUS', 'RU', 145478097)
	,('RU', 'Russia', N'Арассыыйа', N'Арассыыйа', 'Russian Ruble', N'Арассыыйа солкуобайа', N'₽', 203, 1, 'RUB', 'RUS', 'RU', 145478097)
	,('RU', 'Russia', N'Россия', N'Россия', 'Russian Ruble', N'Россия сумы', N'₽', 203, 1, 'RUB', 'RUS', 'RU', 145478097)
	,('RU', 'Russia', N'Россия', N'Россия', 'Russian Ruble', N'российский рубль', N'₽', 203, 1, 'RUB', 'RUS', 'RU', 145478097)
	,('RW', 'Rwanda', N'U Rwanda', N'U Rwanda', 'Rwandan Franc', N'RWF', N'RF', 204, 1, 'RWF', 'RWA', 'RW', 12374397)
	,('SA', 'Saudi Arabia', N'المملكة العربية السعودية', N'المملكة العربية السعودية', 'Saudi Riyal', N'ريال سعودي', N'ر.س.‏', 205, 1, 'SAR', 'SAU', 'SA', 34218169)
	,('SE', 'Sweden', N'Ruoŧŧa', N'Ruoŧŧa', 'Swedish Krona', N'ruoŧŧa kruvdno', N'kr', 221, 1, 'SEK', 'SWE', 'SE', 1040207)
	,('SE', 'Sweden', N'Sverige', N'Sverige', 'Swedish Krona', N'svensk krona', N'kr', 221, 1, 'SEK', 'SWE', 'SE', 1040207)
	,('SE', 'Sweden', N'Sweden', N'Sweden', 'Swedish Krona', N'SEK', N'SEK', 221, 1, 'SEK', 'SWE', 'SE', 1040207)
	,('SG', 'Singapore', N'Singapore', N'Singapore', 'Singapore Dollar', N'Singapore Dollar', N'$', 215, 1, 'SGD', 'SGP', 'SG', 5453600)
	,('SI', 'Slovenia', N'Slovenija', N'Slovenija', 'Euro', N'evro', N'€', 212, 1, 'EUR', 'SVN', 'SI', 2108708)
	,('SK', 'Slovakia', N'Slovensko', N'Slovensko', 'Euro', N'euro', N'€', 143, 1, 'EUR', 'SVK', 'SK', 5449270)
	,('SN', 'Senegal', N'Senegaal', N'Senegaal', 'West African CFA Franc', N'Franc CFA bu Afrik Sowwu-jant', N'CFA', 210, 1, 'XOF', 'SEN', 'SN', 15854323)
	,('SN', 'Senegal', N'Senegaal', N'Senegaal', 'West African CFA Franc', N'Mbuuɗu Seefaa BCEAO', N'CFA', 210, 1, 'XOF', 'SEN', 'SN', 15854323)
	,('SN', 'Senegal', N'Sénégal', N'Sénégal', 'West African CFA Franc', N'franc CFA (BCEAO)', N'CFA', 210, 1, 'XOF', 'SEN', 'SN', 15854323)
	,('SO', 'Somalia', N'Soomaaliya', N'Soomaaliya', 'Somali Shilling', N'Shilingka Soomaaliya', N'S', 216, 1, 'SOS', 'SOM', 'SO', 15893219)
	,('SV', 'El Salvador', N'El Salvador', N'El Salvador', 'US Dollar', N'dólar estadounidense', N'$', 72, 1, 'USD', 'SLV', 'SV', 6830000)
	,('SY', 'Syria', N'Syria', N'Syria', 'Syrian Pound', N'SYP', N'SYP', 222, 1, 'SYP', 'SYR', 'SY', 17500657)
	,('SY', 'Syria', N'سوريا', N'سوريا', 'Syrian Pound', N'ليرة سورية', N'ل.س.‏', 222, 1, 'SYP', 'SYR', 'SY', 17500657)
	,('TH', 'Thailand', N'ไทย', N'ไทย', 'Thai Baht', N'บาท', N'฿', 227, 1, 'THB', 'THA', 'TH', 69950850)
	,('TM', 'Turkmenistan', N'Türkmenistan', N'Türkmenistan', 'Turkmenistani Manat', N'Türkmen manady', N'TMT', 238, 1, 'TMT', 'TKM', 'TM', 6031187)
	,('TN', 'Tunisia', N'تونس', N'تونس', 'Tunisian Dinar', N'دينار تونسي', N'د.ت.‏', 234, 1, 'TND', 'TUN', 'TN', 11708370)
	,('TR', 'Turkey', N'Türkiye', N'Türkiye', 'Turkish Lira', N'Türk Lirası', N'₺', 235, 1, 'TRY', 'TUR', 'TR', 84680273)
	,('TT', 'Trinidad & Tobago', N'Trinidad & Tobago', N'Trinidad & Tobago', 'Trinidad & Tobago Dollar', N'Trinidad & Tobago Dollar', N'$', 225, 1, 'TTD', 'TTO', 'TT', 1367558)
	,('UA', 'Ukraine', N'Україна', N'Україна', 'Ukrainian Hryvnia', N'українська гривня', N'₴', 241, 1, 'UAH', 'UKR', 'UA', 41167336)
	,('US', 'United States', N'Estados Unidos', N'Estados Unidos', 'US Dollar', N'dólar estadounidense', N'$', 244, 0, 'USD', 'USA', 'US', 331893745)
	,('US', 'United States', N'ʻAmelika Hui Pū ʻIa', N'ʻAmelika Hui Pū ʻIa', 'US Dollar', N'USD', N'$', 244, 0, 'USD', 'USA', 'US', 331893745)
	,('US', 'United States', N'United States', N'United States', 'US Dollar', N'US Dollar', N'$', 244, 0, 'USD', 'USA', 'US', 331893745)
	,('UY', 'Uruguay', N'Uruguay', N'Uruguay', 'Uruguayan Peso', N'peso uruguayo', N'$', 246, 1, 'UYU', 'URY', 'UY', 3518552)
	,('UZ', 'Uzbekistan', N'Oʻzbekiston', N'Oʻzbekiston', 'Uzbekistani Som', N'O‘zbekiston so‘mi', N'soʻm', 247, 1, 'UZS', 'UZB', 'UZ', 35300000)
	,('UZ', 'Uzbekistan', N'Ўзбекистон', N'Ўзбекистон', 'Uzbekistani Som', N'Ўзбекистон сўм', N'сўм', 247, 1, 'UZS', 'UZB', 'UZ', 35300000)
	,('VE', 'Venezuela', N'Venezuela', N'Venezuela', 'Venezuelan Bolívar', N'bolívar soberano', N'Bs.S', 249, 1, 'VES', 'VEN', 'VE', 28887118)
	,('VN', 'Vietnam', N'Việt Nam', N'Việt Nam', 'Vietnamese Dong', N'Đồng Việt Nam', N'₫', 251, 1, 'VND', 'VNM', 'VN', 96208984)
	,('YE', 'Yemen', N'اليمن', N'اليمن', 'Yemeni Rial', N'ريال يمني', N'ر.ي.‏', 261, 1, 'YER', 'YEM', 'YE', 30491000)
	,('ZA', 'South Africa', N'Aforika Borwa', N'Aforika Borwa', 'South African Rand', N'ZAR', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZA', 'South Africa', N'Afrika Borwa', N'Afrika Borwa', 'South African Rand', N'ZAR', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZA', 'South Africa', N'eMzantsi Afrika', N'eMzantsi Afrika', 'South African Rand', N'iRandi yaseMzanzi Afrika', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZA', 'South Africa', N'iNingizimu Afrika', N'iNingizimu Afrika', 'South African Rand', N'i-South African Rand', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZA', 'South Africa', N'South Africa', N'South Africa', 'South African Rand', N'ZAR', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZA', 'South Africa', N'South Africa', N'South Africa', 'South African Rand', N'South African Rand', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZA', 'South Africa', N'Suid-Afrika', N'Suid-Afrika', 'South African Rand', N'Suid-Afrikaanse rand', N'R', 209, 1, 'ZAR', 'ZAF', 'ZA', 60142978)
	,('ZW', 'Zimbabwe', N'Zimbabwe', N'Zimbabwe', 'US Dollar', N'US Dollar', N'US$', 264, 1, 'USD', 'ZWE', 'ZW', 15092171)
) 
AS [source] ([RF_NAME], [RF_ENGLISH_NAME], [RF_NATIVE_NAME], [RF_DISPLAY_NAME], [RF_CURRENCY_ENGLISH_NAME], [RF_CURRENCY_NATIVE_NAME], [RF_CURRENCY_SYMBOL], [RF_GEO_ID], [RF_IS_METRIC], [RF_ISO_CURRENCY_SYMBOL], [RF_ISO_REGION_NAME_3], [RF_ISO_REGION_NAME_2], [RF_POPULATION]) 
ON [target].[RF_NAME] = [source].[RF_NAME] AND 
   [target].[RF_ISO_REGION_NAME_2] = [source].[RF_ISO_REGION_NAME_2] AND 
   [target].[RF_ENGLISH_NAME] = [source].[RF_ENGLISH_NAME] AND 
   [target].[RF_NATIVE_NAME] = [source].[RF_NATIVE_NAME] AND 
   [target].[RF_DISPLAY_NAME] = [source].[RF_DISPLAY_NAME] AND 
   [target].[RF_CURRENCY_ENGLISH_NAME] = [source].[RF_CURRENCY_ENGLISH_NAME] AND 
   [target].[RF_CURRENCY_NATIVE_NAME] = [source].[RF_CURRENCY_NATIVE_NAME] AND 
   [target].[RF_CURRENCY_SYMBOL] = [source].[RF_CURRENCY_SYMBOL] 

WHEN NOT MATCHED BY TARGET THEN 
	 INSERT ([RF_NAME], [RF_ENGLISH_NAME], [RF_NATIVE_NAME], [RF_DISPLAY_NAME], [RF_CURRENCY_ENGLISH_NAME], [RF_CURRENCY_NATIVE_NAME], [RF_CURRENCY_SYMBOL], [RF_GEO_ID], [RF_IS_METRIC], [RF_ISO_CURRENCY_SYMBOL], [RF_ISO_REGION_NAME_3], [RF_ISO_REGION_NAME_2], [RF_POPULATION]) 
	 VALUES ([source].[RF_NAME], [source].[RF_ENGLISH_NAME], [source].[RF_NATIVE_NAME], [source].[RF_DISPLAY_NAME], [source].[RF_CURRENCY_ENGLISH_NAME], [source].[RF_CURRENCY_NATIVE_NAME], [source].[RF_CURRENCY_SYMBOL], [source].[RF_GEO_ID], [source].[RF_IS_METRIC], [source].[RF_ISO_CURRENCY_SYMBOL], [source].[RF_ISO_REGION_NAME_3], [source].[RF_ISO_REGION_NAME_2], [source].[RF_POPULATION]); 

PRINT N'Merging into [dimensions].[REGION] ...';
MERGE INTO [dimensions].[REGION] AS [target] USING 
(
	SELECT DISTINCT [RF_NAME], [RF_ENGLISH_NAME], [RF_GEO_ID], [RF_POPULATION]
	FROM [#REGION_FLAT]
	WHERE LEN([RF_NAME]) = 2
)
AS [source] ([RF_NAME], [RF_ENGLISH_NAME], [RF_GEO_ID], [RF_POPULATION]) 
ON [target].[R_COUNTRY_CODE] = [source].[RF_NAME]

WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([R_COUNTRY_CODE], [R_ENGLISH_NAME], [R_GEO_ID], [R_POPULATION])
	VALUES ([source].[RF_NAME], [source].[RF_ENGLISH_NAME], [source].[RF_GEO_ID], [RF_POPULATION]);
PRINT N'Defragmenting [dimensions].[REGION] indexes ...';
EXECUTE [utils].[DEFRAG_TABLE_INDEXES] @tableName = N'[dimensions].[REGION]';

PRINT N'Merging into [dimensions].[REGION_CURRENCY] ...';
MERGE INTO [dimensions].[REGION_CURRENCY] AS [target] USING 
(
	SELECT DISTINCT
		  [dimensions].[REGION].[R_COUNTRY_CODE]
		, [#REGION_FLAT].[RF_CURRENCY_SYMBOL]
		, [#REGION_FLAT].[RF_ISO_CURRENCY_SYMBOL]
		, [#REGION_FLAT].[RF_CURRENCY_ENGLISH_NAME]
		, [#REGION_FLAT].[RF_CURRENCY_NATIVE_NAME]
	FROM  [dimensions].[REGION] INNER JOIN [#REGION_FLAT]
	ON [dimensions].[REGION].[R_COUNTRY_CODE] = [#REGION_FLAT].[RF_NAME]

)
AS [source] ([R_COUNTRY_CODE], [RF_CURRENCY_SYMBOL], [RF_ISO_CURRENCY_SYMBOL], [RF_CURRENCY_ENGLISH_NAME], [RF_CURRENCY_NATIVE_NAME]) 

ON [target].[RC_COUNTRY_CODE] = [source].[R_COUNTRY_CODE] AND
   [target].[RC_SYMBOL] = [source].[RF_CURRENCY_SYMBOL] AND
   [target].[RC_ISO_SYMBOL] = [source].[RF_ISO_CURRENCY_SYMBOL] AND
   [source].[RF_CURRENCY_ENGLISH_NAME] IS NOT NULL AND
   [target].[RC_ENGLISH_NAME] = [source].[RF_CURRENCY_ENGLISH_NAME] AND
   [source].[RF_CURRENCY_NATIVE_NAME] IS NOT NULL AND
   [target].[RC_NATIVE_NAME] = [source].[RF_CURRENCY_NATIVE_NAME]
   
WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([RC_COUNTRY_CODE], [RC_SYMBOL], [RC_ISO_SYMBOL], [RC_ENGLISH_NAME], [RC_NATIVE_NAME])
	VALUES (
			  [source].[R_COUNTRY_CODE]
			, [source].[RF_CURRENCY_SYMBOL]
			, [source].[RF_ISO_CURRENCY_SYMBOL]
			, [source].[RF_CURRENCY_ENGLISH_NAME]
			, [source].[RF_CURRENCY_NATIVE_NAME]);
PRINT N'Defragmenting [dimensions].[REGION_CURRENCY] indexes ...';
EXECUTE [utils].[DEFRAG_TABLE_INDEXES] @tableName = N'[dimensions].[REGION_CURRENCY]';
		
PRINT N'Merging into [dimensions].[REGION_DETAIL] ...';
MERGE INTO [dimensions].[REGION_DETAIL] AS [target] USING 
(
	SELECT DISTINCT
		  [dimensions].[REGION].[R_COUNTRY_CODE]
		, [#REGION_FLAT].[RF_NATIVE_NAME]
		, [#REGION_FLAT].[RF_DISPLAY_NAME]
		, [#REGION_FLAT].[RF_IS_METRIC]
		, [#REGION_FLAT].[RF_ISO_REGION_NAME_3]
	FROM  [dimensions].[REGION] INNER JOIN [#REGION_FLAT]
	ON [dimensions].[REGION].[R_COUNTRY_CODE] = [#REGION_FLAT].[RF_NAME]

)
AS [source] ([R_COUNTRY_CODE], [RF_NATIVE_NAME], [RF_DISPLAY_NAME], [RF_IS_METRIC], [RF_ISO_REGION_NAME_3]) 

ON [target].[RD_COUNTRY_CODE] = [source].[R_COUNTRY_CODE] AND
   [target].[RD_NATIVE_NAME] = [source].[RF_NATIVE_NAME] AND
   [target].[RD_DISPLAY_NAME] = [source].[RF_DISPLAY_NAME] AND
   [target].[RD_IS_METRIC] = [source].[RF_IS_METRIC] AND
   [target].[RD_COUNTRY_CODE_3] = [source].[RF_ISO_REGION_NAME_3]
   
WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([RD_COUNTRY_CODE], [RD_NATIVE_NAME], [RD_DISPLAY_NAME], [RD_IS_METRIC], [RD_COUNTRY_CODE_3])
	VALUES (
			  [source].[R_COUNTRY_CODE]
			, [source].[RF_NATIVE_NAME]
			, [source].[RF_DISPLAY_NAME]
			, [source].[RF_IS_METRIC]
			, [source].[RF_ISO_REGION_NAME_3]);
PRINT N'Defragmenting [dimensions].[REGION_DETAIL] indexes ...';
EXECUTE[utils].[DEFRAG_TABLE_INDEXES] @tableName = N'[dimensions].[REGION_DETAIL]';

