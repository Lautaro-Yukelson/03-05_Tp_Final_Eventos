import { response } from 'express';
import EventRepository from '../repositories/event-repository.js';

export default class EventService {
	constructor() {
		this.repo = new EventRepository();
	}

	async getEvents(query) {
		try {
			const response = await this.repo.getEvents(query);
			return response.length > 0
				? [{ success: true, response: response }, 200]
				: [{ success: false, message: 'No hay eventos para mostrar' }, 404];
		} catch (error) {
			throw new Error('Service error - getEvents(): \n' + error);
		}
	}

	async getEventDetails(id) {
		try {
			const response = await this.repo.getEventDetails(id);
			return response.length > 0
				? [{ success: true, response: response }, 200]
				: [{ success: false, message: 'No existe un evento con ese ID' }, 404];
		} catch (error) {
			throw new Error('Service error - getEventsDetailes(id): \n' + error);
		}
	}

	async getEnrollments(id, query) {
		try {
			const response = this.repo.getEnrollments(id, query);
			return response.length > 0
				? [{ success: true, response: response }, 200]
				: [{ success: false, message: 'No hay enrollments para ese evento' }, 404];
		} catch (error) {
			throw new Error('Service error - getEnrollments(id, query): \n' + error);
		}
	}

	async addEvent({ body }) {
		try {
			await this.repo.addEvent(body);
		} catch (error) {
			throw new Error('Service error - addEvent({body}): \n' + error);
		}
	}
}
