import express from 'express';
import cors from 'cors';
import ProvinceRouter from './src/controllers/province-controller.js';
import EventRouter from './src/controllers/event-controller.js';
import UserRouter from './src/controllers/user-controller.js';
import LocationController from './src/controllers/location-controller.js';
import EventCategoryController from './src/controllers/event_category-controller.js';

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use('/api/province', ProvinceRouter);
app.use('/api/event', EventRouter);
app.use('/api/user', UserRouter);
app.use('/api/location', LocationController);
app.use('/api/event-category', EventCategoryController);

app.listen(port, () => {
	console.log('Aplicacion abierta en el puerto: ', port);
});
