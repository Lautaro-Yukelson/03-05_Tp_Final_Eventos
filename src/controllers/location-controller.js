import { Router } from 'express';
import LocationService from '../services/location-service.js';

const router = Router();
const svc = new LocationService();

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
	handleRequest(() => svc.getLocations()),
);

router.get(
	'/:id',
	handleRequest((req) => svc.getLocations(req.params.id)),
);

router.get(
	'/:id/event-locations',
	handleRequest((req) => svc.getEventLocations(req.params.id)),
);

export default router;
