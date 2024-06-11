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
			const response = await this.repo.getEnrollments(id, query);
			return response.length > 0
				? [{ success: true, response: response }, 200]
				: [{ success: false, message: 'No hay enrollments para ese evento' }, 404];
		} catch (error) {
			throw new Error('Service error - getEnrollments(id, query): \n' + error);
		}
	}

	async addEvent({ body, user }) {
		try {
			const {
				name,
				description,
				id_event_category,
				id_event_location,
				start_date,
				duration_in_minutes,
				price,
				enabled_for_enrollment,
				max_assistance,
				max_capacity,
			} = body;

			if (name.length < 3 || description.length < 3) {
				return [
					{
						success: false,
						message: 'El nombre y la descripción deben tener al menos tres letras',
					},
					400,
				];
			}

			const eventLocation = await this.repo.getEventLocation(id_event_location);
			const event_max_capacity = eventLocation[0].max_capacity;
			if (max_assistance > event_max_capacity) {
				return [
					{
						success: false,
						message:
							'La asistencia máxima no puede ser mayor que la capacidad máxima del lugar',
					},
					400,
				];
			}
			if (price < 0 || duration_in_minutes < 0) {
				return [
					{
						success: false,
						message: 'El precio y la duración en minutos no pueden ser valores negativos',
					},
					400,
				];
			}

			await this.repo.addEvent(body);
			return [{ success: true, message: 'Evento creado correctamente' }, 201];
		} catch (error) {
			throw new Error('Service error - addEvent({body}): \n' + error);
		}
	}

	async updateEvent({ body }) {
		console.log(body);
		try {
			const [event] = await this.repo.getEventDetails(body.id);
			if (!event) {
				return [{ success: false, message: 'Evento no encontrado' }, 404];
			}
			if (event.id_creator_user !== body.user.id) {
				return [
					{
						success: false,
						message: 'No tienes permiso para editar este evento',
					},
					403,
				];
			}

			if (body.name.length < 3 || body.description.length < 3) {
				return [
					{
						success: false,
						message: 'El nombre y la descripción deben tener al menos tres letras',
					},
					400,
				];
			}

			if (body.max_assistance > event.event_location.max_capacity) {
				return [
					{
						success: false,
						message:
							'La asistencia máxima no puede ser mayor que la capacidad máxima del lugar',
					},
					400,
				];
			}

			if (body.price < 0 || body.duration_in_minutes < 0) {
				return [
					{
						success: false,
						message: 'El precio y la duración en minutos no pueden ser valores negativos',
					},
					400,
				];
			}

			await this.repo.updateEvent(body);
			return [{ success: true, message: 'Evento actualizado correctamente' }, 200];
		} catch (error) {
			throw new Error('Service error - updateEvent(): \n' + error);
		}
	}

	async deleteEvent(eventId, user) {
		try {
			const [event] = await this.repo.getEventDetails(eventId);
			if (!event) {
				return [{ success: false, message: 'Evento no encontrado' }, 404];
			}

			if (event.id_creator_user !== user.id) {
				return [
					{
						success: false,
						message: 'No tienes permiso para eliminar este evento',
					},
					403,
				];
			}

			const enrollments = await this.repo.getEnrollmentsId(eventId, null);
			if (enrollments.length > 0) {
				return [
					{
						success: false,
						message: 'No se puede eliminar el evento, hay usuarios registrados',
					},
					400,
				];
			}

			await this.repo.deleteEvent(eventId);
			return [{ success: true, message: 'Evento eliminado correctamente' }, 200];
		} catch (error) {
			throw new Error('Service error - deleteEvent(): \n' + error);
		}
	}
}
