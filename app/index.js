const Express = require('express');

const app = Express();

app.get('/', (req, res) => {
  res.send('Hello');
});

app.get('/error', (req, res) => {
  error();
});

app.listen(3000, () => {
  setTimeout(() => {
    process.send('ready');
  }, 10000);
});

process.on('uncaughtException', (err) => {
  setTimeout(() => {
    process.exit(1);
  }, 10000);
});
