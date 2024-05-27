import {Router} from 'express';
import UserService from '../services/user-service.js';

const router = Router();
const svc = new UserService();

router.get('/', async (req, res) => {
	try {
		const returnArray = await svc.getUsers(req.query);
		return res.status(200).json(returnArray);
	} catch (error) {
		console.error('Error al obtener los usuarios:', error);
		return res.status(500).send('Error al obtener los usuarios');
	}
});

export default router;
