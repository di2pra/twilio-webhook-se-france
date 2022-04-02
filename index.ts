import express, { NextFunction, Request, Response } from 'express';
import path from 'path';
import twilio from 'twilio';
import { createServer } from 'http';
import { fileURLToPath } from 'url';
import enforce from 'express-sslify';
import routes from './routes/index.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const accountSid = process.env.TWILIO_ACCOUNT_SID || '';
const twilioApiKey: string = process.env.TWILIO_API_KEY || '';
const twilioApiSecret: string = process.env.TWILIO_API_SECRET || '';

const twilioClient = twilio(twilioApiKey, twilioApiSecret, { accountSid: accountSid });

const app = express();
const httpServer = createServer(app);

const PORT = process.env.PORT || 80;

if (process.env.NODE_ENV != 'development') {
  app.use(enforce.HTTPS({ trustProtoHeader: true }));
  app.use(twilio.webhook());
}

app.use(express.json());

app.use(express.urlencoded({
  extended: false
}));

/*const requestFilter = (req: Request, res: Response, next: NextFunction) => {
  res.locals.log = logWithRequestData(req.method, req.path, uuidv4());
  next();
};

const logWithRequestData = (method: string, path: string, id: string) => (...message : any) => {
  console.log(`[${method}][${path}][${id}]`, ...message);
};

app.use(requestFilter);*/

if (process.env.NODE_ENV != 'development') {
  app.use(twilio.webhook());
}

app.get('/', (req : Request, res : Response) => {
  res.send('Twilio Webhook is running!')
});

routes(app);

httpServer.listen(PORT, () => {
  console.info(`Application started at ${PORT}`)
});