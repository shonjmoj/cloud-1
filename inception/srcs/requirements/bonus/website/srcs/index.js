const http = require('http');
const fs = require('fs');

const PORT = 5000;

const server = http.createServer((req, res) => {
	if (req.url === '/') {
		fs.readFile('/node-server/index.html', 'utf-8', (err, data) => {
			if (err)
				console.log(err);
			res.write(data);
			res.end();
		});
	}
	else
		res.end('No Path !');
});

server.listen(PORT);