import EventRepository from "../repositories/event-repository.js";

export default class EventService {
	constructor() {
		this.repo = new EventRepository();
	}

	async getEvents(query) {
		try {
            //const {name, category, startdate, tag} = query;
			return await this.repo.getEvents(query);
		} catch (error) {
			throw new Error('Error al obtener los eventos: ' + error.message);
		}
	}
}
