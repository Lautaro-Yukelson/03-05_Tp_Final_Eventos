import { response } from 'express';
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

	async getEventDetails(id) {
		try {
			let response = [];

			const event = await this.repo.getEventDetails(id);
			const eventCreatorUser = await this.repo.getCreatorUser(event[0].id_creator_user);
			const eventLocation = await this.repo.getEventLocation(event[0].id_event_location);
			const eventLocationLocation = await this.repo.getLocation(eventLocation[0].id_location);
			const eventLocationLocationProvince = await this.repo.getProvince(eventLocationLocation[0].id_province);
			const eventLocationCreatorUser = await this.repo.getCreatorUser(eventLocation[0].id_creator_user);
			const tags = await this.repo.getEventTags(event[0].id);
			const eventCategory = await this.repo.getEventCategory(event[0].id_event_category);

			response = {
				...event[0],
				event_location: {
					...eventLocation[0],
					location: {
						...eventLocationLocation[0],
						province: eventLocationLocationProvince[0],
					},
					creator_user: eventLocationCreatorUser[0],
				},
				tags: tags[0],
				creator_user: eventCreatorUser[0],
				event_category: eventCategory[0],
			};
			return response;
		} catch (error) {
			throw new Error(
				'Error al obtener los detalles del evento: ' + error.message,
			);
		}
	}
	

	async getEnrollments(id, query) { // Cambiar la firma del método
		try {
			return await this.repo.getEnrollments(id, query); // Llamada al método del repositorio con los parámetros correctos
		} catch (error) {
			throw new Error('Error al obtener los registros: ' + error.message);
		}
	}
	
}
