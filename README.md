# Server Stats
Navigate to `server-stats` folder

```
cd server-stats/

```

Grant [`server-stats.sh`](http://server-stats.sh/) executable permission

```
chmod +x server-stats.sh

```

### Adding Script to Path

Confirm `$PATH`

```
echo $PATH

```

Move the [server-stats.sh](http://server-stats.sh/) script

```
mv server-stats.sh /usr/local/bin/

```

Make Script Executable

```
chmod +x /usr/local/bin/server-stats.sh

```

Verify that script is in your `$PATH`

```
which server-stats.sh

```

Run the script

```
server-stats.sh

```