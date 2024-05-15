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

    async getEventDetails(id) {
        const client = await pool.connect();
        try {
            let sql = 'SELECT * FROM events WHERE id = $1';
            const values = [id];
            const result = await client.query(sql, values);
            return result.rows;
        } finally {
            client.release();
        }
    }

    async getEventLocation(id){
        const client = await pool.connect();
        try{
            let sql = "SELECT * FROM event_locations WHERE id = $1";
            const values = [id];
            const result = await client.query(sql, values);
            return result.rows;
        } finally{
            client.release();
        }
    }

    async getLocation(id){
        const client = await pool.connect();
        try{
            let sql = "SELECT * FROM locations WHERE id = $1";
            const values = [id];
            const result = await client.query(sql, values);
            return result.rows;
        } finally{
            client.release();
        }
    }

    async getEventTags(eventId) {
        const client = await pool.connect();
        try {
            let sql = 'SELECT * FROM event_tags WHERE id_event = $1';
            const values = [eventId];
            const result = await client.query(sql, values);
            return result.rows;
        } finally {
            client.release();
        }
    }

    async getCreatorUser(id){
        const client = await pool.connect();
        try{
            let sql = "SELECT * FROM users WHERE id = $1";
            const values = [id];
            const result = await client.query(sql, values);
            return result.rows;
        } finally{
            client.release();
        }
    }

    async getEventCategory(id){
        const client = await pool.connect();
        try{
            let sql = "SELECT * FROM event_categories WHERE id = $1";
            const values = [id];
            const result = await client.query(sql, values);
            return result.rows;
        } finally{
            client.release();
        }
    }

    async getEnrollments({ name, category, startdate, tag }) {
        const client = await pool.connect();
        try {
            let sql = 'SELECT u.first_name, u.last_name, u.username, ee.attended, ee.rating FROM users AS u INNER JOIN event_enrollments AS ee ON ee.id_user = u.id ';
            const values = [];
            let cont = 1;
            if (first_name != undefined) {
                sql += ` AND u.first_name = $${cont}`;
                cont++;
                values.push(name);
            }
            if (last_name != undefined) {
                sql += ` AND u.last_name = $${cont}`;
                cont++;
                values.push(category);
            }
            if (username != undefined) {
                sql += ` AND u.username = $${cont}`;
                cont++;
                values.push(startdate);
            } //RETOMAR ACA IAO
            if (attended != undefined) {
                sql += ` AND e.id IN (SELECT id_event FROM event_tags WHERE id_tag = (SELECT id FROM tags WHERE name = $${cont}))`;
                cont++;
                values.push(tag);
            }
            if (rating != undefined) {
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
