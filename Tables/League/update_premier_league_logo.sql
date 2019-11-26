UPDATE league
SET logo = LOAD_FILE('C:\Users\Conor\Documents\college_programming\sql_project\bpl.png')
WHERE `name` = 'Premier League';