import React from 'react';
import axios from 'axios';
import { useForm } from 'react-hook-form';

import {Container, FormControl, InputLabel, MenuItem, Select, TextField, Typography} from "@mui/material";
import Button from "@mui/material/Button";

type FormData = {
    difficult_level: string;
    climbing_date: Date;
    comments: string;
};

const API_URL = process.env.NEXT_PUBLIC_API_ROUTE_URL || 'http://localhost:8080';

const convertToTimestamp = (dateStr: string) => {
    const parts = dateStr.split("-").map((part) => parseInt(part, 10));
    const dateObj = new Date(parts[0], parts[1] - 1, parts[2]);
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
            window.location.href = '/';
        } catch (error) {
            console.error(error);
        }
    };

    const today = new Date().toISOString().split('T')[0];

    return (
        <Container component="form" onSubmit={handleSubmit(onSubmit)}>
            <FormControl fullWidth margin="normal">
                <InputLabel id="difficult-level-label">Difficult level</InputLabel>
                <Select  {...register("difficult_level", { required: true })}>
                    <MenuItem value=""><em>Select difficult</em></MenuItem>
                    <MenuItem value="V">V</MenuItem>
                    <MenuItem value="V+">V+</MenuItem>
                    <MenuItem value="6a">6a</MenuItem>
                    <MenuItem value="6a+">6a+</MenuItem>
                    <MenuItem value="6b">6b</MenuItem>
                    <MenuItem value="6b+">6b+</MenuItem>
                </Select>
                {errors.difficult_level && <Typography color="error">This is mandatory.</Typography>}
            </FormControl>
            <FormControl fullWidth margin="normal">
                <InputLabel shrink htmlFor="climbing_date">
                    When did you climb it?
                </InputLabel>
                <TextField {...register("climbing_date", { required: true })}
                           type="date"
                           InputLabelProps={{ shrink: true }}
                           inputProps={{ max: today }}
                />
                {errors.climbing_date && <Typography color="error">This is mandatory.</Typography>}
            </FormControl>
            <FormControl fullWidth margin="normal">
                <InputLabel shrink htmlFor="comments">
                    Comments
                </InputLabel>
                <TextField {...register("comments")} multiline rows={4} />
            </FormControl>
            <Button type="submit" variant="contained" color="primary">Save</Button>
        </Container>
    );
}
