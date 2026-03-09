SET SESSION group_concat_max_len = 1000000;

SELECT GROUP_CONCAT(
    CONCAT(
        'SELECT ''', table_name, ''' AS table_name, ',
        'COUNT(*) AS row_count, ',
        '(SELECT COUNT(*) FROM information_schema.COLUMNS ',
        'WHERE table_schema = ''RetailMasterDB'' ',
        'AND table_name = ''', table_name, ''') AS column_count ',
        'FROM `RetailMasterDB`.`', table_name, '`'
    )
    SEPARATOR ' UNION ALL '
) INTO @sql
FROM information_schema.TABLES
WHERE table_schema = 'RetailMasterDB'
AND table_type = 'BASE TABLE';

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;