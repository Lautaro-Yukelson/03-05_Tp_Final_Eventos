import UserRepository from '../repositories/user-repository.js';

export default class UserService {
	constructor() {
		this.repo = new UserRepository();
	}

	async getUsers() {
		try {
			const [response] = await this.repo.getUsers();
			return response.password == password
				? [{ success: true, response: response }, 200]
				: [{ success: false, message: 'No hay usuarios para mostrar' }, 404];
		} catch (error) {
			throw new Error('Service error - getUsers() : ' + error.message);
		}
	}

	async login({ username, password }) {
		try {
			const [user] = await this.repo.getUser(username);
			if (user != null) {
				return user.password == password
					? [
							{
								success: true,
								message: 'Sesion iniciada correctamente',
								token: '123',
							},
							200,
					  ]
					: [
							{ success: false, message: 'Usuario o contraseña invalidos', token: '' },
							401,
					  ];
			} else {
				return [{ success: false, message: 'Usuario inexistente', token: '' }, 401];
			}
		} catch (error) {
			throw new Error('Service error - getUsers() : ' + error.message);
		}
	}
}
