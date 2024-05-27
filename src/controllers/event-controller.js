import {Router} from 'express';
import EventService from '../services/event-service.js';

const router = Router();
const svc = new EventService();

router.get('/', async (req, res) => {
	try {
		const [response, status] = await svc.getEvents(req.query);
		return res.status(status).json(response);
	} catch (error) {
		console.error('Controller error - get("/") : ', error);
		return res.status(500).send({success: false, message: 'Controller error - get("/")'});
	}
});

router.get('/:id', async (req, res) => {
	try {
		const [response, status] = await svc.getEventDetails(req.params.id);
		return res.status(status).json(response);
	} catch (error) {
		console.error('Controller error - get("/:id") : ', error);
		return res.status(500).send({success: false, message: 'Controller error - get("/:id")'});
	}
});

router.get('/:id/enrollment', async (req, res) => {
	try {
		const [response, status] = await svc.getEnrollments(req.params.id, req.query);
		return res.status(status).json(response);
	} catch (error) {
		console.error('Controller error - get("/:id/enrollment") : ', error);
		return res.status(500).send({success: false, message: 'Controller error - get("/:id/enrollment")'});
	}
});

export default router;
