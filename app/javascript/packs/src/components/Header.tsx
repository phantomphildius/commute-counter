import React from 'react';
import Grid from '@material-ui/core/Grid';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import useFetch from '../api';
import { Activity, Savings } from '../data';
import { useActivities } from './ActivitiesProvider';

const Header: React.FC = () => {
  const { data: activities, loading: loadingActivities } = useActivities();
  const { data: savings, loading: loadingSavings } = useFetch<Savings>(
    '/commute/savings',
    null
  );

  const calculateMilesCovered = (activities: Activity[]): string =>
    activities
      .reduce((memo, { distance_miles }) => memo + distance_miles, 0)
      .toFixed();

  const commuteMinutes = 0;
  const buildCommuteMinutesMessage = (commuteMinutes: number): string => {
    if (commuteMinutes > 0) {
      return `You've saved ${commuteMinutes} minutes by doing a non-traditional commute`;
    } else if (commuteMinutes < 0) {
      return `You've non traditional commute has been ${commuteMinutes} minutes more`;
    } else {
      return 'Your non-traditional commute is about the same!';
    }
  };

  return (
    <Grid container spacing={2} justify="center">
      <Grid item xs={3}>
        <Card variant="outlined">
          <CardContent>
            You have saved {!loadingSavings && savings && savings.cost}
          </CardContent>
        </Card>
      </Grid>
      <Grid item xs={3}>
        <Card variant="outlined">
          <CardContent>
            {loadingActivities
              ? 'Loading'
              : `you covered ${
                  activities && calculateMilesCovered(activities)
                } miles`}
          </CardContent>
        </Card>
      </Grid>
      <Grid item xs={3}>
        <Card variant="outlined">
          <CardContent>
            You have saved probably reduced some carbon emissions!
          </CardContent>
        </Card>
      </Grid>
      <Grid item xs={3}>
        <Card variant="outlined">
          <CardContent>
            {buildCommuteMinutesMessage(commuteMinutes)}
          </CardContent>
        </Card>
      </Grid>
    </Grid>
  );
};

export default Header;
