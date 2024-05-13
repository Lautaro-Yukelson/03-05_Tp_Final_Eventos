import EventRepository from '../repositories/event-repository.js';

export default class EventService {
	constructor() {
		this.repo = new EventRepository();
	}

	async getEvents(query) {
		try {
			return await this.repo.getEvents(query);
		} catch (error) {
			throw new Error('Error al obtener los eventos: ' + error.message);
		}
	}

	async getEventDetails(query) {
		try {
			return await this.repo.getEventDetails(query);
		} catch (error) {
			throw new Error(
				'Error al obtener los detalles del evento: ' + error.message,
			);
		}
	}

	async getEnrrollments(query) {
		try {
			return await this.repo.getEvents(query);
		} catch (error) {
			throw new Error('Error al obtener los eventos: ' + error.message);
		}
	}
}
