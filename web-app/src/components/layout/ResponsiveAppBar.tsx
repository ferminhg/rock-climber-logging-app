import {Toolbar, Typography} from "@mui/material";
import AddBoxTwoToneIcon from '@mui/icons-material/AddBoxTwoTone';
import Button from "@mui/material/Button";
import {makeStyles} from "@mui/styles";

const useStyles = makeStyles((theme) => ({
    menuButton: {
        backgroundColor: "#D9D9D9",
        color: "#3C6E71",
        "&:hover": {
            backgroundColor: "#3C6E71",
            color: "#D9D9D9"
        }
    },
}));


export  function ResponsiveAppBar() {
    const classes = useStyles();

    return (
        <Toolbar disableGutters>
            <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
                You Rock 🧗‍
            </Typography>
            <Button  className={classes.menuButton} size="small" variant="contained" endIcon={<AddBoxTwoToneIcon />} href="/route/new">
                New route
            </Button>
        </Toolbar>
    )
}