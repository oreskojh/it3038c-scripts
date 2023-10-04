var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require('ip');

http.createServer(function(req, res){

    if (req.url === "/") {
        fs.readFile("./public/index.html", "UTF-8", function(err, body){
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(body);
    });
}
    else if(req.url.match("/sysinfo")) {
        myHostName=os.hostname();
	var cpuAmount = os.cpus().length;
	var totalMemory = os.totalmem() / 1024 / 1024;
	totalMemory = totalMemory.toFixed(3);
	var freeMemory = os.freemem() / 1024 / 1024;
	freeMemory = freeMemory.toFixed(2);
	var upTimeSec = os.uptime();
	var upTimeMin = upTimeSec / 60;
	var upTimeHour = upTimeMin / 60;
	var upTimeDay = upTimeHour / 24;
	upTimeSec = Math.floor(upTimeSec);
	upTimeMin = Math.floor(upTimeMin);
	upTimeHour = Math.floor(upTimeHour);
	upTimeDay = Math.floor(upTimeDay);
	upTimeDay = upTimeDay % 24;
	upTimeHour = upTimeHour % 60;
	upTimeMin = upTimeMin % 60;
	upTimeSec = upTimeSec % 60;

        html=`    
        <!DOCTYPE html>
        <html>
          <head>
            <title>Node JS Response</title>
          </head>
          <body>
            <p>Hostname: ${myHostName}</p>
            <p>IP: ${ip.address()}</p>
            <p>Server Uptime: Days: ${upTimeDay}, Hours: ${upTimeHour}, Minutes: ${upTimeMin}, Seconds: ${upTimeSec} </p>
            <p>Total Memory: ${totalMemory}MB </p>
            <p>Free Memory: ${freeMemory}MB </p>
            <p>Number of CPUs: ${cpuAmount} </p>            
          </body>
        </html>` 
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(html);
    }
    else {
        res.writeHead(404, {"Content-Type": "text/plain"});
        res.end(`404 File Not Found at ${req.url}`);
    }
}).listen(3000);

console.log("Server listening on port 3000");
