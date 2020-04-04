import React, { useState } from 'react';
import ActivityItem from './ActivityItem';
import List from '@material-ui/core/List';
import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import { useActivities } from './ActivitiesProvider';

const ActivityFeed: React.FC = () => {
  const { data: activities, loading: loadingActivities } = useActivities();
  const [showButton, setShowButton] = useState(false);

  return (
    <>
      {!loadingActivities && activities && (
        <Grid container>
          <Button
            color="primary"
            onClick={() => {
              setShowButton(!showButton);
            }}
          >
            {showButton ? 'Hide' : 'Show'}
          </Button>
          <List>
            {activities.map((activity) => (
              <ActivityItem
                key={activity.id}
                showUpdateButtons={showButton}
                {...activity}
              />
            ))}
          </List>
        </Grid>
      )}
    </>
  );
};

export default ActivityFeed;
