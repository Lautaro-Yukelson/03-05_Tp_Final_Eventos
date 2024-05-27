import UserRepository from '../repositories/user-repository.js';

export default class UserService {
	constructor() {
		this.repo = new UserRepository();
	}

	async getUsers() {
		try {
			return await this.repo.getUsers();
		} catch (error) {
			throw new Error('Error al obtener los usuarios: ' + error.message);
		}
	}
}
