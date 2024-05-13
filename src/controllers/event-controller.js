import {Router} from 'express';
import EventService from '../services/event-service.js';

const router = Router();
const svc = new EventService();

router.get('/', async (req, res) => {
	try {
		const returnArray = await svc.getEvents(req.query);
		return res.status(200).json(returnArray);
	} catch (error) {
		console.error('Error al obtener los eventos:', error);
		return res.status(500).send('Error al obtener los eventos');
	}
});

router.get('/:id', async (req, res) => {
	try {
		const returnArray = await svc.getEventDetails(req.params);
		return res.status(200).json(returnArray);
	} catch (error) {
		console.error('Error al obtener los detalles del evento:', error);
		return res.status(500).send('Error al obtener los eventos');
	}
});

export default router;
