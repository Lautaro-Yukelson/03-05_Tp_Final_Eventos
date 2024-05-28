-- Tabla: event_categories
INSERT INTO public.event_categories (name, display_order) VALUES 
('Conferencias', 1),
('Talleres', 2),
('Seminarios', 3),
('Webinars', 4);

-- Tabla: users
INSERT INTO public.users (first_name, last_name, username, password) VALUES 
('Juan', 'Perez', 'jperez@gmail.com', 'password1'),
('Ana', 'Lopez', 'alopez@gmail.com', 'password2'),
('Luis', 'Gomez', 'lgomez@gmail.com', 'password3'),
('Maria', 'Martinez', 'mmartinez@gmail.com', 'password4');

-- Tabla: provinces
INSERT INTO public.provinces (name, full_name, latitude, longitude, display_order) VALUES 
('Buenos Aires', 'Provincia de Buenos Aires', -34.6037, -58.3816, 1),
('Cordoba', 'Provincia de Cordoba', -31.4167, -64.1833, 2),
('Santa Fe', 'Provincia de Santa Fe', -31.6333, -60.7000, 3),
('Mendoza', 'Provincia de Mendoza', -32.8908, -68.8272, 4);

-- Tabla: locations
INSERT INTO public.locations (name, id_province, latitude, longitude) VALUES 
('Centro de Convenciones', 1, -34.6037, -58.3816),
('Sala de Conferencias', 2, -34.6118, -58.4173),
('Auditorio Central', 3, -34.6090, -58.3900),
('Espacio Cultural', 4, -34.6158, -58.4333);

-- Tabla: tags
INSERT INTO public.tags (name) VALUES 
('Tecnología'),
('Salud'),
('Educación'),
('Finanzas');

-- Tabla: event_locations
INSERT INTO public.event_locations (id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES 
(1, 'Centro de Convenciones', 'Calle Falsa 123', 500, -34.6037, -58.3816, 1),
(2, 'Sala de Conferencias', 'Calle Real 456', 200, -34.6118, -58.4173, 2),
(3, 'Auditorio Central', 'Av. Siempreviva 789', 300, -34.6090, -58.3900, 3),
(4, 'Espacio Cultural', 'Boulevard Ficticio 1011', 100, -34.6158, -58.4333, 4);

-- Tabla: events
INSERT INTO public.events (name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user) VALUES 
('Conferencia Tech 2024', 'Una conferencia sobre las últimas tecnologías.', 1, 1, '2024-06-15 09:00:00', 120, 50.0, TRUE, 100, 1),
('Taller de Programación', 'Aprende a programar en Python.', 2, 2, '2024-06-20 14:00:00', 180, 30.0, TRUE, 50, 2),
('Seminario de Salud', 'Discusión sobre las tendencias en salud.', 3, 3, '2024-06-25 10:00:00', 90, 20.0, TRUE, 75, 3),
('Webinar de Finanzas', 'Gestión financiera para principiantes.', 4, 4, '2024-07-01 16:00:00', 60, 10.0, TRUE, 150, 4);

-- Tabla: event_tags
INSERT INTO public.event_tags (id_event, id_tag) VALUES 
(1, 1),
(1, 3),
(2, 1),
(3, 2),
(4, 4);

-- Tabla: event_enrollments
INSERT INTO public.event_enrollments (id_event, id_user, description, registration_date_time, attended, observations, rating) VALUES 
(1, 1, 'Interesado en nuevas tecnologías', '2024-06-01 10:00:00', TRUE, 'Muy informativo', 5),
(2, 2, 'Quiero aprender a programar', '2024-06-05 11:00:00', TRUE, 'Excelente taller', 4),
(3, 3, 'Interesado en salud', '2024-06-10 12:00:00', FALSE, 'No pude asistir', 3),
(4, 4, 'Interesado en finanzas', '2024-06-15 13:00:00', TRUE, 'Muy útil', 5);
