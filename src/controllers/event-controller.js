import { Router } from 'express';
import EventService from '../services/event-service.js';

const router = Router();
const svc = new EventService();

const handleRequest = (serviceMethod) => async (req, res) => {
	try {
		const [response, status] = await serviceMethod(req);
		return res.status(status).json(response);
	} catch (error) {
		console.error(`Controller error - ${req.method} ${req.path} : `, error);
		return res.status(500).send({
			success: false,
			message: `Controller error - ${req.method} ${req.path}`,
		});
	}
};

router.get(
	'/',
	handleRequest((req) => svc.getEvents(req.query)),
);

router.get(
	'/:id',
	handleRequest((req) => svc.getEventDetails(req.params.id)),
);

router.get(
	'/:id/enrollment',
	handleRequest((req) => svc.getEnrollments(req.params.id, req.query)),
);

export default router;
