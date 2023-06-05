import React from 'react';
import axios from 'axios';
import { useForm } from 'react-hook-form';

import styles from './newRouteForm.module.css';

type FormData = {
    difficult_level: string;
    climbing_date: Date;
    comments: string;
};

const API_URL = process.env.NEXT_PUBLIC_API_ROUTE_URL || 'http://localhost:8080';

const convertToTimestamp = (dateStr: string) => {
    const dateObj = new Date(dateStr);
    return dateObj.getTime() / 1000;
};

export const NewRouteForm: React.FC = () => {
    const { register, handleSubmit, formState: { errors } } = useForm<FormData>();
    const onSubmit = async (data: FormData) => {
        try {
            const { climbing_date, ...postData } = data;
            const timestamp = convertToTimestamp(climbing_date.toString());

            const response = await axios.post(`${API_URL}/route/create`, {
                ...postData,
                climbing_time: timestamp,
            });
            console.log(response.data);
        } catch (error) {
            console.error(error);
        }
    };

    const today = new Date().toISOString().split('T')[0];

    return (
        <div className={styles.container}>
            <form onSubmit={handleSubmit(onSubmit)} className={styles.form}>
                <div className={styles.item}>
                    <label>
                        Difficult level:
                        <select {...register("difficult_level", { required: true })} className={styles.input}>
                            <option value="">Seleccione</option>
                            <option value="V">V</option>
                            <option value="V+">V+</option>
                            <option value="6a">6a</option>
                            {/* Agrega más opciones según lo necesites */}
                        </select>
                    </label>
                    {errors.difficult_level && <p className={styles.error}>Este campo es obligatorio</p>}
                </div>
                <div className={styles.item}>
                    <label>
                        Fecha:
                        <input type="date" {...register("climbing_date", { required: true })} className={styles.input} max={today}/>
                    </label>
                    {errors.climbing_date && <p className={styles.error}>Este campo es obligatorio</p>}
                </div>

                <div className={styles.item}>
                <label>
                    Comentario:
                    <textarea {...register("comments")} className={styles.input}/>
                </label>
                </div>
                <div className={styles.item}>
                    <input type="submit" value="Crear ruta" className={styles.input} />
                </div>
            </form>
        </div>
    );
}

