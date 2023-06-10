import {Box, Container, Typography} from "@mui/material";
import {Copyright} from "@mui/icons-material";

export function Footer() {
    return (
        <Box component="footer" sx={{ bgcolor: 'background.paper', py: 2 }}>
            <Container maxWidth="lg">
                <Typography variant="subtitle2" align="center" gutterBottom>
                    🫶 wop wop <Copyright fontSize="small"/>
                </Typography>
            </Container>
        </Box>
    )
}