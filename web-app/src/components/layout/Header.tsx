import {AppBar, Container} from "@mui/material";
import {makeStyles} from "@mui/styles";

import {ResponsiveAppBar} from "@/components/layout/ResponsiveAppBar";

const useStyles = makeStyles((theme) => ({
    abRoot: {
        backgroundColor: "#3C6E71"
    },
}));

export function Header() {
    const classes = useStyles();

    return (
        <AppBar position="static" classes={{ root: classes.abRoot}}>
            <Container maxWidth="xl">
                <ResponsiveAppBar />
            </Container>
        </AppBar>
    )
}
