import React from "react";
import { withStyles } from "@mui/material/styles";
import  Grid  from "@material-ui/core/Grid";
import Paper from '@material-ui/core/Paper';

const useStyles = withStyles((theme) => ({
  root: {
    flexGrow: 1,
    marginTop: theme.spacing(4),
  },
  paper: {
    padding: theme.spacing(2),
    textAlign: "center",
    color: theme.palette.text.secondary,
  },
}));

const CBCBlock = () => {
  const classes = useStyles();

  return (
    <Grid item xs={12} sm={6} md={4} lg={3}>
      <Paper className={classes.paper}>CBC Test</Paper>
    </Grid>
  );
};

const LiverFunctionBlock = () => {
  const classes = useStyles();

  return (
    <Grid item xs={12} sm={6} md={4} lg={3}>
      <Paper className={classes.paper}>Liver Function Test</Paper>
    </Grid>
  );
};

export default function PatientResultPage() {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        <Grid item xs={12}>
          <Paper className={classes.paper}>Top Bar</Paper>
        </Grid>
        <Grid item xs={3}>
          <Paper className={classes.paper}>Side Bar</Paper>
        </Grid>
        <Grid item container xs={9} spacing={3}>
          <CBCBlock />
          <LiverFunctionBlock />
        </Grid>
      </Grid>
    </div>
  );
}
