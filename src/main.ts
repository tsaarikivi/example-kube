import * as express from 'express';

const app = express();
const port = 8080;

app.get('/ping', (req, res) => res.status(200).send(`${process.env.ENV_NAME}`));

app.listen(port, () => console.log('App listening on port', port));
