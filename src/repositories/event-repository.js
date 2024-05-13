import config from '../configs/db-config.js';
import pkg from 'pg';

const { Pool } = pkg;
const pool = new Pool(config);

export default class EventRepository {
    async getEvents({ name, category, startdate, tag }) {
        const client = await pool.connect();
        try {
            let sql = 'SELECT e.id, e.name AS event_name, e.description, e.start_date, e.duration_in_minutes, e.price, e.enabled_for_enrollment, e.max_assistance, ec.name AS category_name, t.name FROM events AS e INNER JOIN event_categories AS ec ON e.id_event_category = ec.id INNER JOIN event_tags AS et on e.id = et.id_event INNER JOIN tags as t on t.id = et.id_tag';
            const values = [];
            let cont = 1;
            if (name != undefined) {
                sql += ` AND e.name = $${cont}`;
                cont++;
                values.push(name);
            }
            if (category != undefined) {
                sql += ` AND ec.name = $${cont}`;
                cont++;
                values.push(category);
            }
            if (startdate != undefined) {
                sql += ` AND e.start_date = $${cont}`;
                cont++;
                values.push(startdate);
            }
            if (tag != undefined) {
                sql += ` AND e.id IN (SELECT id_event FROM event_tags WHERE id_tag = (SELECT id FROM tags WHERE name = $${cont}))`;
                cont++;
                values.push(tag);
            }
            const result = await client.query(sql, values);
            return result.rows;
        } finally {
            client.release();
        }
    }
}
