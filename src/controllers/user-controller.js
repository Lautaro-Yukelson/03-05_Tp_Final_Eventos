import {Router} from 'express';
import UserService from '../services/user-service.js';

const router = Router();
const svc = new UserService();

router.get('/', async (req, res) => {
	try {
		const response = await svc.getUsers();
		return res.status(200).json(response);
	} catch (error) {
		console.error('Controller error - get("/") : ', error);
		return res.status(500).send({success: false, message: 'Controller error - get("/"'});
	}
});

router.get('/login', async (req, res) => {
	try {
		const [response, status] = await svc.login(req.body);
		return res.status(status).json(response);
	} catch (error) {
		console.error('Controller error - .get("/login") : ', error);
		return res.status(500).send({success: false, message: 'Controller error - .get("/login"'});
	}
});

export default router;
