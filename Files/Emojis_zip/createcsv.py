import os
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="gpb"
)

print(mydb)
mycursor = mydb.cursor()

sql = '''CREATE TABLE IF NOT EXISTS emojis (
    name VARCHAR(255) PRIMARY KEY,
    eset VARCHAR(255) NOT NULL,
    file VARCHAR(255) UNIQUE KEY NOT NULL
  )
'''

mycursor.execute(sql)

for (root,_, f) in os.walk('./'):
  for filename in f:
    new = filename.replace("-", "_")
    if new != filename:
      os.rename(root + os.sep + filename, root + os.sep + new)

for ddir in os.listdir(os.getcwd()):
    if os.path.isdir(ddir):
        for (_,_, f) in os.walk(os.getcwd() + os.path.sep + ddir):
            for e in f:
              sql = 'INSERT INTO emojis (name, eset, file) VALUES (%s, %s, %s)'
              val = (e.split('.')[0], ddir, e)
              mycursor.execute(sql, val)
              mydb.commit()

              
    