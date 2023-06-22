const jsonServer = require('json-server');
const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

server.use(middlewares);
server.use(jsonServer.bodyParser);

server.post('/auth/login', (req, res) => {
  const { email, password } = req.body;

  const user = router.db.get('users').find({ email, password }).value();

  if (user) {
    res.sendStatus(200);
  } else {
    res.status(403).send({message: 'Usuário ou senha incorretos'});
  }
});

server.post('/find/revisions', (req, res) => {
  const { idUser } = req.body;
  const revisions = router.db.get('revisions').filter({ idUser }).value();
  if (revisions.length > 0) {
    res.json(revisions);
  } else {
    res.status(403).send({ message: 'Revisão não encontrada' });
  }
});


server.use(router);
server.listen(3000, () => {
  console.log('JSON Server is running in port http://localhost:3000');
});