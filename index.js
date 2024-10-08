import express from 'express';
import cors from 'cors';
import ProvinceRouter from './src/controllers/province-controller.js';
import EventRouter from './src/controllers/event-controller.js';
import UserRouter from './src/controllers/user-controller.js';
import LocationController from './src/controllers/location-controller.js';
import EventCategoryController from './src/controllers/event_category-controller.js';
import EventLocationController from './src/controllers/event_location-controller.js';

const app = express();
const port = process.env.API_PORT;

const allowedOrigins = ['http://yuke.ddns.net', 'http://localhost:3000'];
const corsOptions = {
	origin: (origin, callback) => {
		if (allowedOrigins.indexOf(origin) !== -1 || !origin) {
			callback(null, true);
		} else {
			logger.error('No permitido por CORS: ', origin);
			callback(new Error('No permitido por CORS'));
		}
	},
	credentials: true,
};

app.use(cors(corsOptions));
app.use(express.json());
app.use('/api/dai/province', ProvinceRouter);
app.use('/api/dai/event', EventRouter);
app.use('/api/dai/user', UserRouter);
app.use('/api/dai/location', LocationController);
app.use('/api/dai/event-category', EventCategoryController);
app.use('/api/dai/event-location', EventLocationController);

app.use((req, res, next) => {
	res.status(404).json({ message: 'Ruta no encontrada' });
});

app.listen(port, () => {
	console.log('Aplicacion abierta en el puerto: ', port);
});
