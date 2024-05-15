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
			let responseEvent = await this.repo.getEventDetails(query.id);
			responseEvent = responseEvent[0];
			let responseEventLocation = await this.repo.getEventLocation(responseEvent.id_event_location);
			responseEventLocation = responseEventLocation[0];
			let responseEventLocationLocation = await this.repo.getLocation(responseEventLocation.id);
			responseEventLocationLocation = responseEventLocationLocation[0];
			let responseEventLocationCreatorUser = await this.repo.getCreatorUser(responseEventLocation.id_creator_user);
			responseEventLocationCreatorUser = responseEventLocationCreatorUser[0];
			let responseTags = await this.repo.getEventTags(responseEvent.id);
			responseTags = responseTags[0];
			let responseCreatorUser = await this.repo.getCreatorUser(responseEvent.id_creator_user);
			responseCreatorUser = responseCreatorUser[0];
			let responseEventCategory = await this.repo.getEventCategory(responseEvent.id_event_category);
			responseEventCategory = responseEventCategory[0];

			console.log(responseEventLocation);

			const response = {
				id: responseEvent.id,
				name: responseEvent.name,
				description: responseEvent.description,
				id_event_location: responseEvent.id_event_location,
				start_date: responseEvent.start_date,
				duration_in_minutes: responseEvent.duration_in_minutes,
				price: responseEvent.price,
				enabled_for_enrollment: responseEvent.enabled_for_enrollment,
				max_assistance: responseEvent.max_assistance,
				id_creator_user: responseEvent.id_creator_user,
				id_event_category: responseEvent.id_event_category,
				event_location: {
					id: responseEventLocation.id,
					id_location: responseEventLocation.id_location,
					name: responseEventLocation.name,
					full_address: responseEventLocation.full_address,
					max_capacity: responseEventLocation.max_capacity,
					latitude: responseEventLocation.latitude,
					longitude: responseEventLocation.longitude,
					id_creator_user: responseEventLocation.id_creator_user,
					location: {
						id: responseEventLocation.location.id,
						name: responseEventLocation.location.name,
						id_province: responseEventLocation.location.id_province,
						latitude: responseEventLocation.location.latitude,
						longitude: responseEventLocation.location.longitude,
						province: {
							id: responseEventLocation.location.province.id,
							name: responseEventLocation.location.province.name,
							full_name: responseEventLocation.location.province.full_name,
							latitude: responseEventLocation.location.province.latitude,
							longitude: responseEventLocation.location.province.longitude,
							display_order: responseEventLocation.location.province.display_order
						}
					},
					creator_user: {
						id: responseEventLocationCreatorUser.id,
						first_name: responseEventLocationCreatorUser.first_name,
						last_name: responseEventLocationCreatorUser.last_name,
						username: responseEventLocationCreatorUser.username,
						password: responseEventLocationCreatorUser.password
					}
				},
				tags: responseTags.map(tag => ({ id: tag.id, name: tag.name })),
				creator_user: {
					id: responseCreatorUser.id,
					first_name: responseCreatorUser.first_name,
					last_name: responseCreatorUser.last_name,
					username: responseCreatorUser.username,
					password: responseCreatorUser.password
				},
				event_category: {
					id: responseEventCategory.id,
					name: responseEventCategory.name,
					display_order: responseEventCategory.display_order
				}
			};
	
			return response;
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
