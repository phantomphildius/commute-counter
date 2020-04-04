import React from 'react';
import { Activity } from '../data';
import Grid from '@material-ui/core/Grid';
import ListItem from '@material-ui/core/ListItem';
import ActivityItemUpdateButtons from './ActivityItemUpdateButtons';
import Card from '@material-ui/core/Card';
import Paper from '@material-ui/core/Paper';

interface Props extends Activity {
  showUpdateButtons: boolean;
}

const ActivityItem: React.FC<Props> = ({
  id,
  name,
  distance_miles,
  time_elapsed_seconds,
  showUpdateButtons,
}) => {
  return (
    <ListItem>
      <Card>
        <Paper>
          <Grid container spacing={2}>
            <Grid item xs={4}>
              {name}
            </Grid>
            <Grid item xs={4}>
              {distance_miles} miles
            </Grid>
            <Grid item xs={4}>
              {(time_elapsed_seconds / 60).toFixed()} minutes
            </Grid>
          </Grid>
        </Paper>
      </Card>
      {showUpdateButtons && <ActivityItemUpdateButtons activityId={id} />}
    </ListItem>
  );
};

export default ActivityItem;
