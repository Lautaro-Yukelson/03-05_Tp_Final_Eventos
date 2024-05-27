import UserRepository from '../repositories/user-repository.js';

export default class UserService {
	constructor() {
		this.repo = new UserRepository();
	}

	async getUsers() {
		try {
			return await this.repo.getUsers();
		} catch (error) {
			throw new Error('Service error - getUsers() : ' + error.message);
		}
	}

	async login({username, password}) {
		try {
			const user = await this.repo.getUser(username);
			if (user != null){
				return user[0].password == password ? [{success: true, message: 'Sesion iniciada correctamente', token : '123'}, 200] : [{success: false, message: 'Usuario o contraseña invalidos', token : ''}, 401];
			} else {
				return [{success: false, message: 'Usuario inexistente', token : ''}, 401];
			}
		} catch (error) {
			throw new Error('Service error - getUsers() : ' + error.message);
		}
	}
}