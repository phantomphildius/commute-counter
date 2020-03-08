import React, { useEffect, useState } from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Box from '@material-ui/core/Box';
import Grid from '@material-ui/core/Grid';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import axios from 'axios';

interface Activity {
  name: string;
  id: string;
  distance_miles: number;
  time_elapsed_seconds: number;
}

interface Savings {
  cost: number;
}

interface Response<T> {
  data?: T;
  loading: boolean;
}

function useFetch<T>(url: string, initialValue: [] | null): Response<T> {
  const client = axios.create({
    responseType: 'json',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json' }
  });
  const [data, setData] = useState(initialValue);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async function() {
      try {
        setLoading(true);
        const response = await client.get(url);
        if (response.status === 200) {
          setData(response.data);
        }
      } catch (error) {
        throw error;
      } finally {
        setLoading(false);
      }
    };
    fetchData();
  }, [url]);

  return { loading, data };
}

const CommuteCounter: React.FC = () => {
  const { data: activities, loading: loadingActivities } = useFetch<Activity[]>(
    '/commute/activities',
    []
  );
  const { data: savings, loading: loadingSavings } = useFetch<Savings>(
    '/commute/savings',
    null
  );

  return (
    <>
      <CssBaseline />
      <Box mt={3}>
        You have saved {!loadingSavings && savings && savings.cost}
      </Box>
      {!loadingActivities && activities && (
        <Grid container>
          <List>
            {activities.map(
              ({ id, name, distance_miles, time_elapsed_seconds }) => {
                return (
                  <ListItem key={id}>
                    <Grid container spacing={2}>
                      <Grid item>{name}</Grid>
                      <Grid item>{distance_miles} miles</Grid>
                      <Grid item>
                        {(time_elapsed_seconds / 60).toFixed()} minutes
                      </Grid>
                    </Grid>
                  </ListItem>
                );
              }
            )}
          </List>
        </Grid>
      )}
    </>
  );
};

export default CommuteCounter;
