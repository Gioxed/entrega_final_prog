import express from 'express';
import pool from './db.js';

const router = express.Router();

// Función que envuelve `pool.query` en una promesa para poder utilizar async/await
function queryDatabase(query, params) {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (error, results) => {
            if (error) return reject(error);
            resolve(results);
        });
    });
}

// Middleware para verificar si el usuario está autenticado
function isAuthenticated(req, res, next) {
    if (req.user) {
        return next(); // Si el usuario está autenticado, permite el acceso
    } else {
        return res.status(401).json({ success: false, message: 'Acceso no autorizado: Inicie sesión.' });
    }
}

// Middleware para verificar si el usuario es administrador
function checkAdminRole(req, res, next) {
    if (req.user && req.user.rol === 'administrador') {
        return next(); // Permite acceso si el rol es "administrador"
    } else {
        return res.status(403).json({ success: false, message: 'Acceso denegado: Solo el administrador puede acceder.' });
    }
}

// Middleware para verificar si el usuario es encargado
function checkEncargadoRole(req, res, next) {
    if (req.user && req.user.rol === 'encargado') {
        return next(); // Permite acceso si el rol es "encargado"
    } else {
        return res.status(403).json({ success: false, message: 'Acceso denegado: Solo el departamento de notas puede acceder.' });
    }
}

// Ruta POST para el inicio de sesión de usuario
router.post('/login', async (req, res) => {
    const { dni, password } = req.body;

    try {
        const rows = await queryDatabase('SELECT * FROM usuarios WHERE dni = ?', [dni]);

        if (rows.length > 0) {
            const user = rows[0];
            if (password === user.password) {
                req.user = user; // Almacena los datos del usuario en la solicitud

                let redirectUrl = '/usuario_comun/index.html';
                if (user.rol === 'administrador') {
                    redirectUrl = '/admin/index.html';
                } else if (user.rol === 'encargado') {
                    redirectUrl = '/dept_notas/index.html';
                }

                return res.json({ success: true, redirectUrl });
            } else {
                return res.status(401).json({ success: false, message: 'DNI o contraseña incorrectos' });
            }
        } else {
            return res.status(401).json({ success: false, message: 'Usuario no encontrado' });
        }
    } catch (error) {
        console.error("Error en el servidor:", error);
        return res.status(500).json({ success: false, message: 'Error en el servidor' });
    }
});

// Ruta POST para el registro de usuario
router.post('/register', async (req, res) => {
    const { dni, name, lastname, email, password, role } = req.body;

    try {
        const existingUser = await queryDatabase('SELECT * FROM usuarios WHERE dni = ?', [dni]);
        if (existingUser.length > 0) {
            return res.status(400).json({ success: false, message: 'El usuario ya existe' });
        }

        await queryDatabase('INSERT INTO usuarios (dni, nombre, apellido, email, rol, password) VALUES (?, ?, ?, ?, ?, ?)', 
            [dni, name, lastname, email, role, password]);

        res.json({ success: true, message: 'Usuario registrado exitosamente' });
    } catch (error) {
        console.log("Error en el servidor:", error);
        return res.status(500).json({ success: false, message: 'Error en el servidor' });
    }
});

// Rutas protegidas para administración y departamento de notas

// Ruta para la sección de administración, solo accesible para administradores
router.get('/admin', isAuthenticated, checkAdminRole, (req, res) => {
    res.sendFile('ruta/a/admin/index.html'); // Cambia la ruta según tu estructura
});

// Ruta para la sección del departamento de notas, solo accesible para el rol "encargado"
router.get('/dept_notas', isAuthenticated, checkEncargadoRole, (req, res) => {
    res.sendFile('ruta/a/dept_notas/index.html'); // Cambia la ruta según tu estructura
});

export default router;



